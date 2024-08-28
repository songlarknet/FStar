open Prims
type rel =
  | EQ 
  | SUB 
  | SUBINV 
let (uu___is_EQ : rel -> Prims.bool) =
  fun projectee -> match projectee with | EQ -> true | uu___ -> false
let (uu___is_SUB : rel -> Prims.bool) =
  fun projectee -> match projectee with | SUB -> true | uu___ -> false
let (uu___is_SUBINV : rel -> Prims.bool) =
  fun projectee -> match projectee with | SUBINV -> true | uu___ -> false
type rank_t =
  | Rigid_rigid 
  | Flex_rigid_eq 
  | Flex_flex_pattern_eq 
  | Flex_rigid 
  | Rigid_flex 
  | Flex_flex 
let (uu___is_Rigid_rigid : rank_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Rigid_rigid -> true | uu___ -> false
let (uu___is_Flex_rigid_eq : rank_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Flex_rigid_eq -> true | uu___ -> false
let (uu___is_Flex_flex_pattern_eq : rank_t -> Prims.bool) =
  fun projectee ->
    match projectee with | Flex_flex_pattern_eq -> true | uu___ -> false
let (uu___is_Flex_rigid : rank_t -> Prims.bool) =
  fun projectee -> match projectee with | Flex_rigid -> true | uu___ -> false
let (uu___is_Rigid_flex : rank_t -> Prims.bool) =
  fun projectee -> match projectee with | Rigid_flex -> true | uu___ -> false
let (uu___is_Flex_flex : rank_t -> Prims.bool) =
  fun projectee -> match projectee with | Flex_flex -> true | uu___ -> false
type 'a problem =
  {
  pid: Prims.int ;
  lhs: 'a ;
  relation: rel ;
  rhs: 'a ;
  element: FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option ;
  logical_guard: FStar_Syntax_Syntax.term ;
  logical_guard_uvar: FStar_Syntax_Syntax.ctx_uvar ;
  reason: Prims.string Prims.list ;
  loc: FStar_Compiler_Range_Type.range ;
  rank: rank_t FStar_Pervasives_Native.option ;
  logical: Prims.bool }
let __proj__Mkproblem__item__pid : 'a . 'a problem -> Prims.int =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> pid
let __proj__Mkproblem__item__lhs : 'a . 'a problem -> 'a =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> lhs
let __proj__Mkproblem__item__relation : 'a . 'a problem -> rel =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> relation
let __proj__Mkproblem__item__rhs : 'a . 'a problem -> 'a =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> rhs
let __proj__Mkproblem__item__element :
  'a . 'a problem -> FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> element
let __proj__Mkproblem__item__logical_guard :
  'a . 'a problem -> FStar_Syntax_Syntax.term =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> logical_guard
let __proj__Mkproblem__item__logical_guard_uvar :
  'a . 'a problem -> FStar_Syntax_Syntax.ctx_uvar =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> logical_guard_uvar
let __proj__Mkproblem__item__reason :
  'a . 'a problem -> Prims.string Prims.list =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> reason
let __proj__Mkproblem__item__loc :
  'a . 'a problem -> FStar_Compiler_Range_Type.range =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> loc
let __proj__Mkproblem__item__rank :
  'a . 'a problem -> rank_t FStar_Pervasives_Native.option =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> rank
let __proj__Mkproblem__item__logical : 'a . 'a problem -> Prims.bool =
  fun projectee ->
    match projectee with
    | { pid; lhs; relation; rhs; element; logical_guard; logical_guard_uvar;
        reason; loc; rank; logical;_} -> logical
type prob =
  | TProb of FStar_Syntax_Syntax.typ problem 
  | CProb of FStar_Syntax_Syntax.comp problem 
let (uu___is_TProb : prob -> Prims.bool) =
  fun projectee -> match projectee with | TProb _0 -> true | uu___ -> false
let (__proj__TProb__item___0 : prob -> FStar_Syntax_Syntax.typ problem) =
  fun projectee -> match projectee with | TProb _0 -> _0
let (uu___is_CProb : prob -> Prims.bool) =
  fun projectee -> match projectee with | CProb _0 -> true | uu___ -> false
let (__proj__CProb__item___0 : prob -> FStar_Syntax_Syntax.comp problem) =
  fun projectee -> match projectee with | CProb _0 -> _0
type prob_t = prob
let (as_tprob : prob -> FStar_Syntax_Syntax.typ problem) =
  fun uu___ ->
    match uu___ with
    | TProb p -> p
    | uu___1 -> FStar_Compiler_Effect.failwith "Expected a TProb"
type probs = prob Prims.list
type guard_formula =
  | Trivial 
  | NonTrivial of FStar_Syntax_Syntax.formula 
let (uu___is_Trivial : guard_formula -> Prims.bool) =
  fun projectee -> match projectee with | Trivial -> true | uu___ -> false
let (uu___is_NonTrivial : guard_formula -> Prims.bool) =
  fun projectee ->
    match projectee with | NonTrivial _0 -> true | uu___ -> false
let (__proj__NonTrivial__item___0 :
  guard_formula -> FStar_Syntax_Syntax.formula) =
  fun projectee -> match projectee with | NonTrivial _0 -> _0
let (mk_by_tactic :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun tac ->
    fun f ->
      let t_by_tactic =
        let uu___ =
          FStar_Syntax_Syntax.tabbrev FStar_Parser_Const.by_tactic_lid in
        FStar_Syntax_Syntax.mk_Tm_uinst uu___ [FStar_Syntax_Syntax.U_zero] in
      let uu___ =
        let uu___1 = FStar_Syntax_Syntax.as_arg tac in
        let uu___2 = let uu___3 = FStar_Syntax_Syntax.as_arg f in [uu___3] in
        uu___1 :: uu___2 in
      FStar_Syntax_Syntax.mk_Tm_app t_by_tactic uu___
        FStar_Compiler_Range_Type.dummyRange
let rec (delta_depth_greater_than :
  FStar_Syntax_Syntax.delta_depth ->
    FStar_Syntax_Syntax.delta_depth -> Prims.bool)
  =
  fun l ->
    fun m ->
      match (l, m) with
      | (FStar_Syntax_Syntax.Delta_equational_at_level i,
         FStar_Syntax_Syntax.Delta_equational_at_level j) -> i > j
      | (FStar_Syntax_Syntax.Delta_constant_at_level i,
         FStar_Syntax_Syntax.Delta_constant_at_level j) -> i > j
      | (FStar_Syntax_Syntax.Delta_abstract d, uu___) ->
          delta_depth_greater_than d m
      | (uu___, FStar_Syntax_Syntax.Delta_abstract d) ->
          delta_depth_greater_than l d
      | (FStar_Syntax_Syntax.Delta_equational_at_level uu___, uu___1) -> true
      | (uu___, FStar_Syntax_Syntax.Delta_equational_at_level uu___1) ->
          false
let rec (decr_delta_depth :
  FStar_Syntax_Syntax.delta_depth ->
    FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option)
  =
  fun uu___ ->
    match uu___ with
    | FStar_Syntax_Syntax.Delta_constant_at_level uu___1 when
        uu___1 = Prims.int_zero -> FStar_Pervasives_Native.None
    | FStar_Syntax_Syntax.Delta_equational_at_level uu___1 when
        uu___1 = Prims.int_zero -> FStar_Pervasives_Native.None
    | FStar_Syntax_Syntax.Delta_constant_at_level i ->
        FStar_Pervasives_Native.Some
          (FStar_Syntax_Syntax.Delta_constant_at_level (i - Prims.int_one))
    | FStar_Syntax_Syntax.Delta_equational_at_level i ->
        FStar_Pervasives_Native.Some
          (FStar_Syntax_Syntax.Delta_equational_at_level (i - Prims.int_one))
    | FStar_Syntax_Syntax.Delta_abstract d -> decr_delta_depth d
let (showable_guard_formula : guard_formula FStar_Class_Show.showable) =
  {
    FStar_Class_Show.show =
      (fun uu___ ->
         match uu___ with
         | Trivial -> "Trivial"
         | NonTrivial f ->
             let uu___1 =
               FStar_Class_Show.show FStar_Syntax_Print.showable_term f in
             Prims.strcat "NonTrivial " uu___1)
  }
type deferred_reason =
  | Deferred_univ_constraint 
  | Deferred_occur_check_failed 
  | Deferred_first_order_heuristic_failed 
  | Deferred_flex 
  | Deferred_free_names_check_failed 
  | Deferred_not_a_pattern 
  | Deferred_flex_flex_nonpattern 
  | Deferred_delay_match_heuristic 
  | Deferred_to_user_tac 
let (uu___is_Deferred_univ_constraint : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with | Deferred_univ_constraint -> true | uu___ -> false
let (uu___is_Deferred_occur_check_failed : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with
    | Deferred_occur_check_failed -> true
    | uu___ -> false
let (uu___is_Deferred_first_order_heuristic_failed :
  deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with
    | Deferred_first_order_heuristic_failed -> true
    | uu___ -> false
let (uu___is_Deferred_flex : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with | Deferred_flex -> true | uu___ -> false
let (uu___is_Deferred_free_names_check_failed :
  deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with
    | Deferred_free_names_check_failed -> true
    | uu___ -> false
let (uu___is_Deferred_not_a_pattern : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with | Deferred_not_a_pattern -> true | uu___ -> false
let (uu___is_Deferred_flex_flex_nonpattern : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with
    | Deferred_flex_flex_nonpattern -> true
    | uu___ -> false
let (uu___is_Deferred_delay_match_heuristic : deferred_reason -> Prims.bool)
  =
  fun projectee ->
    match projectee with
    | Deferred_delay_match_heuristic -> true
    | uu___ -> false
let (uu___is_Deferred_to_user_tac : deferred_reason -> Prims.bool) =
  fun projectee ->
    match projectee with | Deferred_to_user_tac -> true | uu___ -> false
let (showable_deferred_reason : deferred_reason FStar_Class_Show.showable) =
  {
    FStar_Class_Show.show =
      (fun uu___ ->
         match uu___ with
         | Deferred_univ_constraint -> "Deferred_univ_constraint"
         | Deferred_occur_check_failed -> "Deferred_occur_check_failed"
         | Deferred_first_order_heuristic_failed ->
             "Deferred_first_order_heuristic_failed"
         | Deferred_flex -> "Deferred_flex"
         | Deferred_free_names_check_failed ->
             "Deferred_free_names_check_failed"
         | Deferred_not_a_pattern -> "Deferred_not_a_pattern"
         | Deferred_flex_flex_nonpattern -> "Deferred_flex_flex_nonpattern"
         | Deferred_delay_match_heuristic -> "Deferred_delay_match_heuristic"
         | Deferred_to_user_tac -> "Deferred_to_user_tac")
  }
type deferred = (deferred_reason * Prims.string * prob) Prims.list
type univ_ineq =
  (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.universe)
type identifier_info =
  {
  identifier:
    (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Pervasives.either ;
  identifier_ty: FStar_Syntax_Syntax.typ ;
  identifier_range: FStar_Compiler_Range_Type.range }
let (__proj__Mkidentifier_info__item__identifier :
  identifier_info ->
    (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Pervasives.either)
  =
  fun projectee ->
    match projectee with
    | { identifier; identifier_ty; identifier_range;_} -> identifier
let (__proj__Mkidentifier_info__item__identifier_ty :
  identifier_info -> FStar_Syntax_Syntax.typ) =
  fun projectee ->
    match projectee with
    | { identifier; identifier_ty; identifier_range;_} -> identifier_ty
let (__proj__Mkidentifier_info__item__identifier_range :
  identifier_info -> FStar_Compiler_Range_Type.range) =
  fun projectee ->
    match projectee with
    | { identifier; identifier_ty; identifier_range;_} -> identifier_range
type id_info_by_col = (Prims.int * identifier_info) Prims.list
type col_info_by_row = id_info_by_col FStar_Compiler_Util.pimap
type row_info_by_file = col_info_by_row FStar_Compiler_Util.psmap
type id_info_table =
  {
  id_info_enabled: Prims.bool ;
  id_info_db: row_info_by_file ;
  id_info_buffer: identifier_info Prims.list }
let (__proj__Mkid_info_table__item__id_info_enabled :
  id_info_table -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { id_info_enabled; id_info_db; id_info_buffer;_} -> id_info_enabled
let (__proj__Mkid_info_table__item__id_info_db :
  id_info_table -> row_info_by_file) =
  fun projectee ->
    match projectee with
    | { id_info_enabled; id_info_db; id_info_buffer;_} -> id_info_db
let (__proj__Mkid_info_table__item__id_info_buffer :
  id_info_table -> identifier_info Prims.list) =
  fun projectee ->
    match projectee with
    | { id_info_enabled; id_info_db; id_info_buffer;_} -> id_info_buffer
let (insert_col_info :
  Prims.int ->
    identifier_info ->
      (Prims.int * identifier_info) Prims.list ->
        (Prims.int * identifier_info) Prims.list)
  =
  fun col ->
    fun info ->
      fun col_infos ->
        let rec __insert aux rest =
          match rest with
          | [] -> (aux, [(col, info)])
          | (c, i)::rest' ->
              if col < c
              then (aux, ((col, info) :: rest))
              else __insert ((c, i) :: aux) rest' in
        let uu___ = __insert [] col_infos in
        match uu___ with
        | (l, r) -> FStar_Compiler_List.op_At (FStar_Compiler_List.rev l) r
let (find_nearest_preceding_col_info :
  Prims.int ->
    (Prims.int * identifier_info) Prims.list ->
      identifier_info FStar_Pervasives_Native.option)
  =
  fun col ->
    fun col_infos ->
      let rec aux out uu___ =
        match uu___ with
        | [] -> out
        | (c, i)::rest ->
            if c > col
            then out
            else aux (FStar_Pervasives_Native.Some i) rest in
      aux FStar_Pervasives_Native.None col_infos
let (id_info_table_empty : id_info_table) =
  let uu___ = FStar_Compiler_Util.psmap_empty () in
  { id_info_enabled = false; id_info_db = uu___; id_info_buffer = [] }
let (print_identifier_info : identifier_info -> Prims.string) =
  fun info ->
    let uu___ =
      FStar_Compiler_Range_Ops.string_of_range info.identifier_range in
    let uu___1 =
      match info.identifier with
      | FStar_Pervasives.Inl x -> FStar_Syntax_Print.bv_to_string x
      | FStar_Pervasives.Inr fv -> FStar_Syntax_Print.fv_to_string fv in
    let uu___2 = FStar_Syntax_Print.term_to_string info.identifier_ty in
    FStar_Compiler_Util.format3 "id info { %s, %s : %s}" uu___ uu___1 uu___2
let (id_info__insert :
  (FStar_Syntax_Syntax.typ ->
     FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option)
    ->
    (Prims.int * identifier_info) Prims.list FStar_Compiler_Util.pimap
      FStar_Compiler_Util.psmap ->
      identifier_info ->
        (Prims.int * identifier_info) Prims.list FStar_Compiler_Util.pimap
          FStar_Compiler_Util.psmap)
  =
  fun ty_map ->
    fun db ->
      fun info ->
        let range = info.identifier_range in
        let use_range =
          let uu___ = FStar_Compiler_Range_Type.use_range range in
          FStar_Compiler_Range_Type.set_def_range range uu___ in
        let id_ty =
          match info.identifier with
          | FStar_Pervasives.Inr uu___ -> ty_map info.identifier_ty
          | FStar_Pervasives.Inl x -> ty_map info.identifier_ty in
        match id_ty with
        | FStar_Pervasives_Native.None -> db
        | FStar_Pervasives_Native.Some id_ty1 ->
            let info1 =
              {
                identifier = (info.identifier);
                identifier_ty = id_ty1;
                identifier_range = use_range
              } in
            let fn = FStar_Compiler_Range_Ops.file_of_range use_range in
            let start = FStar_Compiler_Range_Ops.start_of_range use_range in
            let uu___ =
              let uu___1 = FStar_Compiler_Range_Ops.line_of_pos start in
              let uu___2 = FStar_Compiler_Range_Ops.col_of_pos start in
              (uu___1, uu___2) in
            (match uu___ with
             | (row, col) ->
                 let rows =
                   let uu___1 = FStar_Compiler_Util.pimap_empty () in
                   FStar_Compiler_Util.psmap_find_default db fn uu___1 in
                 let cols =
                   FStar_Compiler_Util.pimap_find_default rows row [] in
                 let uu___1 =
                   let uu___2 = insert_col_info col info1 cols in
                   FStar_Compiler_Util.pimap_add rows row uu___2 in
                 FStar_Compiler_Util.psmap_add db fn uu___1)
let (id_info_insert :
  id_info_table ->
    (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Pervasives.either
      ->
      FStar_Syntax_Syntax.typ ->
        FStar_Compiler_Range_Type.range -> id_info_table)
  =
  fun table ->
    fun id ->
      fun ty ->
        fun range ->
          let info =
            { identifier = id; identifier_ty = ty; identifier_range = range } in
          {
            id_info_enabled = (table.id_info_enabled);
            id_info_db = (table.id_info_db);
            id_info_buffer = (info :: (table.id_info_buffer))
          }
let (id_info_insert_bv :
  id_info_table ->
    FStar_Syntax_Syntax.bv -> FStar_Syntax_Syntax.typ -> id_info_table)
  =
  fun table ->
    fun bv ->
      fun ty ->
        if table.id_info_enabled
        then
          let uu___ = FStar_Syntax_Syntax.range_of_bv bv in
          id_info_insert table (FStar_Pervasives.Inl bv) ty uu___
        else table
let (id_info_insert_fv :
  id_info_table ->
    FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.typ -> id_info_table)
  =
  fun table ->
    fun fv ->
      fun ty ->
        if table.id_info_enabled
        then
          let uu___ = FStar_Syntax_Syntax.range_of_fv fv in
          id_info_insert table (FStar_Pervasives.Inr fv) ty uu___
        else table
let (id_info_toggle : id_info_table -> Prims.bool -> id_info_table) =
  fun table ->
    fun enabled ->
      {
        id_info_enabled = enabled;
        id_info_db = (table.id_info_db);
        id_info_buffer = (table.id_info_buffer)
      }
let (id_info_promote :
  id_info_table ->
    (FStar_Syntax_Syntax.typ ->
       FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option)
      -> id_info_table)
  =
  fun table ->
    fun ty_map ->
      let uu___ =
        FStar_Compiler_List.fold_left (id_info__insert ty_map)
          table.id_info_db table.id_info_buffer in
      {
        id_info_enabled = (table.id_info_enabled);
        id_info_db = uu___;
        id_info_buffer = []
      }
let (id_info_at_pos :
  id_info_table ->
    Prims.string ->
      Prims.int ->
        Prims.int -> identifier_info FStar_Pervasives_Native.option)
  =
  fun table ->
    fun fn ->
      fun row ->
        fun col ->
          let rows =
            let uu___ = FStar_Compiler_Util.pimap_empty () in
            FStar_Compiler_Util.psmap_find_default table.id_info_db fn uu___ in
          let cols = FStar_Compiler_Util.pimap_find_default rows row [] in
          let uu___ = find_nearest_preceding_col_info col cols in
          match uu___ with
          | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None
          | FStar_Pervasives_Native.Some info ->
              let last_col =
                let uu___1 =
                  FStar_Compiler_Range_Ops.end_of_range info.identifier_range in
                FStar_Compiler_Range_Ops.col_of_pos uu___1 in
              if col <= last_col
              then FStar_Pervasives_Native.Some info
              else FStar_Pervasives_Native.None
let (check_uvar_ctx_invariant :
  Prims.string ->
    FStar_Compiler_Range_Type.range ->
      Prims.bool ->
        FStar_Syntax_Syntax.gamma -> FStar_Syntax_Syntax.binders -> unit)
  =
  fun reason ->
    fun r ->
      fun should_check ->
        fun g ->
          fun bs ->
            let fail uu___ =
              let uu___1 =
                let uu___2 = FStar_Compiler_Range_Ops.string_of_range r in
                let uu___3 =
                  FStar_Class_Show.show
                    (FStar_Class_Show.show_list
                       FStar_Syntax_Print.showable_binding) g in
                let uu___4 = FStar_Syntax_Print.binders_to_string ", " bs in
                FStar_Compiler_Util.format5
                  "Invariant violation: gamma and binders are out of sync\n\treason=%s, range=%s, should_check=%s\n\t\n                               gamma=%s\n\tbinders=%s\n"
                  reason uu___2 (if should_check then "true" else "false")
                  uu___3 uu___4 in
              FStar_Compiler_Effect.failwith uu___1 in
            if Prims.op_Negation should_check
            then ()
            else
              (let uu___1 =
                 let uu___2 =
                   FStar_Compiler_Util.prefix_until
                     (fun uu___3 ->
                        match uu___3 with
                        | FStar_Syntax_Syntax.Binding_var uu___4 -> true
                        | uu___4 -> false) g in
                 (uu___2, bs) in
               match uu___1 with
               | (FStar_Pervasives_Native.None, []) -> ()
               | (FStar_Pervasives_Native.Some (uu___2, hd, gamma_tail),
                  uu___3::uu___4) ->
                   let uu___5 = FStar_Compiler_Util.prefix bs in
                   (match uu___5 with
                    | (uu___6, x) ->
                        (match hd with
                         | FStar_Syntax_Syntax.Binding_var x' when
                             FStar_Syntax_Syntax.bv_eq
                               x.FStar_Syntax_Syntax.binder_bv x'
                             -> ()
                         | uu___7 -> fail ()))
               | uu___2 -> fail ())
type implicit =
  {
  imp_reason: Prims.string ;
  imp_uvar: FStar_Syntax_Syntax.ctx_uvar ;
  imp_tm: FStar_Syntax_Syntax.term ;
  imp_range: FStar_Compiler_Range_Type.range }
let (__proj__Mkimplicit__item__imp_reason : implicit -> Prims.string) =
  fun projectee ->
    match projectee with
    | { imp_reason; imp_uvar; imp_tm; imp_range;_} -> imp_reason
let (__proj__Mkimplicit__item__imp_uvar :
  implicit -> FStar_Syntax_Syntax.ctx_uvar) =
  fun projectee ->
    match projectee with
    | { imp_reason; imp_uvar; imp_tm; imp_range;_} -> imp_uvar
let (__proj__Mkimplicit__item__imp_tm : implicit -> FStar_Syntax_Syntax.term)
  =
  fun projectee ->
    match projectee with
    | { imp_reason; imp_uvar; imp_tm; imp_range;_} -> imp_tm
let (__proj__Mkimplicit__item__imp_range :
  implicit -> FStar_Compiler_Range_Type.range) =
  fun projectee ->
    match projectee with
    | { imp_reason; imp_uvar; imp_tm; imp_range;_} -> imp_range
let (show_implicit : implicit FStar_Class_Show.showable) =
  {
    FStar_Class_Show.show =
      (fun i ->
         FStar_Class_Show.show FStar_Syntax_Print.showable_uvar
           (i.imp_uvar).FStar_Syntax_Syntax.ctx_uvar_head)
  }
type implicits = implicit Prims.list
let (implicits_to_string : implicits -> Prims.string) =
  fun imps ->
    let imp_to_string i =
      FStar_Syntax_Print.uvar_to_string
        (i.imp_uvar).FStar_Syntax_Syntax.ctx_uvar_head in
    (FStar_Common.string_of_list ()) imp_to_string imps
type guard_t =
  {
  guard_f: guard_formula ;
  deferred_to_tac: deferred ;
  deferred: deferred ;
  univ_ineqs:
    (FStar_Syntax_Syntax.universe Prims.list * univ_ineq Prims.list) ;
  implicits: implicits }
let (__proj__Mkguard_t__item__guard_f : guard_t -> guard_formula) =
  fun projectee ->
    match projectee with
    | { guard_f; deferred_to_tac; deferred = deferred1; univ_ineqs;
        implicits = implicits1;_} -> guard_f
let (__proj__Mkguard_t__item__deferred_to_tac : guard_t -> deferred) =
  fun projectee ->
    match projectee with
    | { guard_f; deferred_to_tac; deferred = deferred1; univ_ineqs;
        implicits = implicits1;_} -> deferred_to_tac
let (__proj__Mkguard_t__item__deferred : guard_t -> deferred) =
  fun projectee ->
    match projectee with
    | { guard_f; deferred_to_tac; deferred = deferred1; univ_ineqs;
        implicits = implicits1;_} -> deferred1
let (__proj__Mkguard_t__item__univ_ineqs :
  guard_t -> (FStar_Syntax_Syntax.universe Prims.list * univ_ineq Prims.list))
  =
  fun projectee ->
    match projectee with
    | { guard_f; deferred_to_tac; deferred = deferred1; univ_ineqs;
        implicits = implicits1;_} -> univ_ineqs
let (__proj__Mkguard_t__item__implicits : guard_t -> implicits) =
  fun projectee ->
    match projectee with
    | { guard_f; deferred_to_tac; deferred = deferred1; univ_ineqs;
        implicits = implicits1;_} -> implicits1
let (trivial_guard : guard_t) =
  {
    guard_f = Trivial;
    deferred_to_tac = [];
    deferred = [];
    univ_ineqs = ([], []);
    implicits = []
  }
let (conj_guard_f : guard_formula -> guard_formula -> guard_formula) =
  fun g1 ->
    fun g2 ->
      match (g1, g2) with
      | (Trivial, g) -> g
      | (g, Trivial) -> g
      | (NonTrivial f1, NonTrivial f2) ->
          let uu___ = FStar_Syntax_Util.mk_conj f1 f2 in NonTrivial uu___
let (binop_guard :
  (guard_formula -> guard_formula -> guard_formula) ->
    guard_t -> guard_t -> guard_t)
  =
  fun f ->
    fun g1 ->
      fun g2 ->
        let uu___ = f g1.guard_f g2.guard_f in
        {
          guard_f = uu___;
          deferred_to_tac =
            (FStar_Compiler_List.op_At g1.deferred_to_tac g2.deferred_to_tac);
          deferred = (FStar_Compiler_List.op_At g1.deferred g2.deferred);
          univ_ineqs =
            ((FStar_Compiler_List.op_At
                (FStar_Pervasives_Native.fst g1.univ_ineqs)
                (FStar_Pervasives_Native.fst g2.univ_ineqs)),
              (FStar_Compiler_List.op_At
                 (FStar_Pervasives_Native.snd g1.univ_ineqs)
                 (FStar_Pervasives_Native.snd g2.univ_ineqs)));
          implicits = (FStar_Compiler_List.op_At g1.implicits g2.implicits)
        }
let (conj_guard : guard_t -> guard_t -> guard_t) =
  fun g1 -> fun g2 -> binop_guard conj_guard_f g1 g2
let (monoid_guard_t : guard_t FStar_Class_Monoid.monoid) =
  {
    FStar_Class_Monoid.mzero = trivial_guard;
    FStar_Class_Monoid.mplus = conj_guard
  }
let rec (check_trivial : FStar_Syntax_Syntax.term -> guard_formula) =
  fun t ->
    let uu___ =
      let uu___1 = FStar_Syntax_Util.unmeta t in
      FStar_Syntax_Util.head_and_args uu___1 in
    match uu___ with
    | (hd, args) ->
        let uu___1 =
          let uu___2 =
            let uu___3 =
              let uu___4 = FStar_Syntax_Util.unmeta hd in
              FStar_Syntax_Util.un_uinst uu___4 in
            uu___3.FStar_Syntax_Syntax.n in
          (uu___2, args) in
        (match uu___1 with
         | (FStar_Syntax_Syntax.Tm_fvar tc, []) when
             FStar_Syntax_Syntax.fv_eq_lid tc FStar_Parser_Const.true_lid ->
             Trivial
         | (FStar_Syntax_Syntax.Tm_fvar sq, (v, uu___2)::[]) when
             (FStar_Syntax_Syntax.fv_eq_lid sq FStar_Parser_Const.squash_lid)
               ||
               (FStar_Syntax_Syntax.fv_eq_lid sq
                  FStar_Parser_Const.auto_squash_lid)
             ->
             let uu___3 = check_trivial v in
             (match uu___3 with | Trivial -> Trivial | uu___4 -> NonTrivial t)
         | uu___2 -> NonTrivial t)
let (imp_guard_f : guard_formula -> guard_formula -> guard_formula) =
  fun g1 ->
    fun g2 ->
      match (g1, g2) with
      | (Trivial, g) -> g
      | (g, Trivial) -> Trivial
      | (NonTrivial f1, NonTrivial f2) ->
          let imp = FStar_Syntax_Util.mk_imp f1 f2 in check_trivial imp
let (imp_guard : guard_t -> guard_t -> guard_t) =
  fun g1 -> fun g2 -> binop_guard imp_guard_f g1 g2
let (conj_guards : guard_t Prims.list -> guard_t) =
  fun gs -> FStar_Compiler_List.fold_left conj_guard trivial_guard gs
let (split_guard : guard_t -> (guard_t * guard_t)) =
  fun g ->
    ({
       guard_f = Trivial;
       deferred_to_tac = (g.deferred_to_tac);
       deferred = (g.deferred);
       univ_ineqs = (g.univ_ineqs);
       implicits = (g.implicits)
     },
      {
        guard_f = (g.guard_f);
        deferred_to_tac = (trivial_guard.deferred_to_tac);
        deferred = (trivial_guard.deferred);
        univ_ineqs = (trivial_guard.univ_ineqs);
        implicits = (trivial_guard.implicits)
      })
let (weaken_guard_formula : guard_t -> FStar_Syntax_Syntax.typ -> guard_t) =
  fun g ->
    fun fml ->
      match g.guard_f with
      | Trivial -> g
      | NonTrivial f ->
          let uu___ =
            let uu___1 = FStar_Syntax_Util.mk_imp fml f in
            check_trivial uu___1 in
          {
            guard_f = uu___;
            deferred_to_tac = (g.deferred_to_tac);
            deferred = (g.deferred);
            univ_ineqs = (g.univ_ineqs);
            implicits = (g.implicits)
          }
type lcomp =
  {
  eff_name: FStar_Ident.lident ;
  res_typ: FStar_Syntax_Syntax.typ ;
  cflags: FStar_Syntax_Syntax.cflag Prims.list ;
  comp_thunk:
    (unit -> (FStar_Syntax_Syntax.comp * guard_t), FStar_Syntax_Syntax.comp)
      FStar_Pervasives.either FStar_Compiler_Effect.ref
    }
let (__proj__Mklcomp__item__eff_name : lcomp -> FStar_Ident.lident) =
  fun projectee ->
    match projectee with
    | { eff_name; res_typ; cflags; comp_thunk;_} -> eff_name
let (__proj__Mklcomp__item__res_typ : lcomp -> FStar_Syntax_Syntax.typ) =
  fun projectee ->
    match projectee with
    | { eff_name; res_typ; cflags; comp_thunk;_} -> res_typ
let (__proj__Mklcomp__item__cflags :
  lcomp -> FStar_Syntax_Syntax.cflag Prims.list) =
  fun projectee ->
    match projectee with
    | { eff_name; res_typ; cflags; comp_thunk;_} -> cflags
let (__proj__Mklcomp__item__comp_thunk :
  lcomp ->
    (unit -> (FStar_Syntax_Syntax.comp * guard_t), FStar_Syntax_Syntax.comp)
      FStar_Pervasives.either FStar_Compiler_Effect.ref)
  =
  fun projectee ->
    match projectee with
    | { eff_name; res_typ; cflags; comp_thunk;_} -> comp_thunk
let (mk_lcomp :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.cflag Prims.list ->
        (unit -> (FStar_Syntax_Syntax.comp * guard_t)) -> lcomp)
  =
  fun eff_name ->
    fun res_typ ->
      fun cflags ->
        fun comp_thunk ->
          let uu___ =
            FStar_Compiler_Util.mk_ref (FStar_Pervasives.Inl comp_thunk) in
          { eff_name; res_typ; cflags; comp_thunk = uu___ }
let (lcomp_comp : lcomp -> (FStar_Syntax_Syntax.comp * guard_t)) =
  fun lc ->
    let uu___ = FStar_Compiler_Effect.op_Bang lc.comp_thunk in
    match uu___ with
    | FStar_Pervasives.Inl thunk ->
        let uu___1 = thunk () in
        (match uu___1 with
         | (c, g) ->
             (FStar_Compiler_Effect.op_Colon_Equals lc.comp_thunk
                (FStar_Pervasives.Inr c);
              (c, g)))
    | FStar_Pervasives.Inr c -> (c, trivial_guard)
let (apply_lcomp :
  (FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) ->
    (guard_t -> guard_t) -> lcomp -> lcomp)
  =
  fun fc ->
    fun fg ->
      fun lc ->
        mk_lcomp lc.eff_name lc.res_typ lc.cflags
          (fun uu___ ->
             let uu___1 = lcomp_comp lc in
             match uu___1 with
             | (c, g) ->
                 let uu___2 = fc c in let uu___3 = fg g in (uu___2, uu___3))
let (lcomp_to_string : lcomp -> Prims.string) =
  fun lc ->
    let uu___ = FStar_Options.print_effect_args () in
    if uu___
    then
      let uu___1 =
        let uu___2 = lcomp_comp lc in FStar_Pervasives_Native.fst uu___2 in
      FStar_Syntax_Print.comp_to_string uu___1
    else
      (let uu___2 = FStar_Syntax_Print.lid_to_string lc.eff_name in
       let uu___3 = FStar_Syntax_Print.term_to_string lc.res_typ in
       FStar_Compiler_Util.format2 "%s %s" uu___2 uu___3)
let (lcomp_set_flags :
  lcomp -> FStar_Syntax_Syntax.cflag Prims.list -> lcomp) =
  fun lc ->
    fun fs ->
      let comp_typ_set_flags c =
        match c.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Total uu___ -> c
        | FStar_Syntax_Syntax.GTotal uu___ -> c
        | FStar_Syntax_Syntax.Comp ct ->
            let ct1 =
              {
                FStar_Syntax_Syntax.comp_univs =
                  (ct.FStar_Syntax_Syntax.comp_univs);
                FStar_Syntax_Syntax.effect_name =
                  (ct.FStar_Syntax_Syntax.effect_name);
                FStar_Syntax_Syntax.result_typ =
                  (ct.FStar_Syntax_Syntax.result_typ);
                FStar_Syntax_Syntax.effect_args =
                  (ct.FStar_Syntax_Syntax.effect_args);
                FStar_Syntax_Syntax.flags = fs
              } in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
              FStar_Syntax_Syntax.pos = (c.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars = (c.FStar_Syntax_Syntax.vars);
              FStar_Syntax_Syntax.hash_code =
                (c.FStar_Syntax_Syntax.hash_code)
            } in
      mk_lcomp lc.eff_name lc.res_typ fs
        (fun uu___ ->
           let uu___1 = lcomp_comp lc in
           match uu___1 with | (c, g) -> ((comp_typ_set_flags c), g))
let (is_total_lcomp : lcomp -> Prims.bool) =
  fun c ->
    (FStar_Ident.lid_equals c.eff_name FStar_Parser_Const.effect_Tot_lid) ||
      (FStar_Compiler_Util.for_some
         (fun uu___ ->
            match uu___ with
            | FStar_Syntax_Syntax.TOTAL -> true
            | FStar_Syntax_Syntax.RETURN -> true
            | uu___1 -> false) c.cflags)
let (is_tot_or_gtot_lcomp : lcomp -> Prims.bool) =
  fun c ->
    ((FStar_Ident.lid_equals c.eff_name FStar_Parser_Const.effect_Tot_lid) ||
       (FStar_Ident.lid_equals c.eff_name FStar_Parser_Const.effect_GTot_lid))
      ||
      (FStar_Compiler_Util.for_some
         (fun uu___ ->
            match uu___ with
            | FStar_Syntax_Syntax.TOTAL -> true
            | FStar_Syntax_Syntax.RETURN -> true
            | uu___1 -> false) c.cflags)
let (is_lcomp_partial_return : lcomp -> Prims.bool) =
  fun c ->
    FStar_Compiler_Util.for_some
      (fun uu___ ->
         match uu___ with
         | FStar_Syntax_Syntax.RETURN -> true
         | FStar_Syntax_Syntax.PARTIAL_RETURN -> true
         | uu___1 -> false) c.cflags
let (is_pure_lcomp : lcomp -> Prims.bool) =
  fun lc ->
    ((is_total_lcomp lc) || (FStar_Syntax_Util.is_pure_effect lc.eff_name))
      ||
      (FStar_Compiler_Util.for_some
         (fun uu___ ->
            match uu___ with
            | FStar_Syntax_Syntax.LEMMA -> true
            | uu___1 -> false) lc.cflags)
let (is_pure_or_ghost_lcomp : lcomp -> Prims.bool) =
  fun lc ->
    (is_pure_lcomp lc) || (FStar_Syntax_Util.is_ghost_effect lc.eff_name)
let (set_result_typ_lc : lcomp -> FStar_Syntax_Syntax.typ -> lcomp) =
  fun lc ->
    fun t ->
      mk_lcomp lc.eff_name t lc.cflags
        (fun uu___ ->
           let uu___1 = lcomp_comp lc in
           match uu___1 with
           | (c, g) ->
               let uu___2 = FStar_Syntax_Util.set_result_typ c t in
               (uu___2, g))
let (residual_comp_of_lcomp : lcomp -> FStar_Syntax_Syntax.residual_comp) =
  fun lc ->
    {
      FStar_Syntax_Syntax.residual_effect = (lc.eff_name);
      FStar_Syntax_Syntax.residual_typ =
        (FStar_Pervasives_Native.Some (lc.res_typ));
      FStar_Syntax_Syntax.residual_flags = (lc.cflags)
    }
let (lcomp_of_comp_guard : FStar_Syntax_Syntax.comp -> guard_t -> lcomp) =
  fun c0 ->
    fun g ->
      let uu___ =
        match c0.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Total uu___1 ->
            (FStar_Parser_Const.effect_Tot_lid, [FStar_Syntax_Syntax.TOTAL])
        | FStar_Syntax_Syntax.GTotal uu___1 ->
            (FStar_Parser_Const.effect_GTot_lid,
              [FStar_Syntax_Syntax.SOMETRIVIAL])
        | FStar_Syntax_Syntax.Comp c ->
            ((c.FStar_Syntax_Syntax.effect_name),
              (c.FStar_Syntax_Syntax.flags)) in
      match uu___ with
      | (eff_name, flags) ->
          mk_lcomp eff_name (FStar_Syntax_Util.comp_result c0) flags
            (fun uu___1 -> (c0, g))
let (lcomp_of_comp : FStar_Syntax_Syntax.comp -> lcomp) =
  fun c0 -> lcomp_of_comp_guard c0 trivial_guard
let (check_positivity_qual :
  Prims.bool ->
    FStar_Syntax_Syntax.positivity_qualifier FStar_Pervasives_Native.option
      ->
      FStar_Syntax_Syntax.positivity_qualifier FStar_Pervasives_Native.option
        -> Prims.bool)
  =
  fun subtyping ->
    fun p0 ->
      fun p1 ->
        if p0 = p1
        then true
        else
          if subtyping
          then
            (match (p0, p1) with
             | (FStar_Pervasives_Native.Some uu___1,
                FStar_Pervasives_Native.None) -> true
             | (FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.BinderUnused),
                FStar_Pervasives_Native.Some
                (FStar_Syntax_Syntax.BinderStrictlyPositive)) -> true
             | uu___1 -> false)
          else false