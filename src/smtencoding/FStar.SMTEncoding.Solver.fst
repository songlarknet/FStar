﻿(*
   Copyright 2008-2014 Nikhil Swamy and Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module FStar.SMTEncoding.Solver
open FStar.Pervasives
open FStar.Compiler.Effect
open FStar.Compiler.List
open FStar
open FStar.Compiler
open FStar.SMTEncoding.Z3
open FStar.SMTEncoding.Term
open FStar.Compiler.Util
open FStar.Compiler.Hints
open FStar.TypeChecker
open FStar.TypeChecker.Env
open FStar.SMTEncoding
open FStar.SMTEncoding.ErrorReporting
open FStar.SMTEncoding.Util
open FStar.SMTEncoding.Env
open FStar.Class.Show
open FStar.Class.PP
open FStar.Class.Hashable
open FStar.Compiler.RBSet

module BU       = FStar.Compiler.Util
module Env      = FStar.TypeChecker.Env
module Err      = FStar.Errors
module Print    = FStar.Syntax.Print
module Syntax   = FStar.Syntax.Syntax
module TcUtil   = FStar.TypeChecker.Util
module U        = FStar.Syntax.Util
module UC       = FStar.SMTEncoding.UnsatCore
exception SplitQueryAndRetry

let dbg_SMTQuery = Debug.get_toggle "SMTQuery"
let dbg_SMTFail  = Debug.get_toggle "SMTFail"

(****************************************************************************)
(* Hint databases for record and replay (private)                           *)
(****************************************************************************)

// The type definition is now in [FStar.Compiler.Util], since it needs to be visible to
// both the F# and OCaml implementations.

type z3_replay_result = either (option UC.unsat_core), error_labels
let z3_result_as_replay_result = function
    | Inl l -> Inl l
    | Inr (r, _) -> Inr r
let recorded_hints : ref (option hints) = BU.mk_ref None
let replaying_hints: ref (option hints) = BU.mk_ref None

(****************************************************************************)
(* Hint databases (public)                                                  *)
(****************************************************************************)
let initialize_hints_db src_filename format_filename : unit =
    if Options.record_hints() then recorded_hints := Some [];
    let norm_src_filename = BU.normalize_file_path src_filename in
    (*
     * Read the hints file into replaying_hints
     * But it will only be used when use_hints is on
     *)
    let val_filename = Options.hint_file_for_src norm_src_filename in
    begin match read_hints val_filename with
          | HintsOK hints ->
            let expected_digest = BU.digest_of_file norm_src_filename in
            if Options.hint_info()
            then begin
                    BU.print3 "(%s) digest is %s from %s.\n" norm_src_filename
                        (if hints.module_digest = expected_digest
                         then "valid; using hints"
                         else "invalid; using potentially stale hints")
                         val_filename
                 end;
                 replaying_hints := Some hints.hints

          | MalformedJson ->
            if Options.use_hints () then
              Err.log_issue_text Range.dummyRange
                            (Err.Warning_CouldNotReadHints,
                             BU.format1 "Malformed JSON hints file: %s; ran without hints"
                                       val_filename);
            ()

          | UnableToOpen ->
            if Options.use_hints () then
              Err.log_issue_text Range.dummyRange
                            (Err.Warning_CouldNotReadHints,
                             BU.format1 "Unable to open hints file: %s; ran without hints"
                                       val_filename);
            ()
    end

let finalize_hints_db src_filename :unit =
    begin if Options.record_hints () then
          let hints = Option.get !recorded_hints in
          let hints_db = {
                module_digest = BU.digest_of_file src_filename;
                hints = hints
              }  in
          let norm_src_filename = BU.normalize_file_path src_filename in
          let val_filename = Options.hint_file_for_src norm_src_filename in
          write_hints val_filename hints_db
    end;
    recorded_hints := None;
    replaying_hints := None

let with_hints_db fname f =
    initialize_hints_db fname false;
    let result = f () in
    // for the moment, there should be no need to trap exceptions to finalize the hints db
    // no cleanup needs to occur if an error occurs.
    finalize_hints_db fname;
    result

let filter_using_facts_from_aux
      (e:FStar.SMTEncoding.Env.env_t)
      (theory:list decl)
: list decl
= let matches_fact_ids (include_assumption_names:BU.smap bool) (a:Term.assumption) =
    match a.assumption_fact_ids with
    | [] -> true //retaining `a` because it is not tagged with a fact id
    | _ ->
      a.assumption_fact_ids 
      |> BU.for_some (function Name lid -> Env.should_enc_lid e.tcenv lid | _ -> false)
      || Option.isSome (BU.smap_try_find include_assumption_names a.assumption_name)
  in
  //theory can have ~10k elements; fold_right on it is dangerous, since it's not tail recursive
  //AR: reversing the list is also crucial for correctness because of RetainAssumption
  //    specifically (RetainAssumption a) comes after (a) in the theory list
  //    as a result, it is crucial that we consider the (RetainAssumption a) before we encounter (a)
  let theory_rev = List.rev theory in  //List.rev is already the tail recursive version of rev
  let include_assumption_names =
      //this map typically grows to 10k+ elements
      //using a map for it is important, otherwise the list scanning
      //becomes near quadratic in the # of facts
      BU.smap_create 10000
  in
  let keep_decl :decl -> bool = function  //effectful function, adds decls to the include_assumption_names map
    | Assume a -> matches_fact_ids include_assumption_names a
    | RetainAssumptions names ->
      List.iter (fun x -> BU.smap_add include_assumption_names x true) names;
      true
    | Module _ -> failwith "Solver.fs::keep_decl should never have been called with a Module decl"
    | _ -> true
  in
  let keep =
    List.fold_left
      (fun keep d ->
        match d with
        | Module (name, decls) ->
          let keep_decls_rev =
            decls |> 
            List.rev |>
            List.filter keep_decl
          in
          let keep = Module (name, List.rev keep_decls_rev)::keep in
          keep
        | _ ->
          if keep_decl d
          then d::keep
          else keep)
      []
      theory_rev
  in
  keep

// let filter_using_facts_from (e:env_t) 
//                             (pruned_context:option (list Ident.lident)) 
//                             (all_decls:option (list decl))
//                             (theory:list decl)
// : filtered_theory
// = let keep, discard = filter_using_facts_from_aux e pruned_context theory in
//   let keep_sim =
//     match all_decls, pruned_context with
//     | Some all_decls, Some _ -> 
//       let keep, _ = filter_using_facts_from_aux e pruned_context all_decls in
//       List.collect names_of_decl keep |> Some
//     | _ -> None
//   in
//   { keep; discard; keep_sim; used_unsat_core = false }
  

(***********************************************************************************)
(* Invoking the SMT solver and extracting an error report from the model, if any   *)
(***********************************************************************************)
type errors = {
    error_reason:string;
    error_fuel: int;
    error_ifuel: int;
    error_hint: option (list string);
    error_messages: list Errors.error;
}

let error_to_short_string err =
    BU.format4 "%s (fuel=%s; ifuel=%s%s)"
            err.error_reason
            (string_of_int err.error_fuel)
            (string_of_int err.error_ifuel)
            (if Option.isSome err.error_hint then "; with hint" else "")

let error_to_is_timeout err =
    if BU.ends_with err.error_reason "canceled"
    then [BU.format4 "timeout (fuel=%s; ifuel=%s; %s)"
            err.error_reason
            (string_of_int err.error_fuel)
            (string_of_int err.error_ifuel)
            (if Option.isSome err.error_hint then "with hint" else "")]
    else []

type query_settings = {
    query_env:env_t;
    query_decl:decl;
    query_name:string;
    query_index:int;
    query_range:Range.range;
    query_fuel:int;
    query_ifuel:int;
    query_rlimit:int;
    query_hint:option UC.unsat_core;
    query_errors:list errors;
    query_all_labels:error_labels;
    query_suffix:list decl;
    query_hash:option string;
    query_can_be_split_and_retried:bool;
    query_term: FStar.Syntax.Syntax.term;
}

(* Translation from F* rlimit units to Z3 rlimit units.

This used to be defined as exactly 544656 since that roughtly
corresponded to 5 seconds in some "blessed" setting. But rlimit units
are only very roughly correlated to time, and having this very non-round
number makes reading SMT query dumps pretty confusing. So, for new
solvers, we now just make it 500k. *)
let convert_rlimit (r : int) : int =
  let open FStar.Mul in
  if Misc.version_ge (Options.z3_version ()) "4.12.3" then
    500000 * r
  else
    544656 * r

//surround the query with fuel options and various diagnostics
let with_fuel_and_diagnostics settings label_assumptions =
    let n = settings.query_fuel in
    let i = settings.query_ifuel in
    let rlimit = convert_rlimit settings.query_rlimit in
    [  //fuel and ifuel settings
        Term.Caption (BU.format2 "<fuel='%s' ifuel='%s'>"
                        (string_of_int n)
                        (string_of_int i));
        Util.mkAssume(mkEq(mkApp("MaxFuel", []), n_fuel n), None, "@MaxFuel_assumption");
        Util.mkAssume(mkEq(mkApp("MaxIFuel", []), n_fuel i), None, "@MaxIFuel_assumption");
        settings.query_decl        //the query itself
    ]
    @label_assumptions         //the sub-goals that are currently disabled
    @[  Term.SetOption ("rlimit", string_of_int rlimit); //the rlimit setting for the check-sat
        Term.CheckSat; //go Z3!
        Term.SetOption ("rlimit", "0"); //back to using infinite rlimit
        Term.GetReasonUnknown; //explain why it failed
        Term.GetUnsatCore; //for proof profiling, recording hints etc
    ]
    @(if (Options.print_z3_statistics() ||
          Options.query_stats ()) then [Term.GetStatistics] else []) //stats
    @settings.query_suffix //recover error labels and a final "Done!" message


let used_hint s = Option.isSome s.query_hint

let get_hint_for qname qindex =
    match !replaying_hints with
    | Some hints ->
      BU.find_map hints (function
        | Some hint when hint.hint_name=qname && hint.hint_index=qindex -> Some hint
        | _ -> None)
    | _ -> None

let query_errors settings z3result =
    match z3result.z3result_status with
    | UNSAT _ -> None
    | _ ->
     let msg, error_labels = Z3.status_string_and_errors z3result.z3result_status in
     let err =  {
            error_reason = msg;
            error_fuel = settings.query_fuel;
            error_ifuel = settings.query_ifuel;
            error_hint = settings.query_hint;
            error_messages =
               error_labels |>
               List.map (fun (_, x, y) -> Errors.Error_Z3SolverError,
                                          x,
                                          y,
                                          Errors.get_ctx ()) // FIXME: leaking abstraction
        }
     in
     Some err

let detail_hint_replay settings z3result =
    if used_hint settings
    && Options.detail_hint_replay ()
    then match z3result.z3result_status with
         | UNSAT _ -> ()
         | _failed ->
           let ask_z3 label_assumptions =
               Z3.ask settings.query_range
                      // (filter_assertions settings.query_env (Some settings) settings.query_hint)
                      settings.query_hash
                      settings.query_all_labels
                      (with_fuel_and_diagnostics settings label_assumptions)
                      (BU.format2 "(%s, %s)" settings.query_name (string_of_int settings.query_index))
                      false
                      None
                      // settings.query_hint
           in
           detail_errors true settings.query_env.tcenv settings.query_all_labels ask_z3

let find_localized_errors (errs : list errors) : option errors =
    errs |> List.tryFind (fun err -> match err.error_messages with [] -> false | _ -> true)

let errors_to_report (tried_recovery : bool) (settings : query_settings) : list Errors.error =
    let open FStar.Pprint in
    let open FStar.Errors in
    let format_smt_error (msg:list document) : list document =
      (* This creates an error component with the answers from Z3. Only used
      for --query_stats. *)
      let d =
        doc_of_string "SMT solver says:" ^^
          sublist empty msg ^^
        hardline ^^
        doc_of_string "Note:" ^^
          bulleted [
            text "'canceled' or 'resource limits reached' means the SMT query timed out, so you might want to increase the rlimit";
            text "'incomplete quantifiers' means Z3 could not prove the query, so try to spell out your proof out in greater detail, increase fuel or ifuel";
            text "'unknown' means Z3 provided no further reason for the proof failing"
          ]
      in
      [d] // single error component
    in
    let recovery_failed_msg : Errors.error_message =
      if tried_recovery then
        [text "This query was retried due to the --proof_recovery option, yet it
               still failed on all attempts."]
      else
        []
    in
    let basic_errors =
        (*
         * smt_error is a single error message containing either a multi-line detailed message
         * or a single short component, depending on whether --query_stats is on
         *)
        let smt_error =
          if Options.query_stats () then
            settings.query_errors
            |> List.map error_to_short_string
            |> List.map doc_of_string
            |> format_smt_error
          else
            (*
             * AR: --query_stats is not set, we want to give a succint but helpful diagnosis
             *
             *     settings.query_errors is a list of errors, whose field error_reason contains the strings:
             *       unknown because (incomplete ...) or unknown because (resource ...) or unknown because canceled etc.
             *     it's a list as it contains one element per config (e.g. fuel options)
             *
             *     in the following code we go through the error reasons in all the configs,
             *       and if all the error reasons are the same, we provide a hint for that reason
             *     otherwise we just ask the user to run with --query_stats
             *
             *     as per the smt-lib standard, the possible values of reason-unknown are s-expressions,
             *       that are either non-space strings, or strings with spaces enclosed in parenthesis
             *       (I think), so incomplete or resource messages are in parenthesis, whereas
             *       canceled, timeout, etc. are without
             *)
            let incomplete_count, canceled_count, unknown_count, z3_overflow_bug_count =
              List.fold_left (fun (ic, cc, uc, bc) err ->
                let err = BU.substring_from err.error_reason (String.length "unknown because ") in
                //err is (incomplete quantifiers), (resource ...), canceled, or unknown etc.

                match () with
                | _ when BU.starts_with err "(incomplete" ->
                    (ic + 1, cc, uc, bc)
                | _ when BU.starts_with err "canceled" || BU.starts_with err "(resource" || BU.starts_with err "timeout" ->
                    (ic, cc + 1, uc, bc)
                | _ when BU.starts_with err "Overflow encountered when expanding old_vector" ->
                    (ic, cc, uc, bc + 1)
                | _ ->
                    (ic, cc, uc + 1, bc)  //note this covers unknowns, overflows, etc.
              ) (0, 0, 0, 0) settings.query_errors
            in
            (* If we notice the z3 overflow bug, add a separate error to warn the user. *)
            if z3_overflow_bug_count > 0 then
              Errors.log_issue_doc settings.query_range (Errors.Warning_UnexpectedZ3Stderr, [
                text "Z3 ran into an internal overflow while trying to prove this query.";
                text "Try breaking it down, or using --split_queries."
              ]);
            let base =
              match incomplete_count, canceled_count, unknown_count with
              | _, 0, 0 when incomplete_count > 0 -> [text "The SMT solver could not prove the query. Use --query_stats for more details."]
              | 0, _, 0 when canceled_count > 0   -> [text "The SMT query timed out, you might want to increase the rlimit"]
              | _, _, _                           -> [text "Try with --query_stats to get more details"]
            in
            base @ recovery_failed_msg
        in
        match find_localized_errors settings.query_errors, settings.query_all_labels with
        | Some err, _ ->
          // FStar.Errors.log_issue settings.query_range (FStar.Errors.Warning_SMTErrorReason, smt_error);
          FStar.TypeChecker.Err.errors_smt_detail settings.query_env.tcenv err.error_messages smt_error

        | None, [(_, msg, rng)] ->
          //we have a unique label already; just report it
          FStar.TypeChecker.Err.errors_smt_detail
                     settings.query_env.tcenv
                     [(Error_Z3SolverError, msg, rng, get_ctx())]
                     recovery_failed_msg

        | None, _ ->
          //We didn't get a useful countermodel from Z3 to localize an error
          //so, split the query into N unique queries and try again
            if settings.query_can_be_split_and_retried
            then raise SplitQueryAndRetry
            else (
              //if it can't be split further, report all its labels as potential failures
              //typically there will be only 1 label
              let l = List.length settings.query_all_labels in
              let labels =
                if l = 0
                then (
                  //this should really never happen, but if it does, we have a query
                  //with no labeled sub-goals and so no error location to report.
                  //So, print the source location and the query term itself
                  let dummy_fv = Term.mk_fv ("", dummy_sort) in
                  let msg = [
                    Errors.Msg.text "Failed to prove the following goal, although it appears to be trivial:"
                      ^/^ pp settings.query_term;
                  ]
                  in
                  let range = Env.get_range settings.query_env.tcenv in
                  [dummy_fv, msg, range]
                )
                else if l > 1
                then (
                  //we have a non-unique label despite splitting
                  //this CAN happen, e.g., if the original query term is a `match`
                  //In this case, we couldn't split it and then if it fails without producing a model,
                  //we blame all the labels in the query. So warn about the imprecision, unless the
                  //use opted into --split_queries no.
                  if Options.split_queries () <> Options.No then
                    FStar.TypeChecker.Err.log_issue_text
                         settings.query_env.tcenv
                         (Env.get_range settings.query_env.tcenv)
                         (Warning_SplitAndRetryQueries,
                           "The verification condition was to be split into several atomic sub-goals, \
                            but this query has multiple sub-goals---the error report may be inaccurate");
                  settings.query_all_labels
                )
                else settings.query_all_labels
              in
              labels |>
                 List.collect (fun (_, msg, rng) ->
                   FStar.TypeChecker.Err.errors_smt_detail
                     settings.query_env.tcenv
                     [(Error_Z3SolverError, msg, rng, get_ctx())]
                     recovery_failed_msg
                     )
            )
    in
    let detailed_errors : unit =
      if Options.detail_errors()
      then let initial_fuel = {
                  settings with query_fuel=Options.initial_fuel();
                                query_ifuel=Options.initial_ifuel();
                                query_hint=None
              }
           in
           let ask_z3 label_assumptions =
              Z3.ask  settings.query_range
                      // (filter_using_facts_from settings.query_env settings.query_pruned_context)
                      settings.query_hash
                      settings.query_all_labels
                      (with_fuel_and_diagnostics initial_fuel label_assumptions)
                      (BU.format2 "(%s, %s)" settings.query_name (string_of_int settings.query_index))
                      false
                      None
              in
           (* GM: This is a bit of hack, we don't return these detailed errors
            * (it implies rewriting detail_errors heavily). Returning them
            * is only relevant for summarizing errors on --quake, where I don't
            * think we care about these. *)
           detail_errors false settings.query_env.tcenv settings.query_all_labels ask_z3
    in
    basic_errors

let report_errors tried_recovery qry_settings =
    FStar.Errors.add_errors (errors_to_report tried_recovery qry_settings)


type unique_string_accumulator = {
  add: string -> unit;
  get: unit -> list string;
  clear: unit -> unit
}

(* A generic accumulator of unique strings,
   extracted in sorted order *)
let mk_unique_string_accumulator ()
: unique_string_accumulator
= let strings = BU.mk_ref [] in
  let add m =
    let ms = !strings in
    if List.contains m ms then ()
    else strings := m :: ms
  in
  let get () = 
    !strings |> BU.sort_with String.compare
  in
  let clear () = strings := [] in
  { add ; get; clear }

let query_info settings z3result =
    let process_unsat_core (core:option UC.unsat_core) =
       (* Accumulator for module names *)
       let { add=add_module_name; get=get_module_names } =
         mk_unique_string_accumulator ()
       in
       let add_module_name s =
         add_module_name s
      in
       (* Accumulator for discarded names *)
       let { add=add_discarded_name; get=get_discarded_names } =
         mk_unique_string_accumulator ()
       in
       (* SMT Axioms are named using an ad hoc naming convention
          that includes the F* source name within it.

          This function reversed the naming convention to extract
          the source name of the F* entity from `s`, an axiom name
          mentioned in an unsat core (but also in smt.qi.profile, etc.)

          The basic structure of the name is

            <lowercase_prefix><An F* lid, i.e., a dot-separated name beginning with upper case letter><some reserved suffix>

          So, the code below strips off the <lowercase_prefix>
          and any of the reserved suffixes.

          What's left is an F* name, which can be decomposed as usual
          into a module name + a top-level identifier
       *)
       let parse_axiom_name (s:string) =
            // BU.print1 "Parsing axiom name <%s>\n" s;
            let chars = String.list_of_string s in
            let first_upper_index =
                BU.try_find_index BU.is_upper chars
            in
            match first_upper_index with
            | None ->
              //Has no embedded F* name (discard it, and record it in the discarded set)
              add_discarded_name s;
              []
            | Some first_upper_index ->
                let name_and_suffix = BU.substring_from s first_upper_index in
                let components = String.split ['.'] name_and_suffix in
                let excluded_suffixes =
                    [ "fuel_instrumented";
                      "_pretyping";
                      "_Tm_refine";
                      "_Tm_abs";
                      "@";
                      "_interpretation_Tm_arrow";
                      "MaxFuel_assumption";
                      "MaxIFuel_assumption";
                    ]
                in
                let exclude_suffix s =
                    let s = BU.trim_string s in
                    let sopt =
                        BU.find_map
                            excluded_suffixes
                            (fun sfx ->
                                if BU.contains s sfx
                                then Some (List.hd (BU.split s sfx))
                                else None)
                    in
                    match sopt with
                    | None -> if s = "" then [] else [s]
                    | Some s -> if s = "" then [] else [s]
                in
                let components =
                    match components with
                    | [] -> []
                    | _ ->
                      let lident, last = BU.prefix components in
                      let components = lident @ exclude_suffix last in
                      let module_name = components |> BU.prefix_until (fun s -> not <| BU.is_upper (BU.char_at s 0)) in
                      let _ =
                          match module_name with
                          | None -> ()
                          | Some (m, _, _) -> add_module_name (String.concat "." m)
                      in
                      components
                in
                if components = []
                then (add_discarded_name s; [])
                else [ components |> String.concat "."]
        in
        let should_log = Options.hint_info () || Options.query_stats () in
        let maybe_log (f:unit -> unit) = if should_log then f () in
        match core with
        | None ->
           maybe_log <| (fun _ -> BU.print_string "no unsat core\n")
        | Some core ->
           let core = List.collect parse_axiom_name core in
           maybe_log <| (fun _ ->
            BU.print1 "Z3 Proof Stats: Modules relevant to this proof:\nZ3 Proof Stats:\t%s\n"
                      (get_module_names() |> String.concat "\nZ3 Proof Stats:\t");
            BU.print1 "Z3 Proof Stats (Detail 1): Specifically:\nZ3 Proof Stats (Detail 1):\t%s\n"
                      (String.concat "\nZ3 Proof Stats (Detail 1):\t" core);
            BU.print1 "Z3 Proof Stats (Detail 2): Note, this report ignored the following names in the context: %s\n"
                      (get_discarded_names() |> String.concat ", "))
    in
    if Options.hint_info()
    || Options.query_stats()
    then begin
        let status_string, errs = Z3.status_string_and_errors z3result.z3result_status in
        let at_log_file =
            match z3result.z3result_log_file with
            | None -> ""
            | Some s -> "@"^s
        in
        let tag, core = match z3result.z3result_status with
         | UNSAT core -> BU.colorize_green "succeeded", core
         | _ -> BU.colorize_red ("failed {reason-unknown=" ^ status_string ^ "}"), None
        in
        let range = "(" ^ show settings.query_range ^ at_log_file ^ ")" in
        let used_hint_tag = if used_hint settings then " (with hint)" else "" in
        let stats =
            if Options.query_stats() then
                let f k v a = a ^ k ^ "=" ^ v ^ " " in
                let str = smap_fold z3result.z3result_statistics f "statistics={" in
                    (substring str 0 ((String.length str) - 1)) ^ "}"
            else "" in
        BU.print "%s\tQuery-stats (%s, %s)\t%s%s in %s milliseconds with fuel %s and ifuel %s and rlimit %s\n"
             [  range;
                settings.query_name;
                show settings.query_index;
                tag;
                used_hint_tag;
                show z3result.z3result_time;
                show settings.query_fuel;
                show settings.query_ifuel;
                show (settings.query_rlimit);
                // stats
             ];
        if Options.print_z3_statistics () then process_unsat_core core;
        errs |> List.iter (fun (_, msg, range) ->
            let msg = if used_hint settings then Pprint.doc_of_string "Hint-replay failed" :: msg else msg in
            FStar.Errors.log_issue_doc range (FStar.Errors.Warning_HitReplayFailed, msg))
    end
    else if Options.ext_getv "profile_context" <> ""
    then match z3result.z3result_status with
         | UNSAT core -> process_unsat_core core
         | _ -> ()

//caller must ensure that the recorded_hints is already initiailized
let store_hint hint =
  match !recorded_hints with
  | Some l -> recorded_hints := Some (l@[Some hint])
  | _ -> assert false; ()

let record_hint settings z3result =
    if not (Options.record_hints()) then () else
    begin
      let mk_hint core = {
                  hint_name=settings.query_name;
                  hint_index=settings.query_index;
                  fuel=settings.query_fuel;
                  ifuel=settings.query_ifuel;
                  unsat_core=core;
                  query_elapsed_time=0; //recording the elapsed_time prevents us from reaching a fixed point
                  hash=(match z3result.z3result_status with
                        | UNSAT core -> z3result.z3result_query_hash
                        | _ -> None)
          }
      in
      match z3result.z3result_status with
      | UNSAT None ->
        // we succeeded by just matching a query hash
        store_hint (Option.get (get_hint_for settings.query_name settings.query_index))
      | UNSAT unsat_core ->
        if used_hint settings //if we already successfully use a hint
        then //just re-use the successful hint, but record the hash of the pruned theory
             store_hint (mk_hint settings.query_hint)
        else store_hint (mk_hint unsat_core)          //else store the new unsat core
      | _ ->  () //the query failed, so nothing to do
    end

let process_result settings result : option errors =
    let errs = query_errors settings result in
    query_info settings result;
    record_hint settings result;
    detail_hint_replay settings result;
    errs

// Attempts to solve each query setting (in `qs`) sequentially until
// one succeeds. If one succeeds, we are done and report no errors. If
// all of them fail, we return the list of errors so they can be displayed
// to the user later.
// Returns Inr cfg if successful, with the succeeding config cfg
// and Inl errs if all options were exhausted
// without a success, where errs is the list of errors each query
// returned.
let fold_queries (qs:list query_settings)
                 (ask:query_settings -> z3result)
                 (f:query_settings -> z3result -> option errors)
                 : either (list errors) query_settings =
    let rec aux (acc : list errors) qs : either (list errors) query_settings =
        match qs with
        | [] -> Inl acc
        | q::qs ->
          let res = ask q in
          begin match f q res with
          | None -> Inr q //done
          | Some errs ->
            aux (errs::acc) qs
          end
    in
    aux [] qs

let full_query_id settings =
    "(" ^ settings.query_name ^ ", " ^ (BU.string_of_int settings.query_index) ^ ")"

let collect_dups (l : list 'a) : list ('a & int) =
    let acc : list ('a & int) = [] in
    let rec add_one acc x =
        match acc with
        | [] -> [(x, 1)]
        | (h, n)::t ->
            if h = x
            then (h, n+1)::t
            else (h, n) :: add_one t x
    in
    List.fold_left add_one acc l


(* An answer for an "ask" to the solver. The ok boolean marks whether
it succeeded or not. The rest is only used for error reporting. *)
type answer = {
    ok                  : bool;
    (* ^ Query was proven *)
    cache_hit           : bool;
    (* ^ Got result from cache. Currently, this also implies
    ok=true (we don't cache failed queries), but don't count
    on it. *)

    quaking             : bool;
    (* ^ Were we quake testing? *)
    quaking_or_retrying : bool;
    (* ^ Were we quake testing *or* retrying? *)
    lo                  : int;
    (* ^ Lower quake bound. *)
    hi                  : int;
    (* ^ Higher quake bound. *)
    nsuccess            : int;
    (* ^ Number of successful attempts. Can be >1 when quaking. *)
    total_ran           : int;
    (* ^ Total number of queries made. *)
    tried_recovery      : bool;
    (* ^ Did we try using --proof_recovery for this? *)

    errs                : list (list errors); // mmm... list list?
    (* ^ Errors from SMT solver. *)
}

let ans_ok : answer = {
    ok                  = true;
    cache_hit           = false;
    nsuccess            = 1;
    lo                  = 1;
    hi                  = 1;
    errs                = [];
    quaking             = false;
    quaking_or_retrying = false;
    total_ran           = 1;
    tried_recovery      = false;
}

let ans_fail : answer =
  { ans_ok with ok = false; nsuccess = 0 }

instance _ : showable answer = {
  show = (fun ans -> BU.format5 "ok=%s nsuccess=%s lo=%s hi=%s tried_recovery=%s"
                            (show ans.ok)
                            (show ans.nsuccess)
                            (show ans.lo)
                            (show ans.hi)
                            (show ans.tried_recovery));
}

let make_solver_configs
    (can_split : bool)
    (is_retry : bool)
    (env : env_t)
    (all_labels : error_labels)
    (prefix : list decl)
    (query : decl)
    (query_term : Syntax.term)
    (suffix : list decl)
 : (list query_settings & option hint)
 =
    (* Fetch the settings. *)
    let default_settings, next_hint =
        let qname, index =
            match env.tcenv.qtbl_name_and_index with
            | None, _ -> failwith "No query name set!"
            | Some (q, _typ, n), _ -> Ident.string_of_lid q, n
        in
        let rlimit =
            let open FStar.Mul in
            Options.z3_rlimit_factor () * Options.z3_rlimit ()
        in
        let next_hint = get_hint_for qname index in
        let default_settings = {
            query_env=env;
            query_decl=query;
            query_name=qname;
            query_index=index;
            query_range=Env.get_range env.tcenv;
            query_fuel=Options.initial_fuel();
            query_ifuel=Options.initial_ifuel();
            query_rlimit=rlimit;
            query_hint=None;
            query_errors=[];
            query_all_labels=all_labels;
            query_suffix=suffix;
            query_hash=(match next_hint with
                        | None -> None
                        | Some {hash=h} -> h);
            query_can_be_split_and_retried=can_split;
            query_term=query_term;
        } in
        default_settings, next_hint
    in

    (* Fetch hints, if any. *)
    let use_hints_setting =
        if Options.use_hints () && next_hint |> is_some
        then
            let ({unsat_core=Some core; fuel=i; ifuel=j; hash=h}) = next_hint |> must in
            [{default_settings with query_hint=Some core;
                                    query_fuel=i;
                                    query_ifuel=j}]
        else []
    in

    let initial_fuel_max_ifuel =
        if Options.max_ifuel() > Options.initial_ifuel()
        then [{default_settings with query_ifuel=Options.max_ifuel()}]
        else []
    in

    let half_max_fuel_max_ifuel =
        if Options.max_fuel() / 2 >  Options.initial_fuel()
        then [{default_settings with query_fuel=Options.max_fuel() / 2;
                                     query_ifuel=Options.max_ifuel()}]
        else []
    in

    let max_fuel_max_ifuel =
      if Options.max_fuel()    >  Options.initial_fuel()
      && Options.max_ifuel()   >=  Options.initial_ifuel()
      then [{default_settings with query_fuel=Options.max_fuel();
                                   query_ifuel=Options.max_ifuel()}]
      else []
    in
    let cfgs =
      if is_retry
      then [default_settings]
      else
        use_hints_setting
        @ [default_settings]
        @ initial_fuel_max_ifuel
        @ half_max_fuel_max_ifuel
        @ max_fuel_max_ifuel
    in
    (cfgs, next_hint)

(* Returns Inl with errors, or Inr with the stats provided by the solver.
Not to be used directly, see ask_solver below. *)
let __ask_solver
    (configs : list query_settings)
 : either (list errors) query_settings
 =
    let check_one_config config : z3result =
          if Options.z3_refresh()
          then (
            Z3.refresh (Some config.query_env.tcenv.proof_ns)
          );
          Z3.ask config.query_range
                  config.query_hash
                  config.query_all_labels
                  (with_fuel_and_diagnostics config [])
                  (BU.format2 "(%s, %s)" config.query_name (string_of_int config.query_index))
                  (used_hint config)
                  config.query_hint
    in

    fold_queries configs check_one_config process_result

(* Ask a query to the solver, running it potentially multiple times
if --quake is specified. This function is always called, but when
--quake is off, it's really just a call to __ask_solver (and then
creating an [answer] record). *)
let ask_solver_quake
    (configs : list query_settings)
 : answer
 =
    let lo   = Options.quake_lo () in
    let hi   = Options.quake_hi () in
    let seed = Options.z3_seed () in

    let default_settings = List.hd configs in
    let name = full_query_id default_settings in
    let quaking = hi > 1 && not (Options.retry ()) in
    let quaking_or_retrying = hi > 1 in
    let hi = if hi < 1 then 1 else hi in
    let lo =
        if lo < 1 then 1
        else if lo > hi then hi
        else lo
    in
    let run_one (seed:int) : either (list errors) query_settings =
        (* Here's something annoying regarding --quake:
         *
         * In normal circumstances, we can just run the query again and get
         * a slightly different behaviour because of Z3 accumulating some
         * internal state that doesn't get erased on a (pop). So we simply repeat
         * the query then.
         *
         * But, if we're doing --z3refresh, we will always get the exact
         * same behaviour by doing that, so we do want to set the seed in this case.
         *
         * Why not always set it? Because it requires restarting the solver, which
         * takes a long time.
         *
         * Why not use the (set-option smt.random_seed ..) command? Because
         * it seems to have no effect just before a (check-sat), so it needs to be
         * set early, which basically implies restarting.
         *
         * So we do this horrendous thing.
         *)
        if Options.z3_refresh ()
        then Options.with_saved_options (fun () ->
               Options.set_option "z3seed" (Options.Int seed);
               __ask_solver configs)
        else __ask_solver configs
    in
    let rec fold_nat' (f : 'a -> int -> 'a) (acc : 'a) (lo : int) (hi : int) : 'a =
        if lo > hi
        then acc
        else fold_nat' f (f acc lo) (lo + 1) hi
    in
    let best_fuel = BU.mk_ref None in
    let best_ifuel = BU.mk_ref None in
    let maybe_improve (r:ref (option int)) (n:int) : unit =
        match !r with
        | None -> r := Some n
        | Some m -> if n < m then r := Some n
    in
    let nsuccess, nfailures, rs =
        fold_nat'
            (fun (nsucc, nfail, rs) n ->
                 if not (Options.quake_keep ())
                    && (nsucc >= lo (* already have enough successes *)
                        || nfail > hi-lo) (* already have too many failures *)
                 then (nsucc, nfail, rs)
                 else begin
                 if quaking_or_retrying
                    && (Options.interactive () || Debug.any ()) (* only on emacs or when debugging *)
                    && n>0 then (* no need to print last *)
                   BU.print5 "%s: so far query %s %sfailed %s (%s runs remain)\n"
                       (if quaking then "Quake" else "Retry")
                       name
                       (if quaking then BU.format1 "succeeded %s times and " (string_of_int nsucc) else "")
                       (* ^ if --retrying, it does not make sense to print successes since
                        * they must be exactly 0 *)
                       (if quaking then string_of_int nfail else string_of_int nfail ^ " times")
                       (string_of_int (hi-n));
                 let r = run_one (seed+n) in
                 let nsucc, nfail =
                    match r with
                    | Inr cfg ->
                        (* Maybe update best fuels that worked. *)
                        maybe_improve best_fuel cfg.query_fuel;
                        maybe_improve best_ifuel cfg.query_ifuel;
                        nsucc + 1, nfail
                    | _ -> nsucc, nfail+1
                 in
                 (nsucc, nfail, r::rs)
                 end)
            (0, 0, []) 0 (hi-1)
    in
    let total_ran = nsuccess + nfailures in

    (* Print a diagnostic for --quake *)
    if quaking then begin
        let fuel_msg =
          match !best_fuel, !best_ifuel with
          | Some f, Some i ->
            BU.format2 " (best fuel=%s, best ifuel=%s)" (string_of_int f) (string_of_int i)
          | _, _ -> ""
        in
        BU.print5 "Quake: query %s succeeded %s/%s times%s%s\n"
                  name
                  (string_of_int nsuccess)
                  (string_of_int total_ran)
                  (if total_ran < hi then " (early finish)" else "")
                  fuel_msg
    end;
    let all_errs = List.concatMap (function | Inr _ -> []
                                            | Inl es -> [es]) rs
    in
    (* Return answer *)
    { ok                  = nsuccess >= lo
    ; cache_hit           = false
    ; nsuccess            = nsuccess
    ; lo                  = lo
    ; hi                  = hi
    ; errs                = all_errs
    ; total_ran           = total_ran
    ; quaking_or_retrying = quaking_or_retrying
    ; quaking             = quaking
    ; tried_recovery      = false (* possibly set by caller *)
    }

(* A very simple command language for recovering, though keep in
mind its execution is stateful in the sense that anything after a
(RestartSolver h) will run in the new solver instance. *)
type recovery_hammer =
  | IncreaseRLimit of (*factor : *)int
  | RestartAnd of recovery_hammer

let rec pp_hammer (h : recovery_hammer) : Pprint.document =
  let open FStar.Errors.Msg in
  let open FStar.Pprint in
  match h with
  | IncreaseRLimit factor ->
    text "increasing its rlimit by" ^/^ pp factor ^^ doc_of_string "x"
  | RestartAnd h ->
    text "restarting the solver and" ^/^ pp_hammer h

(* If --proof_recovery is on, then we retry the query multiple
times, increasing rlimits, until we get a success. If not, we just
call ask_solver_quake. *)
let ask_solver_recover
    (configs : list query_settings)
 : answer
 =
  let open FStar.Pprint in
  let open FStar.Errors.Msg in
  let open FStar.Class.PP in
  if Options.proof_recovery () then (
    let r = ask_solver_quake configs in
    if r.ok then r else (
      let restarted = BU.mk_ref false in
      let cfg = List.last configs in

      Errors.diag_doc cfg.query_range [
        text "This query failed to be solved. Will now retry with higher rlimits due to --proof_recovery.";
      ];

      let try_factor (n:int) : answer =
        let open FStar.Mul in
        Errors.diag_doc cfg.query_range [text "Retrying query with rlimit factor" ^/^ pp n];
        let cfg = { cfg with query_rlimit = n * cfg.query_rlimit } in
        ask_solver_quake [cfg]
      in

      let rec try_hammer (h : recovery_hammer) : answer =
        match h with
        | IncreaseRLimit factor -> try_factor factor
        | RestartAnd h ->
          Errors.diag_doc cfg.query_range [text "Trying a solver restart"];
          cfg.query_env.tcenv.solver.refresh (Some cfg.query_env.tcenv.proof_ns);
          try_hammer h
      in

      let rec aux (hammers : list recovery_hammer) : answer =
        match hammers with
        | [] -> { r with tried_recovery = true }
        | h::hs ->
          let r = try_hammer h in
          if r.ok then (
            Errors.log_issue_doc cfg.query_range (Errors.Warning_ProofRecovery, [
               text "This query succeeded after " ^/^ pp_hammer h;
               text "Increase the rlimit in the file or simplify the proof. \
                     This is only succeeding due to --proof_recovery being given."
               ]);
            r
          ) else
            aux hs
      in
      aux [
        IncreaseRLimit 2;
        IncreaseRLimit 4;
        IncreaseRLimit 8;
        RestartAnd (IncreaseRLimit 8);
      ]
    )
  ) else
    ask_solver_quake configs

let failing_query_ctr : ref int = BU.mk_ref 0

let maybe_save_failing_query (env:env_t) (prefix:list decl) (qs:query_settings) : unit =
  (* Save failing query to a clean file if --log_failing_queries. *)
  if Options.log_failing_queries () then (
    let mod = show (Env.current_module env.tcenv) in
    let n = (failing_query_ctr := !failing_query_ctr + 1; !failing_query_ctr) in
    let file_name = BU.format2 "failedQueries-%s-%s.smt2" mod (show n) in
    let query_str = Z3.ask_text
                            qs.query_range
                            // (filter_assertions qs.query_env None qs.query_hint)
                            qs.query_hash
                            qs.query_all_labels
                            (with_fuel_and_diagnostics qs [])
                            (BU.format2 "(%s, %s)" qs.query_name (string_of_int qs.query_index))
                            qs.query_hint
    in
    write_file file_name query_str;
    ()
  );
  (* Also print it out if --debug SMTFail. *)
  if !dbg_SMTFail then (
    let open FStar.Pprint in
    let open FStar.Class.PP in
    let open FStar.Errors.Msg in
    Errors.diag_doc qs.query_range [
      text "This query failed:";
      pp qs.query_term;
    ]
  );
  ()

let ask_solver
    (env : FStar.SMTEncoding.Env.env_t)
    (prefix : list decl)
    (configs: list query_settings)
    (next_hint : option hint)
 : list query_settings & answer
 =  (* The default config is at the head. We distinguish this one since
    it includes some metadata that we need, such as the query name, etc.
    (Though all other configs also contain it.) *)
    let default_settings = List.hd configs in
    let skip : bool =
        env.tcenv.admit ||
        Env.too_early_in_prims env.tcenv   ||
        (match Options.admit_except () with
         | Some id ->
           if BU.starts_with id "("
           then full_query_id default_settings <> id
           else default_settings.query_name <> id
         | None -> false)
    in
    let ans =
      if skip
      then (
        if Options.record_hints () && next_hint |> is_some then
          //restore the hint as is, cf. #1651
          next_hint |> must |> store_hint;
        ans_ok
      ) else (
        // Feed the context of the query to the solver. We do this only
        // once for every VC. Every actual query will push and pop
        // whatever else they encode.
        Z3.giveZ3 prefix;
        let ans = ask_solver_recover configs in
        let cfg = List.last configs in
        if not ans.ok then
          maybe_save_failing_query env prefix cfg;
        ans

      )
    in
    configs, ans

(* Reports query errors to the user. The errors are logged, not raised. *)
let report (env:Env.env) (default_settings : query_settings) (a : answer) : unit =
    let nsuccess = a.nsuccess in
    let name = full_query_id default_settings in
    let lo = a.lo in
    let hi = a.hi in
    let total_ran = a.total_ran in
    let all_errs = a.errs in
    let quaking_or_retrying = a.quaking_or_retrying in
    let quaking = a.quaking in
    (* If nsuccess < lo, we have a failure. We report summarized
     * information if doing --quake (and not --query_stats) *)
    if nsuccess < lo then begin
      if quaking_or_retrying && not (Options.query_stats ()) then begin
        let errors_to_report errs =
            errors_to_report a.tried_recovery ({default_settings with query_errors=errs})
        in

        (* Obtain all errors that would have been reported *)
        let errs = List.map errors_to_report all_errs in
        (* Summarize them *)
        let errs = errs |> List.flatten |> collect_dups in
        (* Show the amount on each error *)
        let errs = errs |> List.map (fun ((e, m, r, ctx), n) ->
            let m =
              let open FStar.Pprint in
              if n > 1
              then m @ [doc_of_string (format1 "Repeated %s times" (string_of_int n))]
              else m
            in
            (e, m, r, ctx))
        in
        (* Now report them *)
        FStar.Errors.add_errors errs;

        (* Adding another explanatory error for the threshold if --quake is on
        * (but not for --retry) *)
        if quaking then begin
          (* Get the range of the lid we're checking for the quake error *)
          let rng = match fst (env.qtbl_name_and_index) with
                    | Some (l, _, _) -> Ident.range_of_lid l
                    | _ -> Range.dummyRange
          in
          FStar.TypeChecker.Err.log_issue
            env rng
            (Errors.Error_QuakeFailed, [
              Errors.text <|
              BU.format6
                "Query %s failed the quake test, %s out of %s attempts succeded, \
                 but the threshold was %s out of %s%s"
                 name
                (string_of_int nsuccess)
                (string_of_int total_ran)
                (string_of_int lo)
                (string_of_int hi)
                (if total_ran < hi then " (early abort)" else "")])
        end

      end else begin
        (* Not quaking, or we have --query_stats: just report all errors as usual *)
        let report errs = report_errors a.tried_recovery ({default_settings with query_errors=errs}) in
        List.iter report all_errs
      end
    end

(* This type represents the configuration under which the solver was
_started_. If anything changes, the solver should be restarted for these
settings to take effect. See `maybe_refresh` below. *)
type solver_cfg = {
  seed             : int;
  cliopt           : list string;
  smtopt           : list string;
  facts            : list (list string & bool);
  valid_intro      : bool;
  valid_elim       : bool;
  z3version        : string;
  context_pruning  : bool
}

let _last_cfg : ref (option solver_cfg) = BU.mk_ref None

let get_cfg env : solver_cfg =
    { seed             = Options.z3_seed ()
    ; cliopt           = Options.z3_cliopt ()
    ; smtopt           = Options.z3_smtopt ()
    ; facts            = env.proof_ns
    ; valid_intro      = Options.smtencoding_valid_intro ()
    ; valid_elim       = Options.smtencoding_valid_elim ()
    ; z3version        = Options.z3_version ()
    ; context_pruning  = Options.ext_getv "context_pruning" <> ""
    }

let save_cfg env =
    _last_cfg := Some (get_cfg env)

(* If the the solver's configuration has changed, then restart it so
it can take on the new values. *)
let maybe_refresh_solver env =
    match !_last_cfg with
    | None -> save_cfg env
    | Some cfg ->
        if cfg <> get_cfg env then (
          save_cfg env;
          Z3.refresh (Some env.proof_ns)
        )

let finally (h : unit -> unit) (f : unit -> 'a) : 'a =
  let r =
    try f () with
    | e -> h(); raise e
  in
  h (); r

(* The query_settings list is non-empty unless the query was trivial. *)
let encode_and_ask (can_split:bool) (is_retry:bool) use_env_msg tcenv q : (list query_settings & answer) =
  let do () : list query_settings & answer =
    maybe_refresh_solver tcenv;
    let msg =  (BU.format1 "Starting query at %s" (Range.string_of_range <| Env.get_range tcenv)) in
    Encode.push_encoding_state msg;
    let prefix, labels, qry, suffix = Encode.encode_query use_env_msg tcenv q in
    Z3.push msg;
    if Options.ext_getv "context_pruning" <> "" then Z3.prune (qry::prefix@suffix);
    let pop () = 
      let msg = (BU.format1 "Ending query at %s" (Range.string_of_range <| Env.get_range tcenv)) in
      Encode.pop_encoding_state msg;
      Z3.pop msg
    in
    finally pop (fun () ->
      let tcenv = incr_query_index tcenv in
      match qry with
      (* trivial cases *)
      | Assume({assumption_term={tm=App(FalseOp, _)}}) -> ([], ans_ok)
      | _ when tcenv.admit -> ([], ans_ok)

      | Assume _ ->
        if (is_retry || Options.split_queries() = Options.Always)
        && Debug.any()
        then (
          let n = List.length labels in
          if n <> 1
          then
            FStar.Errors.diag
                (Env.get_range tcenv)
                (BU.format3 "Encoded split query %s\nto %s\nwith %s labels"
                          (Print.term_to_string q)
                          (Term.declToSmt "" qry)
                          (BU.string_of_int n))
        );
        let env = FStar.SMTEncoding.Encode.get_current_env tcenv in
        let configs, next_hint =
          make_solver_configs can_split is_retry env labels prefix qry q suffix
        in
        ask_solver env prefix configs next_hint

      | _ -> failwith "Impossible"
    )
  in
  if Solver.Cache.try_find_query_cache tcenv q then (
    ([], { ans_ok with cache_hit = true })
  ) else (
    let (cfgs, ans) = do () in
    if ans.ok then
      Solver.Cache.query_cache_add tcenv q;
    (cfgs, ans)
  )

(* Asks the solver and reports errors. Does quake if needed. *)
let do_solve (can_split:bool) (is_retry:bool) use_env_msg tcenv q : unit =
  let ans_opt =
    try Some (encode_and_ask can_split is_retry use_env_msg tcenv q) with
    (* Each (potentially splitted) query can fail with this error, raise by encode_query.
     * Note, even though this is a log_issue, the error cannot be turned into a warning
     * nor ignored. *)
    | FStar.SMTEncoding.Env.Inner_let_rec names ->
      FStar.TypeChecker.Err.log_issue
        tcenv tcenv.range
        (Errors.Error_NonTopRecFunctionNotFullyEncoded, [
          Errors.text <|
         BU.format1
           "Could not encode the query since F* does not support precise smtencoding of inner let-recs yet (in this case %s)"
           (String.concat "," (List.map fst names))]);
       None
  in
  match ans_opt with
  | Some (default_settings::_, ans) when not ans.ok ->
    report tcenv default_settings ans

  | Some (_, ans) when ans.ok ->
    () (* trivial or succeeded *)

  | Some ([], ans) when not ans.ok ->
    failwith "impossible: bad answer from encode_and_ask"

  | None -> () (* already logged an error *)

let split_and_solve (retrying:bool) use_env_msg tcenv q : unit =
  if Options.query_stats () then begin
    let range = "(" ^ (Range.string_of_range (Env.get_range tcenv)) ^ ")" in
    BU.print2 "%s\tQuery-stats splitting query because %s\n"
                range
                (if retrying then "retrying failed query" else "--split_queries is always")
  end;
  let goals =
    match Env.split_smt_query tcenv q with
    | None ->
      failwith "Impossible: split_query callback is not set"

    | Some goals ->
      goals
  in

  goals |> List.iter (fun (env, goal) -> do_solve false retrying use_env_msg env goal);

  if FStar.Errors.get_err_count() = 0 && retrying
  then ( //query succeeded after a retry
    FStar.TypeChecker.Err.log_issue
      tcenv
      tcenv.range
      (Errors.Warning_SplitAndRetryQueries,
        [Errors.text
       "The verification condition succeeded after splitting it to localize potential errors, \
        although the original non-split verification condition failed. \
        If you want to rely on splitting queries for verifying your program \
        please use the '--split_queries always' option rather than relying on it implicitly."])
   )

let disable_quake_for (f : unit -> 'a) : 'a =
  Options.with_saved_options (fun () ->
    Options.set_option "quake_hi" (Options.Int 1);
    f ())

(* Split queries if needed according to --split_queries option. Note:
sync SMT queries do not pass via this function. *)
let do_solve_maybe_split use_env_msg tcenv q : unit =
  (* If we are admiting queries, don't do anything, and bail out
  right now to save time/memory *)
  if tcenv.admit then () else begin
    match Options.split_queries () with
    | Options.No -> do_solve false false use_env_msg tcenv q
    | Options.OnFailure ->
      (* If we are quake testing, disable auto splitting. Note, this implies
       * that automatically splitted queries do not ever get quake testing,
       * which is good as that would be confusing for the user. *)
      let can_split = not (Options.quake_hi () > 1) in
      begin try do_solve can_split false use_env_msg tcenv q with
      | SplitQueryAndRetry ->
         split_and_solve true use_env_msg tcenv q
      end
    | Options.Always ->
      (* Set retrying=false so queries go through the full config list, etc. *)
      split_and_solve false use_env_msg tcenv q
  end

(* Attempt to discharge a VC through the SMT solver. Will
automatically retry increasing fuel as needed, and perform quake testing
(repeating the query to make sure it is robust). This function will
_log_ (not raise) an error if the VC could not be proven. *)
let solve use_env_msg tcenv q : unit =
    if Options.no_smt () then
        let open FStar.Errors.Msg in
        let open FStar.Pprint in
        let open FStar.Class.PP in
        FStar.TypeChecker.Err.log_issue
          tcenv tcenv.range
            (Errors.Error_NoSMTButNeeded,
             [text "A query could not be solved internally, and --no_smt was given.";
              text "Query = " ^/^ pp q])
    else
    Profiling.profile
      (fun () -> do_solve_maybe_split use_env_msg tcenv q)
      (Some (Ident.string_of_lid (Env.current_module tcenv)))
      "FStar.SMTEncoding.solve_top_level"

(* This asks the SMT to solve a query, and returns the answer without
logging any kind of error. Mostly useful for the smt_sync tactic
primitive.

It will NOT split queries
It will NOT do quake testing.
It WILL raise fuel incrementally to attempt to solve the query

*)
let solve_sync use_env_msg tcenv (q:Syntax.term) : answer =
    if Options.no_smt () then ans_fail
    else
    let go () =
      if !dbg_SMTQuery then (
        let open FStar.Errors.Msg in
        let open FStar.Pprint in
        Errors.diag_doc q.pos [
          prefix 2 1 (text "Running synchronous SMT query. Q =") (pp q);
        ]
      );
      let _cfgs, ans = disable_quake_for (fun () -> encode_and_ask false false use_env_msg tcenv q) in
      ans
    in
    Profiling.profile
      go
      (Some (Ident.string_of_lid (Env.current_module tcenv)))
      "FStar.SMTEncoding.solve_sync_top_level"

(* The version actually exported, and used by tactics. *)
let solve_sync_bool use_env_msg tcenv q : bool =
    let ans = solve_sync use_env_msg tcenv q in
    ans.ok

(**********************************************************************************************)
(* Top-level interface *)
(**********************************************************************************************)

let snapshot msg =
  let v = Encode.snapshot_encoding msg in
  Z3.push msg;
  v
let rollback msg tok =
  Encode.rollback_encoding msg tok;
  Z3.pop msg

let solver = {
    init=(fun e -> save_cfg e; Encode.init e);
    // push=Encode.push_encoding_state;
    // pop=Encode.pop_encoding_state;
    snapshot;
    rollback;
    encode_sig=Encode.encode_sig;

    (* These three to be overriden by FStar.Universal.init_env *)
    preprocess=(fun e g -> (false, [e,g, FStar.Options.peek ()]));
    spinoff_strictly_positive_goals = None;
    handle_smt_goal=(fun e g -> [e,g]);

    solve=solve;
    solve_sync=solve_sync_bool;
    finish=(fun () -> ());
    refresh=Z3.refresh;
}

let dummy = {
    init=(fun _ -> ());
    snapshot=(fun _ -> (0, 0, 0), ());
    rollback=(fun _ _ -> ());
    encode_sig=(fun _ _ -> ());
    preprocess=(fun e g -> (false, [e,g, FStar.Options.peek ()]));
    spinoff_strictly_positive_goals = None;
    handle_smt_goal=(fun e g -> [e,g]);
    solve=(fun _ _ _ -> ());
    solve_sync=(fun _ _ _ -> false);
    finish=(fun () -> ());
    refresh=(fun _ -> ());
}
