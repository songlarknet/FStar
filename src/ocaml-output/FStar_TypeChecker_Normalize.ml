open Prims
type step =
  | Beta 
  | Iota 
  | Zeta 
  | Exclude of step 
  | Weak 
  | HNF 
  | Primops 
  | Eager_unfolding 
  | Inlining 
  | DoNotUnfoldPureLets 
  | UnfoldUntil of FStar_Syntax_Syntax.delta_depth 
  | UnfoldOnly of FStar_Ident.lid Prims.list 
  | UnfoldFully of FStar_Ident.lid Prims.list 
  | UnfoldAttr of FStar_Syntax_Syntax.attribute 
  | UnfoldTac 
  | PureSubtermsWithinComputations 
  | Simplify 
  | EraseUniverses 
  | AllowUnboundUniverses 
  | Reify 
  | CompressUvars 
  | NoFullNorm 
  | CheckNoUvars 
  | Unmeta 
  | Unascribe 
let (uu___is_Beta : step -> Prims.bool) =
  fun projectee  -> match projectee with | Beta  -> true | uu____35 -> false 
let (uu___is_Iota : step -> Prims.bool) =
  fun projectee  -> match projectee with | Iota  -> true | uu____41 -> false 
let (uu___is_Zeta : step -> Prims.bool) =
  fun projectee  -> match projectee with | Zeta  -> true | uu____47 -> false 
let (uu___is_Exclude : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Exclude _0 -> true | uu____54 -> false
  
let (__proj__Exclude__item___0 : step -> step) =
  fun projectee  -> match projectee with | Exclude _0 -> _0 
let (uu___is_Weak : step -> Prims.bool) =
  fun projectee  -> match projectee with | Weak  -> true | uu____67 -> false 
let (uu___is_HNF : step -> Prims.bool) =
  fun projectee  -> match projectee with | HNF  -> true | uu____73 -> false 
let (uu___is_Primops : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Primops  -> true | uu____79 -> false
  
let (uu___is_Eager_unfolding : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Eager_unfolding  -> true | uu____85 -> false
  
let (uu___is_Inlining : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Inlining  -> true | uu____91 -> false
  
let (uu___is_DoNotUnfoldPureLets : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | DoNotUnfoldPureLets  -> true | uu____97 -> false
  
let (uu___is_UnfoldUntil : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldUntil _0 -> true | uu____104 -> false
  
let (__proj__UnfoldUntil__item___0 : step -> FStar_Syntax_Syntax.delta_depth)
  = fun projectee  -> match projectee with | UnfoldUntil _0 -> _0 
let (uu___is_UnfoldOnly : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldOnly _0 -> true | uu____120 -> false
  
let (__proj__UnfoldOnly__item___0 : step -> FStar_Ident.lid Prims.list) =
  fun projectee  -> match projectee with | UnfoldOnly _0 -> _0 
let (uu___is_UnfoldFully : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldFully _0 -> true | uu____142 -> false
  
let (__proj__UnfoldFully__item___0 : step -> FStar_Ident.lid Prims.list) =
  fun projectee  -> match projectee with | UnfoldFully _0 -> _0 
let (uu___is_UnfoldAttr : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldAttr _0 -> true | uu____162 -> false
  
let (__proj__UnfoldAttr__item___0 : step -> FStar_Syntax_Syntax.attribute) =
  fun projectee  -> match projectee with | UnfoldAttr _0 -> _0 
let (uu___is_UnfoldTac : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnfoldTac  -> true | uu____175 -> false
  
let (uu___is_PureSubtermsWithinComputations : step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | PureSubtermsWithinComputations  -> true
    | uu____181 -> false
  
let (uu___is_Simplify : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Simplify  -> true | uu____187 -> false
  
let (uu___is_EraseUniverses : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | EraseUniverses  -> true | uu____193 -> false
  
let (uu___is_AllowUnboundUniverses : step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | AllowUnboundUniverses  -> true
    | uu____199 -> false
  
let (uu___is_Reify : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Reify  -> true | uu____205 -> false
  
let (uu___is_CompressUvars : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | CompressUvars  -> true | uu____211 -> false
  
let (uu___is_NoFullNorm : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | NoFullNorm  -> true | uu____217 -> false
  
let (uu___is_CheckNoUvars : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | CheckNoUvars  -> true | uu____223 -> false
  
let (uu___is_Unmeta : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unmeta  -> true | uu____229 -> false
  
let (uu___is_Unascribe : step -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unascribe  -> true | uu____235 -> false
  
type steps = step Prims.list
let cases :
  'Auu____248 'Auu____249 .
    ('Auu____248 -> 'Auu____249) ->
      'Auu____249 ->
        'Auu____248 FStar_Pervasives_Native.option -> 'Auu____249
  =
  fun f  ->
    fun d  ->
      fun uu___102_269  ->
        match uu___102_269 with
        | FStar_Pervasives_Native.Some x -> f x
        | FStar_Pervasives_Native.None  -> d
  
type fsteps =
  {
  beta: Prims.bool ;
  iota: Prims.bool ;
  zeta: Prims.bool ;
  weak: Prims.bool ;
  hnf: Prims.bool ;
  primops: Prims.bool ;
  do_not_unfold_pure_lets: Prims.bool ;
  unfold_until:
    FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option ;
  unfold_only: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_fully: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_attr:
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option ;
  unfold_tac: Prims.bool ;
  pure_subterms_within_computations: Prims.bool ;
  simplify: Prims.bool ;
  erase_universes: Prims.bool ;
  allow_unbound_universes: Prims.bool ;
  reify_: Prims.bool ;
  compress_uvars: Prims.bool ;
  no_full_norm: Prims.bool ;
  check_no_uvars: Prims.bool ;
  unmeta: Prims.bool ;
  unascribe: Prims.bool ;
  in_full_norm_request: Prims.bool ;
  weakly_reduce_scrutinee: Prims.bool }
let (__proj__Mkfsteps__item__beta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__beta
  
let (__proj__Mkfsteps__item__iota : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__iota
  
let (__proj__Mkfsteps__item__zeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__zeta
  
let (__proj__Mkfsteps__item__weak : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__weak
  
let (__proj__Mkfsteps__item__hnf : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__hnf
  
let (__proj__Mkfsteps__item__primops : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__primops
  
let (__proj__Mkfsteps__item__do_not_unfold_pure_lets : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__do_not_unfold_pure_lets
  
let (__proj__Mkfsteps__item__unfold_until :
  fsteps -> FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_until
  
let (__proj__Mkfsteps__item__unfold_only :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_only
  
let (__proj__Mkfsteps__item__unfold_fully :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_fully
  
let (__proj__Mkfsteps__item__unfold_attr :
  fsteps ->
    FStar_Syntax_Syntax.attribute Prims.list FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_attr
  
let (__proj__Mkfsteps__item__unfold_tac : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unfold_tac
  
let (__proj__Mkfsteps__item__pure_subterms_within_computations :
  fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__pure_subterms_within_computations
  
let (__proj__Mkfsteps__item__simplify : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__simplify
  
let (__proj__Mkfsteps__item__erase_universes : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__erase_universes
  
let (__proj__Mkfsteps__item__allow_unbound_universes : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__allow_unbound_universes
  
let (__proj__Mkfsteps__item__reify_ : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__reify_
  
let (__proj__Mkfsteps__item__compress_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__compress_uvars
  
let (__proj__Mkfsteps__item__no_full_norm : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__no_full_norm
  
let (__proj__Mkfsteps__item__check_no_uvars : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__check_no_uvars
  
let (__proj__Mkfsteps__item__unmeta : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unmeta
  
let (__proj__Mkfsteps__item__unascribe : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__unascribe
  
let (__proj__Mkfsteps__item__in_full_norm_request : fsteps -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__in_full_norm_request
  
let (__proj__Mkfsteps__item__weakly_reduce_scrutinee : fsteps -> Prims.bool)
  =
  fun projectee  ->
    match projectee with
    | { beta = __fname__beta; iota = __fname__iota; zeta = __fname__zeta;
        weak = __fname__weak; hnf = __fname__hnf; primops = __fname__primops;
        do_not_unfold_pure_lets = __fname__do_not_unfold_pure_lets;
        unfold_until = __fname__unfold_until;
        unfold_only = __fname__unfold_only;
        unfold_fully = __fname__unfold_fully;
        unfold_attr = __fname__unfold_attr; unfold_tac = __fname__unfold_tac;
        pure_subterms_within_computations =
          __fname__pure_subterms_within_computations;
        simplify = __fname__simplify;
        erase_universes = __fname__erase_universes;
        allow_unbound_universes = __fname__allow_unbound_universes;
        reify_ = __fname__reify_; compress_uvars = __fname__compress_uvars;
        no_full_norm = __fname__no_full_norm;
        check_no_uvars = __fname__check_no_uvars; unmeta = __fname__unmeta;
        unascribe = __fname__unascribe;
        in_full_norm_request = __fname__in_full_norm_request;
        weakly_reduce_scrutinee = __fname__weakly_reduce_scrutinee;_} ->
        __fname__weakly_reduce_scrutinee
  
let (default_steps : fsteps) =
  {
    beta = true;
    iota = true;
    zeta = true;
    weak = false;
    hnf = false;
    primops = false;
    do_not_unfold_pure_lets = false;
    unfold_until = FStar_Pervasives_Native.None;
    unfold_only = FStar_Pervasives_Native.None;
    unfold_fully = FStar_Pervasives_Native.None;
    unfold_attr = FStar_Pervasives_Native.None;
    unfold_tac = false;
    pure_subterms_within_computations = false;
    simplify = false;
    erase_universes = false;
    allow_unbound_universes = false;
    reify_ = false;
    compress_uvars = false;
    no_full_norm = false;
    check_no_uvars = false;
    unmeta = false;
    unascribe = false;
    in_full_norm_request = false;
    weakly_reduce_scrutinee = true
  } 
let (fstep_add_one : step -> fsteps -> fsteps) =
  fun s  ->
    fun fs  ->
      let add_opt x uu___103_1503 =
        match uu___103_1503 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.Some [x]
        | FStar_Pervasives_Native.Some xs ->
            FStar_Pervasives_Native.Some (x :: xs)
         in
      match s with
      | Beta  ->
          let uu___122_1523 = fs  in
          {
            beta = true;
            iota = (uu___122_1523.iota);
            zeta = (uu___122_1523.zeta);
            weak = (uu___122_1523.weak);
            hnf = (uu___122_1523.hnf);
            primops = (uu___122_1523.primops);
            do_not_unfold_pure_lets = (uu___122_1523.do_not_unfold_pure_lets);
            unfold_until = (uu___122_1523.unfold_until);
            unfold_only = (uu___122_1523.unfold_only);
            unfold_fully = (uu___122_1523.unfold_fully);
            unfold_attr = (uu___122_1523.unfold_attr);
            unfold_tac = (uu___122_1523.unfold_tac);
            pure_subterms_within_computations =
              (uu___122_1523.pure_subterms_within_computations);
            simplify = (uu___122_1523.simplify);
            erase_universes = (uu___122_1523.erase_universes);
            allow_unbound_universes = (uu___122_1523.allow_unbound_universes);
            reify_ = (uu___122_1523.reify_);
            compress_uvars = (uu___122_1523.compress_uvars);
            no_full_norm = (uu___122_1523.no_full_norm);
            check_no_uvars = (uu___122_1523.check_no_uvars);
            unmeta = (uu___122_1523.unmeta);
            unascribe = (uu___122_1523.unascribe);
            in_full_norm_request = (uu___122_1523.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___122_1523.weakly_reduce_scrutinee)
          }
      | Iota  ->
          let uu___123_1524 = fs  in
          {
            beta = (uu___123_1524.beta);
            iota = true;
            zeta = (uu___123_1524.zeta);
            weak = (uu___123_1524.weak);
            hnf = (uu___123_1524.hnf);
            primops = (uu___123_1524.primops);
            do_not_unfold_pure_lets = (uu___123_1524.do_not_unfold_pure_lets);
            unfold_until = (uu___123_1524.unfold_until);
            unfold_only = (uu___123_1524.unfold_only);
            unfold_fully = (uu___123_1524.unfold_fully);
            unfold_attr = (uu___123_1524.unfold_attr);
            unfold_tac = (uu___123_1524.unfold_tac);
            pure_subterms_within_computations =
              (uu___123_1524.pure_subterms_within_computations);
            simplify = (uu___123_1524.simplify);
            erase_universes = (uu___123_1524.erase_universes);
            allow_unbound_universes = (uu___123_1524.allow_unbound_universes);
            reify_ = (uu___123_1524.reify_);
            compress_uvars = (uu___123_1524.compress_uvars);
            no_full_norm = (uu___123_1524.no_full_norm);
            check_no_uvars = (uu___123_1524.check_no_uvars);
            unmeta = (uu___123_1524.unmeta);
            unascribe = (uu___123_1524.unascribe);
            in_full_norm_request = (uu___123_1524.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___123_1524.weakly_reduce_scrutinee)
          }
      | Zeta  ->
          let uu___124_1525 = fs  in
          {
            beta = (uu___124_1525.beta);
            iota = (uu___124_1525.iota);
            zeta = true;
            weak = (uu___124_1525.weak);
            hnf = (uu___124_1525.hnf);
            primops = (uu___124_1525.primops);
            do_not_unfold_pure_lets = (uu___124_1525.do_not_unfold_pure_lets);
            unfold_until = (uu___124_1525.unfold_until);
            unfold_only = (uu___124_1525.unfold_only);
            unfold_fully = (uu___124_1525.unfold_fully);
            unfold_attr = (uu___124_1525.unfold_attr);
            unfold_tac = (uu___124_1525.unfold_tac);
            pure_subterms_within_computations =
              (uu___124_1525.pure_subterms_within_computations);
            simplify = (uu___124_1525.simplify);
            erase_universes = (uu___124_1525.erase_universes);
            allow_unbound_universes = (uu___124_1525.allow_unbound_universes);
            reify_ = (uu___124_1525.reify_);
            compress_uvars = (uu___124_1525.compress_uvars);
            no_full_norm = (uu___124_1525.no_full_norm);
            check_no_uvars = (uu___124_1525.check_no_uvars);
            unmeta = (uu___124_1525.unmeta);
            unascribe = (uu___124_1525.unascribe);
            in_full_norm_request = (uu___124_1525.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___124_1525.weakly_reduce_scrutinee)
          }
      | Exclude (Beta ) ->
          let uu___125_1526 = fs  in
          {
            beta = false;
            iota = (uu___125_1526.iota);
            zeta = (uu___125_1526.zeta);
            weak = (uu___125_1526.weak);
            hnf = (uu___125_1526.hnf);
            primops = (uu___125_1526.primops);
            do_not_unfold_pure_lets = (uu___125_1526.do_not_unfold_pure_lets);
            unfold_until = (uu___125_1526.unfold_until);
            unfold_only = (uu___125_1526.unfold_only);
            unfold_fully = (uu___125_1526.unfold_fully);
            unfold_attr = (uu___125_1526.unfold_attr);
            unfold_tac = (uu___125_1526.unfold_tac);
            pure_subterms_within_computations =
              (uu___125_1526.pure_subterms_within_computations);
            simplify = (uu___125_1526.simplify);
            erase_universes = (uu___125_1526.erase_universes);
            allow_unbound_universes = (uu___125_1526.allow_unbound_universes);
            reify_ = (uu___125_1526.reify_);
            compress_uvars = (uu___125_1526.compress_uvars);
            no_full_norm = (uu___125_1526.no_full_norm);
            check_no_uvars = (uu___125_1526.check_no_uvars);
            unmeta = (uu___125_1526.unmeta);
            unascribe = (uu___125_1526.unascribe);
            in_full_norm_request = (uu___125_1526.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___125_1526.weakly_reduce_scrutinee)
          }
      | Exclude (Iota ) ->
          let uu___126_1527 = fs  in
          {
            beta = (uu___126_1527.beta);
            iota = false;
            zeta = (uu___126_1527.zeta);
            weak = (uu___126_1527.weak);
            hnf = (uu___126_1527.hnf);
            primops = (uu___126_1527.primops);
            do_not_unfold_pure_lets = (uu___126_1527.do_not_unfold_pure_lets);
            unfold_until = (uu___126_1527.unfold_until);
            unfold_only = (uu___126_1527.unfold_only);
            unfold_fully = (uu___126_1527.unfold_fully);
            unfold_attr = (uu___126_1527.unfold_attr);
            unfold_tac = (uu___126_1527.unfold_tac);
            pure_subterms_within_computations =
              (uu___126_1527.pure_subterms_within_computations);
            simplify = (uu___126_1527.simplify);
            erase_universes = (uu___126_1527.erase_universes);
            allow_unbound_universes = (uu___126_1527.allow_unbound_universes);
            reify_ = (uu___126_1527.reify_);
            compress_uvars = (uu___126_1527.compress_uvars);
            no_full_norm = (uu___126_1527.no_full_norm);
            check_no_uvars = (uu___126_1527.check_no_uvars);
            unmeta = (uu___126_1527.unmeta);
            unascribe = (uu___126_1527.unascribe);
            in_full_norm_request = (uu___126_1527.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___126_1527.weakly_reduce_scrutinee)
          }
      | Exclude (Zeta ) ->
          let uu___127_1528 = fs  in
          {
            beta = (uu___127_1528.beta);
            iota = (uu___127_1528.iota);
            zeta = false;
            weak = (uu___127_1528.weak);
            hnf = (uu___127_1528.hnf);
            primops = (uu___127_1528.primops);
            do_not_unfold_pure_lets = (uu___127_1528.do_not_unfold_pure_lets);
            unfold_until = (uu___127_1528.unfold_until);
            unfold_only = (uu___127_1528.unfold_only);
            unfold_fully = (uu___127_1528.unfold_fully);
            unfold_attr = (uu___127_1528.unfold_attr);
            unfold_tac = (uu___127_1528.unfold_tac);
            pure_subterms_within_computations =
              (uu___127_1528.pure_subterms_within_computations);
            simplify = (uu___127_1528.simplify);
            erase_universes = (uu___127_1528.erase_universes);
            allow_unbound_universes = (uu___127_1528.allow_unbound_universes);
            reify_ = (uu___127_1528.reify_);
            compress_uvars = (uu___127_1528.compress_uvars);
            no_full_norm = (uu___127_1528.no_full_norm);
            check_no_uvars = (uu___127_1528.check_no_uvars);
            unmeta = (uu___127_1528.unmeta);
            unascribe = (uu___127_1528.unascribe);
            in_full_norm_request = (uu___127_1528.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___127_1528.weakly_reduce_scrutinee)
          }
      | Exclude uu____1529 -> failwith "Bad exclude"
      | Weak  ->
          let uu___128_1530 = fs  in
          {
            beta = (uu___128_1530.beta);
            iota = (uu___128_1530.iota);
            zeta = (uu___128_1530.zeta);
            weak = true;
            hnf = (uu___128_1530.hnf);
            primops = (uu___128_1530.primops);
            do_not_unfold_pure_lets = (uu___128_1530.do_not_unfold_pure_lets);
            unfold_until = (uu___128_1530.unfold_until);
            unfold_only = (uu___128_1530.unfold_only);
            unfold_fully = (uu___128_1530.unfold_fully);
            unfold_attr = (uu___128_1530.unfold_attr);
            unfold_tac = (uu___128_1530.unfold_tac);
            pure_subterms_within_computations =
              (uu___128_1530.pure_subterms_within_computations);
            simplify = (uu___128_1530.simplify);
            erase_universes = (uu___128_1530.erase_universes);
            allow_unbound_universes = (uu___128_1530.allow_unbound_universes);
            reify_ = (uu___128_1530.reify_);
            compress_uvars = (uu___128_1530.compress_uvars);
            no_full_norm = (uu___128_1530.no_full_norm);
            check_no_uvars = (uu___128_1530.check_no_uvars);
            unmeta = (uu___128_1530.unmeta);
            unascribe = (uu___128_1530.unascribe);
            in_full_norm_request = (uu___128_1530.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___128_1530.weakly_reduce_scrutinee)
          }
      | HNF  ->
          let uu___129_1531 = fs  in
          {
            beta = (uu___129_1531.beta);
            iota = (uu___129_1531.iota);
            zeta = (uu___129_1531.zeta);
            weak = (uu___129_1531.weak);
            hnf = true;
            primops = (uu___129_1531.primops);
            do_not_unfold_pure_lets = (uu___129_1531.do_not_unfold_pure_lets);
            unfold_until = (uu___129_1531.unfold_until);
            unfold_only = (uu___129_1531.unfold_only);
            unfold_fully = (uu___129_1531.unfold_fully);
            unfold_attr = (uu___129_1531.unfold_attr);
            unfold_tac = (uu___129_1531.unfold_tac);
            pure_subterms_within_computations =
              (uu___129_1531.pure_subterms_within_computations);
            simplify = (uu___129_1531.simplify);
            erase_universes = (uu___129_1531.erase_universes);
            allow_unbound_universes = (uu___129_1531.allow_unbound_universes);
            reify_ = (uu___129_1531.reify_);
            compress_uvars = (uu___129_1531.compress_uvars);
            no_full_norm = (uu___129_1531.no_full_norm);
            check_no_uvars = (uu___129_1531.check_no_uvars);
            unmeta = (uu___129_1531.unmeta);
            unascribe = (uu___129_1531.unascribe);
            in_full_norm_request = (uu___129_1531.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___129_1531.weakly_reduce_scrutinee)
          }
      | Primops  ->
          let uu___130_1532 = fs  in
          {
            beta = (uu___130_1532.beta);
            iota = (uu___130_1532.iota);
            zeta = (uu___130_1532.zeta);
            weak = (uu___130_1532.weak);
            hnf = (uu___130_1532.hnf);
            primops = true;
            do_not_unfold_pure_lets = (uu___130_1532.do_not_unfold_pure_lets);
            unfold_until = (uu___130_1532.unfold_until);
            unfold_only = (uu___130_1532.unfold_only);
            unfold_fully = (uu___130_1532.unfold_fully);
            unfold_attr = (uu___130_1532.unfold_attr);
            unfold_tac = (uu___130_1532.unfold_tac);
            pure_subterms_within_computations =
              (uu___130_1532.pure_subterms_within_computations);
            simplify = (uu___130_1532.simplify);
            erase_universes = (uu___130_1532.erase_universes);
            allow_unbound_universes = (uu___130_1532.allow_unbound_universes);
            reify_ = (uu___130_1532.reify_);
            compress_uvars = (uu___130_1532.compress_uvars);
            no_full_norm = (uu___130_1532.no_full_norm);
            check_no_uvars = (uu___130_1532.check_no_uvars);
            unmeta = (uu___130_1532.unmeta);
            unascribe = (uu___130_1532.unascribe);
            in_full_norm_request = (uu___130_1532.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___130_1532.weakly_reduce_scrutinee)
          }
      | Eager_unfolding  -> fs
      | Inlining  -> fs
      | DoNotUnfoldPureLets  ->
          let uu___131_1533 = fs  in
          {
            beta = (uu___131_1533.beta);
            iota = (uu___131_1533.iota);
            zeta = (uu___131_1533.zeta);
            weak = (uu___131_1533.weak);
            hnf = (uu___131_1533.hnf);
            primops = (uu___131_1533.primops);
            do_not_unfold_pure_lets = true;
            unfold_until = (uu___131_1533.unfold_until);
            unfold_only = (uu___131_1533.unfold_only);
            unfold_fully = (uu___131_1533.unfold_fully);
            unfold_attr = (uu___131_1533.unfold_attr);
            unfold_tac = (uu___131_1533.unfold_tac);
            pure_subterms_within_computations =
              (uu___131_1533.pure_subterms_within_computations);
            simplify = (uu___131_1533.simplify);
            erase_universes = (uu___131_1533.erase_universes);
            allow_unbound_universes = (uu___131_1533.allow_unbound_universes);
            reify_ = (uu___131_1533.reify_);
            compress_uvars = (uu___131_1533.compress_uvars);
            no_full_norm = (uu___131_1533.no_full_norm);
            check_no_uvars = (uu___131_1533.check_no_uvars);
            unmeta = (uu___131_1533.unmeta);
            unascribe = (uu___131_1533.unascribe);
            in_full_norm_request = (uu___131_1533.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___131_1533.weakly_reduce_scrutinee)
          }
      | UnfoldUntil d ->
          let uu___132_1535 = fs  in
          {
            beta = (uu___132_1535.beta);
            iota = (uu___132_1535.iota);
            zeta = (uu___132_1535.zeta);
            weak = (uu___132_1535.weak);
            hnf = (uu___132_1535.hnf);
            primops = (uu___132_1535.primops);
            do_not_unfold_pure_lets = (uu___132_1535.do_not_unfold_pure_lets);
            unfold_until = (FStar_Pervasives_Native.Some d);
            unfold_only = (uu___132_1535.unfold_only);
            unfold_fully = (uu___132_1535.unfold_fully);
            unfold_attr = (uu___132_1535.unfold_attr);
            unfold_tac = (uu___132_1535.unfold_tac);
            pure_subterms_within_computations =
              (uu___132_1535.pure_subterms_within_computations);
            simplify = (uu___132_1535.simplify);
            erase_universes = (uu___132_1535.erase_universes);
            allow_unbound_universes = (uu___132_1535.allow_unbound_universes);
            reify_ = (uu___132_1535.reify_);
            compress_uvars = (uu___132_1535.compress_uvars);
            no_full_norm = (uu___132_1535.no_full_norm);
            check_no_uvars = (uu___132_1535.check_no_uvars);
            unmeta = (uu___132_1535.unmeta);
            unascribe = (uu___132_1535.unascribe);
            in_full_norm_request = (uu___132_1535.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___132_1535.weakly_reduce_scrutinee)
          }
      | UnfoldOnly lids ->
          let uu___133_1539 = fs  in
          {
            beta = (uu___133_1539.beta);
            iota = (uu___133_1539.iota);
            zeta = (uu___133_1539.zeta);
            weak = (uu___133_1539.weak);
            hnf = (uu___133_1539.hnf);
            primops = (uu___133_1539.primops);
            do_not_unfold_pure_lets = (uu___133_1539.do_not_unfold_pure_lets);
            unfold_until = (uu___133_1539.unfold_until);
            unfold_only = (FStar_Pervasives_Native.Some lids);
            unfold_fully = (uu___133_1539.unfold_fully);
            unfold_attr = (uu___133_1539.unfold_attr);
            unfold_tac = (uu___133_1539.unfold_tac);
            pure_subterms_within_computations =
              (uu___133_1539.pure_subterms_within_computations);
            simplify = (uu___133_1539.simplify);
            erase_universes = (uu___133_1539.erase_universes);
            allow_unbound_universes = (uu___133_1539.allow_unbound_universes);
            reify_ = (uu___133_1539.reify_);
            compress_uvars = (uu___133_1539.compress_uvars);
            no_full_norm = (uu___133_1539.no_full_norm);
            check_no_uvars = (uu___133_1539.check_no_uvars);
            unmeta = (uu___133_1539.unmeta);
            unascribe = (uu___133_1539.unascribe);
            in_full_norm_request = (uu___133_1539.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___133_1539.weakly_reduce_scrutinee)
          }
      | UnfoldFully lids ->
          let uu___134_1545 = fs  in
          {
            beta = (uu___134_1545.beta);
            iota = (uu___134_1545.iota);
            zeta = (uu___134_1545.zeta);
            weak = (uu___134_1545.weak);
            hnf = (uu___134_1545.hnf);
            primops = (uu___134_1545.primops);
            do_not_unfold_pure_lets = (uu___134_1545.do_not_unfold_pure_lets);
            unfold_until = (uu___134_1545.unfold_until);
            unfold_only = (uu___134_1545.unfold_only);
            unfold_fully = (FStar_Pervasives_Native.Some lids);
            unfold_attr = (uu___134_1545.unfold_attr);
            unfold_tac = (uu___134_1545.unfold_tac);
            pure_subterms_within_computations =
              (uu___134_1545.pure_subterms_within_computations);
            simplify = (uu___134_1545.simplify);
            erase_universes = (uu___134_1545.erase_universes);
            allow_unbound_universes = (uu___134_1545.allow_unbound_universes);
            reify_ = (uu___134_1545.reify_);
            compress_uvars = (uu___134_1545.compress_uvars);
            no_full_norm = (uu___134_1545.no_full_norm);
            check_no_uvars = (uu___134_1545.check_no_uvars);
            unmeta = (uu___134_1545.unmeta);
            unascribe = (uu___134_1545.unascribe);
            in_full_norm_request = (uu___134_1545.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___134_1545.weakly_reduce_scrutinee)
          }
      | UnfoldAttr attr ->
          let uu___135_1549 = fs  in
          {
            beta = (uu___135_1549.beta);
            iota = (uu___135_1549.iota);
            zeta = (uu___135_1549.zeta);
            weak = (uu___135_1549.weak);
            hnf = (uu___135_1549.hnf);
            primops = (uu___135_1549.primops);
            do_not_unfold_pure_lets = (uu___135_1549.do_not_unfold_pure_lets);
            unfold_until = (uu___135_1549.unfold_until);
            unfold_only = (uu___135_1549.unfold_only);
            unfold_fully = (uu___135_1549.unfold_fully);
            unfold_attr = (add_opt attr fs.unfold_attr);
            unfold_tac = (uu___135_1549.unfold_tac);
            pure_subterms_within_computations =
              (uu___135_1549.pure_subterms_within_computations);
            simplify = (uu___135_1549.simplify);
            erase_universes = (uu___135_1549.erase_universes);
            allow_unbound_universes = (uu___135_1549.allow_unbound_universes);
            reify_ = (uu___135_1549.reify_);
            compress_uvars = (uu___135_1549.compress_uvars);
            no_full_norm = (uu___135_1549.no_full_norm);
            check_no_uvars = (uu___135_1549.check_no_uvars);
            unmeta = (uu___135_1549.unmeta);
            unascribe = (uu___135_1549.unascribe);
            in_full_norm_request = (uu___135_1549.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___135_1549.weakly_reduce_scrutinee)
          }
      | UnfoldTac  ->
          let uu___136_1550 = fs  in
          {
            beta = (uu___136_1550.beta);
            iota = (uu___136_1550.iota);
            zeta = (uu___136_1550.zeta);
            weak = (uu___136_1550.weak);
            hnf = (uu___136_1550.hnf);
            primops = (uu___136_1550.primops);
            do_not_unfold_pure_lets = (uu___136_1550.do_not_unfold_pure_lets);
            unfold_until = (uu___136_1550.unfold_until);
            unfold_only = (uu___136_1550.unfold_only);
            unfold_fully = (uu___136_1550.unfold_fully);
            unfold_attr = (uu___136_1550.unfold_attr);
            unfold_tac = true;
            pure_subterms_within_computations =
              (uu___136_1550.pure_subterms_within_computations);
            simplify = (uu___136_1550.simplify);
            erase_universes = (uu___136_1550.erase_universes);
            allow_unbound_universes = (uu___136_1550.allow_unbound_universes);
            reify_ = (uu___136_1550.reify_);
            compress_uvars = (uu___136_1550.compress_uvars);
            no_full_norm = (uu___136_1550.no_full_norm);
            check_no_uvars = (uu___136_1550.check_no_uvars);
            unmeta = (uu___136_1550.unmeta);
            unascribe = (uu___136_1550.unascribe);
            in_full_norm_request = (uu___136_1550.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___136_1550.weakly_reduce_scrutinee)
          }
      | PureSubtermsWithinComputations  ->
          let uu___137_1551 = fs  in
          {
            beta = (uu___137_1551.beta);
            iota = (uu___137_1551.iota);
            zeta = (uu___137_1551.zeta);
            weak = (uu___137_1551.weak);
            hnf = (uu___137_1551.hnf);
            primops = (uu___137_1551.primops);
            do_not_unfold_pure_lets = (uu___137_1551.do_not_unfold_pure_lets);
            unfold_until = (uu___137_1551.unfold_until);
            unfold_only = (uu___137_1551.unfold_only);
            unfold_fully = (uu___137_1551.unfold_fully);
            unfold_attr = (uu___137_1551.unfold_attr);
            unfold_tac = (uu___137_1551.unfold_tac);
            pure_subterms_within_computations = true;
            simplify = (uu___137_1551.simplify);
            erase_universes = (uu___137_1551.erase_universes);
            allow_unbound_universes = (uu___137_1551.allow_unbound_universes);
            reify_ = (uu___137_1551.reify_);
            compress_uvars = (uu___137_1551.compress_uvars);
            no_full_norm = (uu___137_1551.no_full_norm);
            check_no_uvars = (uu___137_1551.check_no_uvars);
            unmeta = (uu___137_1551.unmeta);
            unascribe = (uu___137_1551.unascribe);
            in_full_norm_request = (uu___137_1551.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___137_1551.weakly_reduce_scrutinee)
          }
      | Simplify  ->
          let uu___138_1552 = fs  in
          {
            beta = (uu___138_1552.beta);
            iota = (uu___138_1552.iota);
            zeta = (uu___138_1552.zeta);
            weak = (uu___138_1552.weak);
            hnf = (uu___138_1552.hnf);
            primops = (uu___138_1552.primops);
            do_not_unfold_pure_lets = (uu___138_1552.do_not_unfold_pure_lets);
            unfold_until = (uu___138_1552.unfold_until);
            unfold_only = (uu___138_1552.unfold_only);
            unfold_fully = (uu___138_1552.unfold_fully);
            unfold_attr = (uu___138_1552.unfold_attr);
            unfold_tac = (uu___138_1552.unfold_tac);
            pure_subterms_within_computations =
              (uu___138_1552.pure_subterms_within_computations);
            simplify = true;
            erase_universes = (uu___138_1552.erase_universes);
            allow_unbound_universes = (uu___138_1552.allow_unbound_universes);
            reify_ = (uu___138_1552.reify_);
            compress_uvars = (uu___138_1552.compress_uvars);
            no_full_norm = (uu___138_1552.no_full_norm);
            check_no_uvars = (uu___138_1552.check_no_uvars);
            unmeta = (uu___138_1552.unmeta);
            unascribe = (uu___138_1552.unascribe);
            in_full_norm_request = (uu___138_1552.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___138_1552.weakly_reduce_scrutinee)
          }
      | EraseUniverses  ->
          let uu___139_1553 = fs  in
          {
            beta = (uu___139_1553.beta);
            iota = (uu___139_1553.iota);
            zeta = (uu___139_1553.zeta);
            weak = (uu___139_1553.weak);
            hnf = (uu___139_1553.hnf);
            primops = (uu___139_1553.primops);
            do_not_unfold_pure_lets = (uu___139_1553.do_not_unfold_pure_lets);
            unfold_until = (uu___139_1553.unfold_until);
            unfold_only = (uu___139_1553.unfold_only);
            unfold_fully = (uu___139_1553.unfold_fully);
            unfold_attr = (uu___139_1553.unfold_attr);
            unfold_tac = (uu___139_1553.unfold_tac);
            pure_subterms_within_computations =
              (uu___139_1553.pure_subterms_within_computations);
            simplify = (uu___139_1553.simplify);
            erase_universes = true;
            allow_unbound_universes = (uu___139_1553.allow_unbound_universes);
            reify_ = (uu___139_1553.reify_);
            compress_uvars = (uu___139_1553.compress_uvars);
            no_full_norm = (uu___139_1553.no_full_norm);
            check_no_uvars = (uu___139_1553.check_no_uvars);
            unmeta = (uu___139_1553.unmeta);
            unascribe = (uu___139_1553.unascribe);
            in_full_norm_request = (uu___139_1553.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___139_1553.weakly_reduce_scrutinee)
          }
      | AllowUnboundUniverses  ->
          let uu___140_1554 = fs  in
          {
            beta = (uu___140_1554.beta);
            iota = (uu___140_1554.iota);
            zeta = (uu___140_1554.zeta);
            weak = (uu___140_1554.weak);
            hnf = (uu___140_1554.hnf);
            primops = (uu___140_1554.primops);
            do_not_unfold_pure_lets = (uu___140_1554.do_not_unfold_pure_lets);
            unfold_until = (uu___140_1554.unfold_until);
            unfold_only = (uu___140_1554.unfold_only);
            unfold_fully = (uu___140_1554.unfold_fully);
            unfold_attr = (uu___140_1554.unfold_attr);
            unfold_tac = (uu___140_1554.unfold_tac);
            pure_subterms_within_computations =
              (uu___140_1554.pure_subterms_within_computations);
            simplify = (uu___140_1554.simplify);
            erase_universes = (uu___140_1554.erase_universes);
            allow_unbound_universes = true;
            reify_ = (uu___140_1554.reify_);
            compress_uvars = (uu___140_1554.compress_uvars);
            no_full_norm = (uu___140_1554.no_full_norm);
            check_no_uvars = (uu___140_1554.check_no_uvars);
            unmeta = (uu___140_1554.unmeta);
            unascribe = (uu___140_1554.unascribe);
            in_full_norm_request = (uu___140_1554.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___140_1554.weakly_reduce_scrutinee)
          }
      | Reify  ->
          let uu___141_1555 = fs  in
          {
            beta = (uu___141_1555.beta);
            iota = (uu___141_1555.iota);
            zeta = (uu___141_1555.zeta);
            weak = (uu___141_1555.weak);
            hnf = (uu___141_1555.hnf);
            primops = (uu___141_1555.primops);
            do_not_unfold_pure_lets = (uu___141_1555.do_not_unfold_pure_lets);
            unfold_until = (uu___141_1555.unfold_until);
            unfold_only = (uu___141_1555.unfold_only);
            unfold_fully = (uu___141_1555.unfold_fully);
            unfold_attr = (uu___141_1555.unfold_attr);
            unfold_tac = (uu___141_1555.unfold_tac);
            pure_subterms_within_computations =
              (uu___141_1555.pure_subterms_within_computations);
            simplify = (uu___141_1555.simplify);
            erase_universes = (uu___141_1555.erase_universes);
            allow_unbound_universes = (uu___141_1555.allow_unbound_universes);
            reify_ = true;
            compress_uvars = (uu___141_1555.compress_uvars);
            no_full_norm = (uu___141_1555.no_full_norm);
            check_no_uvars = (uu___141_1555.check_no_uvars);
            unmeta = (uu___141_1555.unmeta);
            unascribe = (uu___141_1555.unascribe);
            in_full_norm_request = (uu___141_1555.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___141_1555.weakly_reduce_scrutinee)
          }
      | CompressUvars  ->
          let uu___142_1556 = fs  in
          {
            beta = (uu___142_1556.beta);
            iota = (uu___142_1556.iota);
            zeta = (uu___142_1556.zeta);
            weak = (uu___142_1556.weak);
            hnf = (uu___142_1556.hnf);
            primops = (uu___142_1556.primops);
            do_not_unfold_pure_lets = (uu___142_1556.do_not_unfold_pure_lets);
            unfold_until = (uu___142_1556.unfold_until);
            unfold_only = (uu___142_1556.unfold_only);
            unfold_fully = (uu___142_1556.unfold_fully);
            unfold_attr = (uu___142_1556.unfold_attr);
            unfold_tac = (uu___142_1556.unfold_tac);
            pure_subterms_within_computations =
              (uu___142_1556.pure_subterms_within_computations);
            simplify = (uu___142_1556.simplify);
            erase_universes = (uu___142_1556.erase_universes);
            allow_unbound_universes = (uu___142_1556.allow_unbound_universes);
            reify_ = (uu___142_1556.reify_);
            compress_uvars = true;
            no_full_norm = (uu___142_1556.no_full_norm);
            check_no_uvars = (uu___142_1556.check_no_uvars);
            unmeta = (uu___142_1556.unmeta);
            unascribe = (uu___142_1556.unascribe);
            in_full_norm_request = (uu___142_1556.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___142_1556.weakly_reduce_scrutinee)
          }
      | NoFullNorm  ->
          let uu___143_1557 = fs  in
          {
            beta = (uu___143_1557.beta);
            iota = (uu___143_1557.iota);
            zeta = (uu___143_1557.zeta);
            weak = (uu___143_1557.weak);
            hnf = (uu___143_1557.hnf);
            primops = (uu___143_1557.primops);
            do_not_unfold_pure_lets = (uu___143_1557.do_not_unfold_pure_lets);
            unfold_until = (uu___143_1557.unfold_until);
            unfold_only = (uu___143_1557.unfold_only);
            unfold_fully = (uu___143_1557.unfold_fully);
            unfold_attr = (uu___143_1557.unfold_attr);
            unfold_tac = (uu___143_1557.unfold_tac);
            pure_subterms_within_computations =
              (uu___143_1557.pure_subterms_within_computations);
            simplify = (uu___143_1557.simplify);
            erase_universes = (uu___143_1557.erase_universes);
            allow_unbound_universes = (uu___143_1557.allow_unbound_universes);
            reify_ = (uu___143_1557.reify_);
            compress_uvars = (uu___143_1557.compress_uvars);
            no_full_norm = true;
            check_no_uvars = (uu___143_1557.check_no_uvars);
            unmeta = (uu___143_1557.unmeta);
            unascribe = (uu___143_1557.unascribe);
            in_full_norm_request = (uu___143_1557.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___143_1557.weakly_reduce_scrutinee)
          }
      | CheckNoUvars  ->
          let uu___144_1558 = fs  in
          {
            beta = (uu___144_1558.beta);
            iota = (uu___144_1558.iota);
            zeta = (uu___144_1558.zeta);
            weak = (uu___144_1558.weak);
            hnf = (uu___144_1558.hnf);
            primops = (uu___144_1558.primops);
            do_not_unfold_pure_lets = (uu___144_1558.do_not_unfold_pure_lets);
            unfold_until = (uu___144_1558.unfold_until);
            unfold_only = (uu___144_1558.unfold_only);
            unfold_fully = (uu___144_1558.unfold_fully);
            unfold_attr = (uu___144_1558.unfold_attr);
            unfold_tac = (uu___144_1558.unfold_tac);
            pure_subterms_within_computations =
              (uu___144_1558.pure_subterms_within_computations);
            simplify = (uu___144_1558.simplify);
            erase_universes = (uu___144_1558.erase_universes);
            allow_unbound_universes = (uu___144_1558.allow_unbound_universes);
            reify_ = (uu___144_1558.reify_);
            compress_uvars = (uu___144_1558.compress_uvars);
            no_full_norm = (uu___144_1558.no_full_norm);
            check_no_uvars = true;
            unmeta = (uu___144_1558.unmeta);
            unascribe = (uu___144_1558.unascribe);
            in_full_norm_request = (uu___144_1558.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___144_1558.weakly_reduce_scrutinee)
          }
      | Unmeta  ->
          let uu___145_1559 = fs  in
          {
            beta = (uu___145_1559.beta);
            iota = (uu___145_1559.iota);
            zeta = (uu___145_1559.zeta);
            weak = (uu___145_1559.weak);
            hnf = (uu___145_1559.hnf);
            primops = (uu___145_1559.primops);
            do_not_unfold_pure_lets = (uu___145_1559.do_not_unfold_pure_lets);
            unfold_until = (uu___145_1559.unfold_until);
            unfold_only = (uu___145_1559.unfold_only);
            unfold_fully = (uu___145_1559.unfold_fully);
            unfold_attr = (uu___145_1559.unfold_attr);
            unfold_tac = (uu___145_1559.unfold_tac);
            pure_subterms_within_computations =
              (uu___145_1559.pure_subterms_within_computations);
            simplify = (uu___145_1559.simplify);
            erase_universes = (uu___145_1559.erase_universes);
            allow_unbound_universes = (uu___145_1559.allow_unbound_universes);
            reify_ = (uu___145_1559.reify_);
            compress_uvars = (uu___145_1559.compress_uvars);
            no_full_norm = (uu___145_1559.no_full_norm);
            check_no_uvars = (uu___145_1559.check_no_uvars);
            unmeta = true;
            unascribe = (uu___145_1559.unascribe);
            in_full_norm_request = (uu___145_1559.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___145_1559.weakly_reduce_scrutinee)
          }
      | Unascribe  ->
          let uu___146_1560 = fs  in
          {
            beta = (uu___146_1560.beta);
            iota = (uu___146_1560.iota);
            zeta = (uu___146_1560.zeta);
            weak = (uu___146_1560.weak);
            hnf = (uu___146_1560.hnf);
            primops = (uu___146_1560.primops);
            do_not_unfold_pure_lets = (uu___146_1560.do_not_unfold_pure_lets);
            unfold_until = (uu___146_1560.unfold_until);
            unfold_only = (uu___146_1560.unfold_only);
            unfold_fully = (uu___146_1560.unfold_fully);
            unfold_attr = (uu___146_1560.unfold_attr);
            unfold_tac = (uu___146_1560.unfold_tac);
            pure_subterms_within_computations =
              (uu___146_1560.pure_subterms_within_computations);
            simplify = (uu___146_1560.simplify);
            erase_universes = (uu___146_1560.erase_universes);
            allow_unbound_universes = (uu___146_1560.allow_unbound_universes);
            reify_ = (uu___146_1560.reify_);
            compress_uvars = (uu___146_1560.compress_uvars);
            no_full_norm = (uu___146_1560.no_full_norm);
            check_no_uvars = (uu___146_1560.check_no_uvars);
            unmeta = (uu___146_1560.unmeta);
            unascribe = true;
            in_full_norm_request = (uu___146_1560.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___146_1560.weakly_reduce_scrutinee)
          }
  
let rec (to_fsteps : step Prims.list -> fsteps) =
  fun s  -> FStar_List.fold_right fstep_add_one s default_steps 
type psc =
  {
  psc_range: FStar_Range.range ;
  psc_subst: unit -> FStar_Syntax_Syntax.subst_t }
let (__proj__Mkpsc__item__psc_range : psc -> FStar_Range.range) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_range
  
let (__proj__Mkpsc__item__psc_subst :
  psc -> unit -> FStar_Syntax_Syntax.subst_t) =
  fun projectee  ->
    match projectee with
    | { psc_range = __fname__psc_range; psc_subst = __fname__psc_subst;_} ->
        __fname__psc_subst
  
let (null_psc : psc) =
  { psc_range = FStar_Range.dummyRange; psc_subst = (fun uu____1613  -> []) } 
let (psc_range : psc -> FStar_Range.range) = fun psc  -> psc.psc_range 
let (psc_subst : psc -> FStar_Syntax_Syntax.subst_t) =
  fun psc  -> psc.psc_subst () 
type primitive_step =
  {
  name: FStar_Ident.lid ;
  arity: Prims.int ;
  auto_reflect: Prims.int FStar_Pervasives_Native.option ;
  strong_reduction_ok: Prims.bool ;
  requires_binder_substitution: Prims.bool ;
  interpretation:
    psc ->
      FStar_Syntax_Syntax.args ->
        FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
    }
let (__proj__Mkprimitive_step__item__name :
  primitive_step -> FStar_Ident.lid) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__name
  
let (__proj__Mkprimitive_step__item__arity : primitive_step -> Prims.int) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__arity
  
let (__proj__Mkprimitive_step__item__auto_reflect :
  primitive_step -> Prims.int FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} -> __fname__auto_reflect
  
let (__proj__Mkprimitive_step__item__strong_reduction_ok :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__strong_reduction_ok
  
let (__proj__Mkprimitive_step__item__requires_binder_substitution :
  primitive_step -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__requires_binder_substitution
  
let (__proj__Mkprimitive_step__item__interpretation :
  primitive_step ->
    psc ->
      FStar_Syntax_Syntax.args ->
        FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        auto_reflect = __fname__auto_reflect;
        strong_reduction_ok = __fname__strong_reduction_ok;
        requires_binder_substitution = __fname__requires_binder_substitution;
        interpretation = __fname__interpretation;_} ->
        __fname__interpretation
  
type closure =
  | Clos of
  ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
     FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term,
  ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
     FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term)
    FStar_Pervasives_Native.tuple2 FStar_Syntax_Syntax.memo,Prims.bool)
  FStar_Pervasives_Native.tuple4 
  | Univ of FStar_Syntax_Syntax.universe 
  | Dummy 
let (uu___is_Clos : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Clos _0 -> true | uu____1902 -> false
  
let (__proj__Clos__item___0 :
  closure ->
    ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
       FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term,
      ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
         FStar_Pervasives_Native.tuple2 Prims.list,FStar_Syntax_Syntax.term)
        FStar_Pervasives_Native.tuple2 FStar_Syntax_Syntax.memo,Prims.bool)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Clos _0 -> _0 
let (uu___is_Univ : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Univ _0 -> true | uu____2006 -> false
  
let (__proj__Univ__item___0 : closure -> FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | Univ _0 -> _0 
let (uu___is_Dummy : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Dummy  -> true | uu____2019 -> false
  
type env =
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list
let (dummy :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2)
  = (FStar_Pervasives_Native.None, Dummy) 
type debug_switches =
  {
  gen: Prims.bool ;
  primop: Prims.bool ;
  b380: Prims.bool ;
  wpe: Prims.bool ;
  norm_delayed: Prims.bool ;
  print_normalized: Prims.bool }
let (__proj__Mkdebug_switches__item__gen : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__gen
  
let (__proj__Mkdebug_switches__item__primop : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__primop
  
let (__proj__Mkdebug_switches__item__b380 : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__b380
  
let (__proj__Mkdebug_switches__item__wpe : debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} -> __fname__wpe
  
let (__proj__Mkdebug_switches__item__norm_delayed :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__norm_delayed
  
let (__proj__Mkdebug_switches__item__print_normalized :
  debug_switches -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { gen = __fname__gen; primop = __fname__primop; b380 = __fname__b380;
        wpe = __fname__wpe; norm_delayed = __fname__norm_delayed;
        print_normalized = __fname__print_normalized;_} ->
        __fname__print_normalized
  
type cfg =
  {
  steps: fsteps ;
  tcenv: FStar_TypeChecker_Env.env ;
  debug: debug_switches ;
  delta_level: FStar_TypeChecker_Env.delta_level Prims.list ;
  primitive_steps: primitive_step FStar_Util.psmap ;
  strong: Prims.bool ;
  memoize_lazy: Prims.bool ;
  normalize_pure_lets: Prims.bool }
let (__proj__Mkcfg__item__steps : cfg -> fsteps) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__steps
  
let (__proj__Mkcfg__item__tcenv : cfg -> FStar_TypeChecker_Env.env) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__tcenv
  
let (__proj__Mkcfg__item__debug : cfg -> debug_switches) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__debug
  
let (__proj__Mkcfg__item__delta_level :
  cfg -> FStar_TypeChecker_Env.delta_level Prims.list) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__delta_level
  
let (__proj__Mkcfg__item__primitive_steps :
  cfg -> primitive_step FStar_Util.psmap) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__primitive_steps
  
let (__proj__Mkcfg__item__strong : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__strong
  
let (__proj__Mkcfg__item__memoize_lazy : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__memoize_lazy
  
let (__proj__Mkcfg__item__normalize_pure_lets : cfg -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        debug = __fname__debug; delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps; strong = __fname__strong;
        memoize_lazy = __fname__memoize_lazy;
        normalize_pure_lets = __fname__normalize_pure_lets;_} ->
        __fname__normalize_pure_lets
  
let (add_steps :
  primitive_step FStar_Util.psmap ->
    primitive_step Prims.list -> primitive_step FStar_Util.psmap)
  =
  fun m  ->
    fun l  ->
      FStar_List.fold_right
        (fun p  ->
           fun m1  ->
             let uu____2351 = FStar_Ident.text_of_lid p.name  in
             FStar_Util.psmap_add m1 uu____2351 p) l m
  
let (prim_from_list :
  primitive_step Prims.list -> primitive_step FStar_Util.psmap) =
  fun l  ->
    let uu____2365 = FStar_Util.psmap_empty ()  in add_steps uu____2365 l
  
let (find_prim_step :
  cfg ->
    FStar_Syntax_Syntax.fv -> primitive_step FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun fv  ->
      let uu____2380 =
        FStar_Ident.text_of_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
         in
      FStar_Util.psmap_try_find cfg.primitive_steps uu____2380
  
type branches =
  (FStar_Syntax_Syntax.pat,FStar_Syntax_Syntax.term
                             FStar_Pervasives_Native.option,FStar_Syntax_Syntax.term)
    FStar_Pervasives_Native.tuple3 Prims.list
type stack_elt =
  | Arg of (closure,FStar_Syntax_Syntax.aqual,FStar_Range.range)
  FStar_Pervasives_Native.tuple3 
  | UnivArgs of (FStar_Syntax_Syntax.universe Prims.list,FStar_Range.range)
  FStar_Pervasives_Native.tuple2 
  | MemoLazy of (env,FStar_Syntax_Syntax.term) FStar_Pervasives_Native.tuple2
  FStar_Syntax_Syntax.memo 
  | Match of (env,branches,cfg,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Abs of
  (env,FStar_Syntax_Syntax.binders,env,FStar_Syntax_Syntax.residual_comp
                                         FStar_Pervasives_Native.option,
  FStar_Range.range) FStar_Pervasives_Native.tuple5 
  | App of
  (env,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Meta of (env,FStar_Syntax_Syntax.metadata,FStar_Range.range)
  FStar_Pervasives_Native.tuple3 
  | Let of
  (env,FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.letbinding,FStar_Range.range)
  FStar_Pervasives_Native.tuple4 
  | Cfg of cfg 
  | Debug of (FStar_Syntax_Syntax.term,FStar_Util.time)
  FStar_Pervasives_Native.tuple2 
let (uu___is_Arg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Arg _0 -> true | uu____2538 -> false
  
let (__proj__Arg__item___0 :
  stack_elt ->
    (closure,FStar_Syntax_Syntax.aqual,FStar_Range.range)
      FStar_Pervasives_Native.tuple3)
  = fun projectee  -> match projectee with | Arg _0 -> _0 
let (uu___is_UnivArgs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnivArgs _0 -> true | uu____2576 -> false
  
let (__proj__UnivArgs__item___0 :
  stack_elt ->
    (FStar_Syntax_Syntax.universe Prims.list,FStar_Range.range)
      FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | UnivArgs _0 -> _0 
let (uu___is_MemoLazy : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | MemoLazy _0 -> true | uu____2614 -> false
  
let (__proj__MemoLazy__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.term) FStar_Pervasives_Native.tuple2
      FStar_Syntax_Syntax.memo)
  = fun projectee  -> match projectee with | MemoLazy _0 -> _0 
let (uu___is_Match : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Match _0 -> true | uu____2687 -> false
  
let (__proj__Match__item___0 :
  stack_elt ->
    (env,branches,cfg,FStar_Range.range) FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Match _0 -> _0 
let (uu___is_Abs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Abs _0 -> true | uu____2737 -> false
  
let (__proj__Abs__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.binders,env,FStar_Syntax_Syntax.residual_comp
                                           FStar_Pervasives_Native.option,
      FStar_Range.range) FStar_Pervasives_Native.tuple5)
  = fun projectee  -> match projectee with | Abs _0 -> _0 
let (uu___is_App : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____2795 -> false
  
let (__proj__App__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.aqual,FStar_Range.range)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | App _0 -> _0 
let (uu___is_Meta : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Meta _0 -> true | uu____2839 -> false
  
let (__proj__Meta__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.metadata,FStar_Range.range)
      FStar_Pervasives_Native.tuple3)
  = fun projectee  -> match projectee with | Meta _0 -> _0 
let (uu___is_Let : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Let _0 -> true | uu____2879 -> false
  
let (__proj__Let__item___0 :
  stack_elt ->
    (env,FStar_Syntax_Syntax.binders,FStar_Syntax_Syntax.letbinding,FStar_Range.range)
      FStar_Pervasives_Native.tuple4)
  = fun projectee  -> match projectee with | Let _0 -> _0 
let (uu___is_Cfg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Cfg _0 -> true | uu____2917 -> false
  
let (__proj__Cfg__item___0 : stack_elt -> cfg) =
  fun projectee  -> match projectee with | Cfg _0 -> _0 
let (uu___is_Debug : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Debug _0 -> true | uu____2935 -> false
  
let (__proj__Debug__item___0 :
  stack_elt ->
    (FStar_Syntax_Syntax.term,FStar_Util.time) FStar_Pervasives_Native.tuple2)
  = fun projectee  -> match projectee with | Debug _0 -> _0 
type stack = stack_elt Prims.list
let (head_of : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____2962 = FStar_Syntax_Util.head_and_args' t  in
    match uu____2962 with | (hd1,uu____2976) -> hd1
  
let mk :
  'Auu____2999 .
    'Auu____2999 ->
      FStar_Range.range -> 'Auu____2999 FStar_Syntax_Syntax.syntax
  =
  fun t  -> fun r  -> FStar_Syntax_Syntax.mk t FStar_Pervasives_Native.None r 
let set_memo : 'a . cfg -> 'a FStar_Syntax_Syntax.memo -> 'a -> unit =
  fun cfg  ->
    fun r  ->
      fun t  ->
        if cfg.memoize_lazy
        then
          let uu____3062 = FStar_ST.op_Bang r  in
          match uu____3062 with
          | FStar_Pervasives_Native.Some uu____3114 ->
              failwith "Unexpected set_memo: thunk already evaluated"
          | FStar_Pervasives_Native.None  ->
              FStar_ST.op_Colon_Equals r (FStar_Pervasives_Native.Some t)
        else ()
  
let rec (env_to_string :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list -> Prims.string)
  =
  fun env  ->
    let uu____3190 =
      FStar_List.map
        (fun uu____3204  ->
           match uu____3204 with
           | (bopt,c) ->
               let uu____3217 =
                 match bopt with
                 | FStar_Pervasives_Native.None  -> "."
                 | FStar_Pervasives_Native.Some x ->
                     FStar_Syntax_Print.binder_to_string x
                  in
               let uu____3219 = closure_to_string c  in
               FStar_Util.format2 "(%s, %s)" uu____3217 uu____3219) env
       in
    FStar_All.pipe_right uu____3190 (FStar_String.concat "; ")

and (closure_to_string : closure -> Prims.string) =
  fun uu___104_3222  ->
    match uu___104_3222 with
    | Clos (env,t,uu____3225,uu____3226) ->
        let uu____3271 =
          FStar_All.pipe_right (FStar_List.length env)
            FStar_Util.string_of_int
           in
        let uu____3278 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format2 "(env=%s elts; %s)" uu____3271 uu____3278
    | Univ uu____3279 -> "Univ"
    | Dummy  -> "dummy"

let (stack_elt_to_string : stack_elt -> Prims.string) =
  fun uu___105_3284  ->
    match uu___105_3284 with
    | Arg (c,uu____3286,uu____3287) ->
        let uu____3288 = closure_to_string c  in
        FStar_Util.format1 "Closure %s" uu____3288
    | MemoLazy uu____3289 -> "MemoLazy"
    | Abs (uu____3296,bs,uu____3298,uu____3299,uu____3300) ->
        let uu____3305 =
          FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs)
           in
        FStar_Util.format1 "Abs %s" uu____3305
    | UnivArgs uu____3310 -> "UnivArgs"
    | Match uu____3317 -> "Match"
    | App (uu____3326,t,uu____3328,uu____3329) ->
        let uu____3330 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "App %s" uu____3330
    | Meta (uu____3331,m,uu____3333) -> "Meta"
    | Let uu____3334 -> "Let"
    | Cfg uu____3343 -> "Cfg"
    | Debug (t,uu____3345) ->
        let uu____3346 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "Debug %s" uu____3346
  
let (stack_to_string : stack_elt Prims.list -> Prims.string) =
  fun s  ->
    let uu____3356 = FStar_List.map stack_elt_to_string s  in
    FStar_All.pipe_right uu____3356 (FStar_String.concat "; ")
  
let (log : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).gen then f () else () 
let (log_primops : cfg -> (unit -> unit) -> unit) =
  fun cfg  -> fun f  -> if (cfg.debug).primop then f () else () 
let is_empty : 'Auu____3397 . 'Auu____3397 Prims.list -> Prims.bool =
  fun uu___106_3404  ->
    match uu___106_3404 with | [] -> true | uu____3407 -> false
  
let (lookup_bvar :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option,closure)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    FStar_Syntax_Syntax.bv -> closure)
  =
  fun env  ->
    fun x  ->
      try
        let uu____3439 = FStar_List.nth env x.FStar_Syntax_Syntax.index  in
        FStar_Pervasives_Native.snd uu____3439
      with
      | uu____3458 ->
          let uu____3459 =
            let uu____3460 = FStar_Syntax_Print.db_to_string x  in
            let uu____3461 = env_to_string env  in
            FStar_Util.format2 "Failed to find %s\nEnv is %s\n" uu____3460
              uu____3461
             in
          failwith uu____3459
  
let (downgrade_ghost_effect_name :
  FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option) =
  fun l  ->
    let uu____3469 =
      FStar_Ident.lid_equals l FStar_Parser_Const.effect_Ghost_lid  in
    if uu____3469
    then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Pure_lid
    else
      (let uu____3473 =
         FStar_Ident.lid_equals l FStar_Parser_Const.effect_GTot_lid  in
       if uu____3473
       then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Tot_lid
       else
         (let uu____3477 =
            FStar_Ident.lid_equals l FStar_Parser_Const.effect_GHOST_lid  in
          if uu____3477
          then
            FStar_Pervasives_Native.Some FStar_Parser_Const.effect_PURE_lid
          else FStar_Pervasives_Native.None))
  
let (norm_universe :
  cfg -> env -> FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun cfg  ->
    fun env  ->
      fun u  ->
        let norm_univs us =
          let us1 = FStar_Util.sort_with FStar_Syntax_Util.compare_univs us
             in
          let uu____3511 =
            FStar_List.fold_left
              (fun uu____3537  ->
                 fun u1  ->
                   match uu____3537 with
                   | (cur_kernel,cur_max,out) ->
                       let uu____3562 = FStar_Syntax_Util.univ_kernel u1  in
                       (match uu____3562 with
                        | (k_u,n1) ->
                            let uu____3577 =
                              FStar_Syntax_Util.eq_univs cur_kernel k_u  in
                            if uu____3577
                            then (cur_kernel, u1, out)
                            else (k_u, u1, (cur_max :: out))))
              (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero, [])
              us1
             in
          match uu____3511 with
          | (uu____3595,u1,out) -> FStar_List.rev (u1 :: out)  in
        let rec aux u1 =
          let u2 = FStar_Syntax_Subst.compress_univ u1  in
          match u2 with
          | FStar_Syntax_Syntax.U_bvar x ->
              (try
                 let uu____3622 =
                   let uu____3623 = FStar_List.nth env x  in
                   FStar_Pervasives_Native.snd uu____3623  in
                 match uu____3622 with
                 | Univ u3 -> aux u3
                 | Dummy  -> [u2]
                 | uu____3641 ->
                     failwith "Impossible: universe variable bound to a term"
               with
               | uu____3649 ->
                   if (cfg.steps).allow_unbound_universes
                   then [FStar_Syntax_Syntax.U_unknown]
                   else failwith "Universe variable not found")
          | FStar_Syntax_Syntax.U_unif uu____3655 when
              (cfg.steps).check_no_uvars -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_zero  -> [u2]
          | FStar_Syntax_Syntax.U_unif uu____3664 -> [u2]
          | FStar_Syntax_Syntax.U_name uu____3673 -> [u2]
          | FStar_Syntax_Syntax.U_unknown  -> [u2]
          | FStar_Syntax_Syntax.U_max [] -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_max us ->
              let us1 =
                let uu____3680 = FStar_List.collect aux us  in
                FStar_All.pipe_right uu____3680 norm_univs  in
              (match us1 with
               | u_k::hd1::rest ->
                   let rest1 = hd1 :: rest  in
                   let uu____3697 = FStar_Syntax_Util.univ_kernel u_k  in
                   (match uu____3697 with
                    | (FStar_Syntax_Syntax.U_zero ,n1) ->
                        let uu____3705 =
                          FStar_All.pipe_right rest1
                            (FStar_List.for_all
                               (fun u3  ->
                                  let uu____3713 =
                                    FStar_Syntax_Util.univ_kernel u3  in
                                  match uu____3713 with
                                  | (uu____3718,m) -> n1 <= m))
                           in
                        if uu____3705 then rest1 else us1
                    | uu____3723 -> us1)
               | uu____3728 -> us1)
          | FStar_Syntax_Syntax.U_succ u3 ->
              let uu____3732 = aux u3  in
              FStar_List.map (fun _0_16  -> FStar_Syntax_Syntax.U_succ _0_16)
                uu____3732
           in
        if (cfg.steps).erase_universes
        then FStar_Syntax_Syntax.U_unknown
        else
          (let uu____3736 = aux u  in
           match uu____3736 with
           | [] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::[] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::u1::[] -> u1
           | (FStar_Syntax_Syntax.U_zero )::us ->
               FStar_Syntax_Syntax.U_max us
           | u1::[] -> u1
           | us -> FStar_Syntax_Syntax.U_max us)
  
let rec (inline_closure_env :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____3884  ->
               let uu____3885 = FStar_Syntax_Print.tag_of_term t  in
               let uu____3886 = env_to_string env  in
               let uu____3887 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print3 "\n>>> %s (env=%s) Closure_as_term %s\n"
                 uu____3885 uu____3886 uu____3887);
          (match env with
           | [] when
               FStar_All.pipe_left Prims.op_Negation
                 (cfg.steps).compress_uvars
               -> rebuild_closure cfg env stack t
           | uu____3896 ->
               (match t.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_delayed uu____3899 ->
                    let uu____3924 = FStar_Syntax_Subst.compress t  in
                    inline_closure_env cfg env stack uu____3924
                | FStar_Syntax_Syntax.Tm_unknown  ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_constant uu____3925 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_name uu____3926 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_lazy uu____3927 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_fvar uu____3928 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_uvar (uv,s) ->
                    if (cfg.steps).check_no_uvars
                    then
                      let t1 = FStar_Syntax_Subst.compress t  in
                      (match t1.FStar_Syntax_Syntax.n with
                       | FStar_Syntax_Syntax.Tm_uvar uu____3956 ->
                           let uu____3971 =
                             let uu____3972 =
                               FStar_Range.string_of_range
                                 t1.FStar_Syntax_Syntax.pos
                                in
                             let uu____3973 =
                               FStar_Syntax_Print.term_to_string t1  in
                             FStar_Util.format2
                               "(%s): CheckNoUvars: Unexpected unification variable remains: %s"
                               uu____3972 uu____3973
                              in
                           failwith uu____3971
                       | uu____3976 -> inline_closure_env cfg env stack t1)
                    else
                      (let s' =
                         FStar_All.pipe_right (FStar_Pervasives_Native.fst s)
                           (FStar_List.map
                              (fun s1  ->
                                 FStar_All.pipe_right s1
                                   (FStar_List.map
                                      (fun uu___107_4013  ->
                                         match uu___107_4013 with
                                         | FStar_Syntax_Syntax.NT (x,t1) ->
                                             let uu____4020 =
                                               let uu____4027 =
                                                 inline_closure_env cfg env
                                                   [] t1
                                                  in
                                               (x, uu____4027)  in
                                             FStar_Syntax_Syntax.NT
                                               uu____4020
                                         | FStar_Syntax_Syntax.NM (x,i) ->
                                             let x_i =
                                               FStar_Syntax_Syntax.bv_to_tm
                                                 (let uu___151_4037 = x  in
                                                  {
                                                    FStar_Syntax_Syntax.ppname
                                                      =
                                                      (uu___151_4037.FStar_Syntax_Syntax.ppname);
                                                    FStar_Syntax_Syntax.index
                                                      = i;
                                                    FStar_Syntax_Syntax.sort
                                                      =
                                                      (uu___151_4037.FStar_Syntax_Syntax.sort)
                                                  })
                                                in
                                             let t1 =
                                               inline_closure_env cfg env []
                                                 x_i
                                                in
                                             (match t1.FStar_Syntax_Syntax.n
                                              with
                                              | FStar_Syntax_Syntax.Tm_bvar
                                                  x_j ->
                                                  FStar_Syntax_Syntax.NM
                                                    (x,
                                                      (x_j.FStar_Syntax_Syntax.index))
                                              | uu____4042 ->
                                                  FStar_Syntax_Syntax.NT
                                                    (x, t1))
                                         | uu____4045 ->
                                             failwith
                                               "Impossible: subst invariant of uvar nodes"))))
                          in
                       let t1 =
                         let uu___152_4049 = t  in
                         {
                           FStar_Syntax_Syntax.n =
                             (FStar_Syntax_Syntax.Tm_uvar
                                (uv, (s', (FStar_Pervasives_Native.snd s))));
                           FStar_Syntax_Syntax.pos =
                             (uu___152_4049.FStar_Syntax_Syntax.pos);
                           FStar_Syntax_Syntax.vars =
                             (uu___152_4049.FStar_Syntax_Syntax.vars)
                         }  in
                       rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_type u ->
                    let t1 =
                      let uu____4076 =
                        let uu____4077 = norm_universe cfg env u  in
                        FStar_Syntax_Syntax.Tm_type uu____4077  in
                      mk uu____4076 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
                    let t1 =
                      let uu____4085 =
                        FStar_List.map (norm_universe cfg env) us  in
                      FStar_Syntax_Syntax.mk_Tm_uinst t' uu____4085  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_bvar x ->
                    let uu____4087 = lookup_bvar env x  in
                    (match uu____4087 with
                     | Univ uu____4090 ->
                         failwith
                           "Impossible: term variable is bound to a universe"
                     | Dummy  ->
                         let x1 =
                           let uu___153_4094 = x  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___153_4094.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___153_4094.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort =
                               FStar_Syntax_Syntax.tun
                           }  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_bvar x1)
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1
                     | Clos (env1,t0,uu____4100,uu____4101) ->
                         inline_closure_env cfg env1 stack t0)
                | FStar_Syntax_Syntax.Tm_app (head1,args) ->
                    let stack1 =
                      FStar_All.pipe_right stack
                        (FStar_List.fold_right
                           (fun uu____4186  ->
                              fun stack1  ->
                                match uu____4186 with
                                | (a,aq) ->
                                    let uu____4198 =
                                      let uu____4199 =
                                        let uu____4206 =
                                          let uu____4207 =
                                            let uu____4238 =
                                              FStar_Util.mk_ref
                                                FStar_Pervasives_Native.None
                                               in
                                            (env, a, uu____4238, false)  in
                                          Clos uu____4207  in
                                        (uu____4206, aq,
                                          (t.FStar_Syntax_Syntax.pos))
                                         in
                                      Arg uu____4199  in
                                    uu____4198 :: stack1) args)
                       in
                    inline_closure_env cfg env stack1 head1
                | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
                    let env' =
                      FStar_All.pipe_right env
                        (FStar_List.fold_right
                           (fun _b  ->
                              fun env1  ->
                                (FStar_Pervasives_Native.None, Dummy) :: env1)
                           bs)
                       in
                    let stack1 =
                      (Abs (env, bs, env', lopt, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env' stack1 body
                | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                    let uu____4414 = close_binders cfg env bs  in
                    (match uu____4414 with
                     | (bs1,env') ->
                         let c1 = close_comp cfg env' c  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_arrow (bs1, c1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
                    let uu____4461 =
                      let uu____4472 =
                        let uu____4479 = FStar_Syntax_Syntax.mk_binder x  in
                        [uu____4479]  in
                      close_binders cfg env uu____4472  in
                    (match uu____4461 with
                     | (x1,env1) ->
                         let phi1 = non_tail_inline_closure_env cfg env1 phi
                            in
                         let t1 =
                           let uu____4502 =
                             let uu____4503 =
                               let uu____4510 =
                                 let uu____4511 = FStar_List.hd x1  in
                                 FStar_All.pipe_right uu____4511
                                   FStar_Pervasives_Native.fst
                                  in
                               (uu____4510, phi1)  in
                             FStar_Syntax_Syntax.Tm_refine uu____4503  in
                           mk uu____4502 t.FStar_Syntax_Syntax.pos  in
                         rebuild_closure cfg env1 stack t1)
                | FStar_Syntax_Syntax.Tm_ascribed (t1,(annot,tacopt),lopt) ->
                    let annot1 =
                      match annot with
                      | FStar_Util.Inl t2 ->
                          let uu____4602 =
                            non_tail_inline_closure_env cfg env t2  in
                          FStar_Util.Inl uu____4602
                      | FStar_Util.Inr c ->
                          let uu____4616 = close_comp cfg env c  in
                          FStar_Util.Inr uu____4616
                       in
                    let tacopt1 =
                      FStar_Util.map_opt tacopt
                        (non_tail_inline_closure_env cfg env)
                       in
                    let t2 =
                      let uu____4635 =
                        let uu____4636 =
                          let uu____4663 =
                            non_tail_inline_closure_env cfg env t1  in
                          (uu____4663, (annot1, tacopt1), lopt)  in
                        FStar_Syntax_Syntax.Tm_ascribed uu____4636  in
                      mk uu____4635 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t2
                | FStar_Syntax_Syntax.Tm_quoted (t',qi) ->
                    let t1 =
                      match qi.FStar_Syntax_Syntax.qkind with
                      | FStar_Syntax_Syntax.Quote_dynamic  ->
                          let uu____4709 =
                            let uu____4710 =
                              let uu____4717 =
                                non_tail_inline_closure_env cfg env t'  in
                              (uu____4717, qi)  in
                            FStar_Syntax_Syntax.Tm_quoted uu____4710  in
                          mk uu____4709 t.FStar_Syntax_Syntax.pos
                      | FStar_Syntax_Syntax.Quote_static  ->
                          let qi1 =
                            FStar_Syntax_Syntax.on_antiquoted
                              (non_tail_inline_closure_env cfg env) qi
                             in
                          mk (FStar_Syntax_Syntax.Tm_quoted (t', qi1))
                            t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_meta (t',m) ->
                    let stack1 = (Meta (env, m, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 t'
                | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                    let env0 = env  in
                    let env1 =
                      FStar_List.fold_left
                        (fun env1  -> fun uu____4769  -> dummy :: env1) env
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    let typ =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbtyp
                       in
                    let def =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbdef
                       in
                    let uu____4790 =
                      let uu____4801 = FStar_Syntax_Syntax.is_top_level [lb]
                         in
                      if uu____4801
                      then ((lb.FStar_Syntax_Syntax.lbname), body)
                      else
                        (let x =
                           FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                         let uu____4820 =
                           non_tail_inline_closure_env cfg (dummy :: env0)
                             body
                            in
                         ((FStar_Util.Inl
                             (let uu___154_4836 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___154_4836.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___154_4836.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = typ
                              })), uu____4820))
                       in
                    (match uu____4790 with
                     | (nm,body1) ->
                         let lb1 =
                           let uu___155_4854 = lb  in
                           {
                             FStar_Syntax_Syntax.lbname = nm;
                             FStar_Syntax_Syntax.lbunivs =
                               (uu___155_4854.FStar_Syntax_Syntax.lbunivs);
                             FStar_Syntax_Syntax.lbtyp = typ;
                             FStar_Syntax_Syntax.lbeff =
                               (uu___155_4854.FStar_Syntax_Syntax.lbeff);
                             FStar_Syntax_Syntax.lbdef = def;
                             FStar_Syntax_Syntax.lbattrs =
                               (uu___155_4854.FStar_Syntax_Syntax.lbattrs);
                             FStar_Syntax_Syntax.lbpos =
                               (uu___155_4854.FStar_Syntax_Syntax.lbpos)
                           }  in
                         let t1 =
                           mk
                             (FStar_Syntax_Syntax.Tm_let
                                ((false, [lb1]), body1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env0 stack t1)
                | FStar_Syntax_Syntax.Tm_let ((uu____4868,lbs),body) ->
                    let norm_one_lb env1 lb =
                      let env_univs =
                        FStar_List.fold_right
                          (fun uu____4931  -> fun env2  -> dummy :: env2)
                          lb.FStar_Syntax_Syntax.lbunivs env1
                         in
                      let env2 =
                        let uu____4948 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____4948
                        then env_univs
                        else
                          FStar_List.fold_right
                            (fun uu____4960  -> fun env2  -> dummy :: env2)
                            lbs env_univs
                         in
                      let ty =
                        non_tail_inline_closure_env cfg env_univs
                          lb.FStar_Syntax_Syntax.lbtyp
                         in
                      let nm =
                        let uu____4984 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____4984
                        then lb.FStar_Syntax_Syntax.lbname
                        else
                          (let x =
                             FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                              in
                           FStar_Util.Inl
                             (let uu___156_4992 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___156_4992.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___156_4992.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = ty
                              }))
                         in
                      let uu___157_4993 = lb  in
                      let uu____4994 =
                        non_tail_inline_closure_env cfg env2
                          lb.FStar_Syntax_Syntax.lbdef
                         in
                      {
                        FStar_Syntax_Syntax.lbname = nm;
                        FStar_Syntax_Syntax.lbunivs =
                          (uu___157_4993.FStar_Syntax_Syntax.lbunivs);
                        FStar_Syntax_Syntax.lbtyp = ty;
                        FStar_Syntax_Syntax.lbeff =
                          (uu___157_4993.FStar_Syntax_Syntax.lbeff);
                        FStar_Syntax_Syntax.lbdef = uu____4994;
                        FStar_Syntax_Syntax.lbattrs =
                          (uu___157_4993.FStar_Syntax_Syntax.lbattrs);
                        FStar_Syntax_Syntax.lbpos =
                          (uu___157_4993.FStar_Syntax_Syntax.lbpos)
                      }  in
                    let lbs1 =
                      FStar_All.pipe_right lbs
                        (FStar_List.map (norm_one_lb env))
                       in
                    let body1 =
                      let body_env =
                        FStar_List.fold_right
                          (fun uu____5026  -> fun env1  -> dummy :: env1)
                          lbs1 env
                         in
                      non_tail_inline_closure_env cfg body_env body  in
                    let t1 =
                      mk (FStar_Syntax_Syntax.Tm_let ((true, lbs1), body1))
                        t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
                    let stack1 =
                      (Match
                         (env, branches, cfg, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 head1))

and (non_tail_inline_closure_env :
  cfg ->
    env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  = fun cfg  -> fun env  -> fun t  -> inline_closure_env cfg env [] t

and (rebuild_closure :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____5115  ->
               let uu____5116 = FStar_Syntax_Print.tag_of_term t  in
               let uu____5117 = env_to_string env  in
               let uu____5118 = stack_to_string stack  in
               let uu____5119 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print4
                 "\n>>> %s (env=%s, stack=%s) Rebuild closure_as_term %s\n"
                 uu____5116 uu____5117 uu____5118 uu____5119);
          (match stack with
           | [] -> t
           | (Arg (Clos (env_arg,tm,uu____5124,uu____5125),aq,r))::stack1 ->
               let stack2 = (App (env, t, aq, r)) :: stack1  in
               inline_closure_env cfg env_arg stack2 tm
           | (App (env1,head1,aq,r))::stack1 ->
               let t1 =
                 FStar_Syntax_Syntax.extend_app head1 (t, aq)
                   FStar_Pervasives_Native.None r
                  in
               rebuild_closure cfg env1 stack1 t1
           | (Abs (env',bs,env'',lopt,r))::stack1 ->
               let uu____5202 = close_binders cfg env' bs  in
               (match uu____5202 with
                | (bs1,uu____5216) ->
                    let lopt1 = close_lcomp_opt cfg env'' lopt  in
                    let uu____5232 =
                      let uu___158_5235 = FStar_Syntax_Util.abs bs1 t lopt1
                         in
                      {
                        FStar_Syntax_Syntax.n =
                          (uu___158_5235.FStar_Syntax_Syntax.n);
                        FStar_Syntax_Syntax.pos = r;
                        FStar_Syntax_Syntax.vars =
                          (uu___158_5235.FStar_Syntax_Syntax.vars)
                      }  in
                    rebuild_closure cfg env stack1 uu____5232)
           | (Match (env1,branches,cfg1,r))::stack1 ->
               let close_one_branch env2 uu____5291 =
                 match uu____5291 with
                 | (pat,w_opt,tm) ->
                     let rec norm_pat env3 p =
                       match p.FStar_Syntax_Syntax.v with
                       | FStar_Syntax_Syntax.Pat_constant uu____5406 ->
                           (p, env3)
                       | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                           let uu____5435 =
                             FStar_All.pipe_right pats
                               (FStar_List.fold_left
                                  (fun uu____5519  ->
                                     fun uu____5520  ->
                                       match (uu____5519, uu____5520) with
                                       | ((pats1,env4),(p1,b)) ->
                                           let uu____5659 = norm_pat env4 p1
                                              in
                                           (match uu____5659 with
                                            | (p2,env5) ->
                                                (((p2, b) :: pats1), env5)))
                                  ([], env3))
                              in
                           (match uu____5435 with
                            | (pats1,env4) ->
                                ((let uu___159_5821 = p  in
                                  {
                                    FStar_Syntax_Syntax.v =
                                      (FStar_Syntax_Syntax.Pat_cons
                                         (fv, (FStar_List.rev pats1)));
                                    FStar_Syntax_Syntax.p =
                                      (uu___159_5821.FStar_Syntax_Syntax.p)
                                  }), env4))
                       | FStar_Syntax_Syntax.Pat_var x ->
                           let x1 =
                             let uu___160_5840 = x  in
                             let uu____5841 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___160_5840.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___160_5840.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5841
                             }  in
                           ((let uu___161_5855 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_var x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___161_5855.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_wild x ->
                           let x1 =
                             let uu___162_5866 = x  in
                             let uu____5867 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___162_5866.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___162_5866.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5867
                             }  in
                           ((let uu___163_5881 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_wild x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___163_5881.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_dot_term (x,t1) ->
                           let x1 =
                             let uu___164_5897 = x  in
                             let uu____5898 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___164_5897.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___164_5897.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____5898
                             }  in
                           let t2 = non_tail_inline_closure_env cfg1 env3 t1
                              in
                           ((let uu___165_5915 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_dot_term (x1, t2));
                               FStar_Syntax_Syntax.p =
                                 (uu___165_5915.FStar_Syntax_Syntax.p)
                             }), env3)
                        in
                     let uu____5920 = norm_pat env2 pat  in
                     (match uu____5920 with
                      | (pat1,env3) ->
                          let w_opt1 =
                            match w_opt with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Pervasives_Native.None
                            | FStar_Pervasives_Native.Some w ->
                                let uu____5989 =
                                  non_tail_inline_closure_env cfg1 env3 w  in
                                FStar_Pervasives_Native.Some uu____5989
                             in
                          let tm1 = non_tail_inline_closure_env cfg1 env3 tm
                             in
                          (pat1, w_opt1, tm1))
                  in
               let t1 =
                 let uu____6008 =
                   let uu____6009 =
                     let uu____6032 =
                       FStar_All.pipe_right branches
                         (FStar_List.map (close_one_branch env1))
                        in
                     (t, uu____6032)  in
                   FStar_Syntax_Syntax.Tm_match uu____6009  in
                 mk uu____6008 t.FStar_Syntax_Syntax.pos  in
               rebuild_closure cfg1 env1 stack1 t1
           | (Meta (env_m,m,r))::stack1 ->
               let m1 =
                 match m with
                 | FStar_Syntax_Syntax.Meta_pattern args ->
                     let uu____6145 =
                       FStar_All.pipe_right args
                         (FStar_List.map
                            (fun args1  ->
                               FStar_All.pipe_right args1
                                 (FStar_List.map
                                    (fun uu____6234  ->
                                       match uu____6234 with
                                       | (a,q) ->
                                           let uu____6253 =
                                             non_tail_inline_closure_env cfg
                                               env_m a
                                              in
                                           (uu____6253, q)))))
                        in
                     FStar_Syntax_Syntax.Meta_pattern uu____6145
                 | FStar_Syntax_Syntax.Meta_monadic (m1,tbody) ->
                     let uu____6264 =
                       let uu____6271 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, uu____6271)  in
                     FStar_Syntax_Syntax.Meta_monadic uu____6264
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,tbody) ->
                     let uu____6283 =
                       let uu____6292 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, m2, uu____6292)  in
                     FStar_Syntax_Syntax.Meta_monadic_lift uu____6283
                 | uu____6297 -> m  in
               let t1 = mk (FStar_Syntax_Syntax.Tm_meta (t, m1)) r  in
               rebuild_closure cfg env stack1 t1
           | uu____6303 -> failwith "Impossible: unexpected stack element")

and (close_binders :
  cfg ->
    env ->
      (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
           FStar_Pervasives_Native.tuple2 Prims.list,env)
          FStar_Pervasives_Native.tuple2)
  =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____6317 =
          FStar_All.pipe_right bs
            (FStar_List.fold_left
               (fun uu____6390  ->
                  fun uu____6391  ->
                    match (uu____6390, uu____6391) with
                    | ((env1,out),(b,imp)) ->
                        let b1 =
                          let uu___166_6509 = b  in
                          let uu____6510 =
                            inline_closure_env cfg env1 []
                              b.FStar_Syntax_Syntax.sort
                             in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___166_6509.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___166_6509.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = uu____6510
                          }  in
                        let env2 = dummy :: env1  in
                        (env2, ((b1, imp) :: out))) (env, []))
           in
        match uu____6317 with | (env1,bs1) -> ((FStar_List.rev bs1), env1)

and (close_comp :
  cfg ->
    env ->
      FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun c  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation (cfg.steps).compress_uvars
            -> c
        | uu____6627 ->
            (match c.FStar_Syntax_Syntax.n with
             | FStar_Syntax_Syntax.Total (t,uopt) ->
                 let uu____6640 = inline_closure_env cfg env [] t  in
                 let uu____6641 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_Total' uu____6640 uu____6641
             | FStar_Syntax_Syntax.GTotal (t,uopt) ->
                 let uu____6654 = inline_closure_env cfg env [] t  in
                 let uu____6655 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_GTotal' uu____6654 uu____6655
             | FStar_Syntax_Syntax.Comp c1 ->
                 let rt =
                   inline_closure_env cfg env []
                     c1.FStar_Syntax_Syntax.result_typ
                    in
                 let args =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.effect_args
                     (FStar_List.map
                        (fun uu____6699  ->
                           match uu____6699 with
                           | (a,q) ->
                               let uu____6712 =
                                 inline_closure_env cfg env [] a  in
                               (uu____6712, q)))
                    in
                 let flags1 =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
                     (FStar_List.map
                        (fun uu___108_6727  ->
                           match uu___108_6727 with
                           | FStar_Syntax_Syntax.DECREASES t ->
                               let uu____6731 =
                                 inline_closure_env cfg env [] t  in
                               FStar_Syntax_Syntax.DECREASES uu____6731
                           | f -> f))
                    in
                 let uu____6735 =
                   let uu___167_6736 = c1  in
                   let uu____6737 =
                     FStar_List.map (norm_universe cfg env)
                       c1.FStar_Syntax_Syntax.comp_univs
                      in
                   {
                     FStar_Syntax_Syntax.comp_univs = uu____6737;
                     FStar_Syntax_Syntax.effect_name =
                       (uu___167_6736.FStar_Syntax_Syntax.effect_name);
                     FStar_Syntax_Syntax.result_typ = rt;
                     FStar_Syntax_Syntax.effect_args = args;
                     FStar_Syntax_Syntax.flags = flags1
                   }  in
                 FStar_Syntax_Syntax.mk_Comp uu____6735)

and (filter_out_lcomp_cflags :
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list)
  =
  fun flags1  ->
    FStar_All.pipe_right flags1
      (FStar_List.filter
         (fun uu___109_6747  ->
            match uu___109_6747 with
            | FStar_Syntax_Syntax.DECREASES uu____6748 -> false
            | uu____6751 -> true))

and (close_lcomp_opt :
  cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags1 =
              FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                (FStar_List.filter
                   (fun uu___110_6769  ->
                      match uu___110_6769 with
                      | FStar_Syntax_Syntax.DECREASES uu____6770 -> false
                      | uu____6773 -> true))
               in
            let rc1 =
              let uu___168_6775 = rc  in
              let uu____6776 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (inline_closure_env cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___168_6775.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____6776;
                FStar_Syntax_Syntax.residual_flags = flags1
              }  in
            FStar_Pervasives_Native.Some rc1
        | uu____6785 -> lopt

let (closure_as_term :
  cfg -> env -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun cfg  -> fun env  -> fun t  -> non_tail_inline_closure_env cfg env t 
let (built_in_primitive_steps : primitive_step FStar_Util.psmap) =
  let arg_as_int a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_int)
     in
  let arg_as_bool a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_bool)
     in
  let arg_as_char a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_char)
     in
  let arg_as_string a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_string)
     in
  let arg_as_list e a =
    let uu____6890 =
      let uu____6899 = FStar_Syntax_Embeddings.e_list e  in
      FStar_Syntax_Embeddings.try_unembed uu____6899  in
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a) uu____6890  in
  let arg_as_bounded_int uu____6925 =
    match uu____6925 with
    | (a,uu____6937) ->
        let uu____6944 =
          let uu____6945 = FStar_Syntax_Subst.compress a  in
          uu____6945.FStar_Syntax_Syntax.n  in
        (match uu____6944 with
         | FStar_Syntax_Syntax.Tm_app
             ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv1;
                FStar_Syntax_Syntax.pos = uu____6955;
                FStar_Syntax_Syntax.vars = uu____6956;_},({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_constant
                                                              (FStar_Const.Const_int
                                                              (i,FStar_Pervasives_Native.None
                                                               ));
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____6958;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____6959;_},uu____6960)::[])
             when
             let uu____6999 =
               FStar_Ident.text_of_lid
                 (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                in
             FStar_Util.ends_with uu____6999 "int_to_t" ->
             let uu____7000 =
               let uu____7005 = FStar_BigInt.big_int_of_string i  in
               (fv1, uu____7005)  in
             FStar_Pervasives_Native.Some uu____7000
         | uu____7010 -> FStar_Pervasives_Native.None)
     in
  let lift_unary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a)::[] ->
        let uu____7058 = f a  in FStar_Pervasives_Native.Some uu____7058
    | uu____7059 -> FStar_Pervasives_Native.None  in
  let lift_binary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a0)::(FStar_Pervasives_Native.Some
        a1)::[] ->
        let uu____7115 = f a0 a1  in FStar_Pervasives_Native.Some uu____7115
    | uu____7116 -> FStar_Pervasives_Native.None  in
  let unary_op as_a f res args =
    let uu____7174 = FStar_List.map as_a args  in
    lift_unary (f res.psc_range) uu____7174  in
  let binary_op as_a f res args =
    let uu____7245 = FStar_List.map as_a args  in
    lift_binary (f res.psc_range) uu____7245  in
  let as_primitive_step is_strong uu____7282 =
    match uu____7282 with
    | (l,arity,f) ->
        {
          name = l;
          arity;
          auto_reflect = FStar_Pervasives_Native.None;
          strong_reduction_ok = is_strong;
          requires_binder_substitution = false;
          interpretation = f
        }
     in
  let unary_int_op f =
    unary_op arg_as_int
      (fun r  ->
         fun x  ->
           let uu____7342 = f x  in
           FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r
             uu____7342)
     in
  let binary_int_op f =
    binary_op arg_as_int
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7378 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r
               uu____7378)
     in
  let unary_bool_op f =
    unary_op arg_as_bool
      (fun r  ->
         fun x  ->
           let uu____7407 = f x  in
           FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_bool r
             uu____7407)
     in
  let binary_bool_op f =
    binary_op arg_as_bool
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7443 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_bool r
               uu____7443)
     in
  let binary_string_op f =
    binary_op arg_as_string
      (fun r  ->
         fun x  ->
           fun y  ->
             let uu____7479 = f x y  in
             FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string r
               uu____7479)
     in
  let mixed_binary_op as_a as_b embed_c f res args =
    match args with
    | a::b::[] ->
        let uu____7611 =
          let uu____7620 = as_a a  in
          let uu____7623 = as_b b  in (uu____7620, uu____7623)  in
        (match uu____7611 with
         | (FStar_Pervasives_Native.Some a1,FStar_Pervasives_Native.Some b1)
             ->
             let uu____7638 =
               let uu____7639 = f res.psc_range a1 b1  in
               embed_c res.psc_range uu____7639  in
             FStar_Pervasives_Native.Some uu____7638
         | uu____7640 -> FStar_Pervasives_Native.None)
    | uu____7649 -> FStar_Pervasives_Native.None  in
  let list_of_string' rng s =
    let name l =
      let uu____7669 =
        let uu____7670 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            FStar_Pervasives_Native.None
           in
        FStar_Syntax_Syntax.Tm_fvar uu____7670  in
      mk uu____7669 rng  in
    let char_t = name FStar_Parser_Const.char_lid  in
    let charterm c =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c)) rng  in
    let uu____7682 =
      let uu____7685 = FStar_String.list_of_string s  in
      FStar_List.map charterm uu____7685  in
    FStar_All.pipe_left (FStar_Syntax_Util.mk_list char_t rng) uu____7682  in
  let string_of_list' rng l =
    let s = FStar_String.string_of_list l  in FStar_Syntax_Util.exp_string s
     in
  let string_compare' rng s1 s2 =
    let r = FStar_String.compare s1 s2  in
    let uu____7727 =
      let uu____7728 = FStar_Util.string_of_int r  in
      FStar_BigInt.big_int_of_string uu____7728  in
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int rng
      uu____7727
     in
  let string_concat' psc args =
    match args with
    | a1::a2::[] ->
        let uu____7792 = arg_as_string a1  in
        (match uu____7792 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____7798 = arg_as_list FStar_Syntax_Embeddings.e_string a2
                in
             (match uu____7798 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.concat s1 s2  in
                  let uu____7811 =
                    FStar_Syntax_Embeddings.embed
                      FStar_Syntax_Embeddings.e_string psc.psc_range r
                     in
                  FStar_Pervasives_Native.Some uu____7811
              | uu____7812 -> FStar_Pervasives_Native.None)
         | uu____7817 -> FStar_Pervasives_Native.None)
    | uu____7820 -> FStar_Pervasives_Native.None  in
  let string_of_int1 rng i =
    let uu____7840 = FStar_BigInt.string_of_big_int i  in
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string rng
      uu____7840
     in
  let string_of_bool1 rng b =
    FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_string rng
      (if b then "true" else "false")
     in
  let mk_range1 psc args =
    match args with
    | fn::from_line::from_col::to_line::to_col::[] ->
        let uu____7877 =
          let uu____7898 = arg_as_string fn  in
          let uu____7901 = arg_as_int from_line  in
          let uu____7904 = arg_as_int from_col  in
          let uu____7907 = arg_as_int to_line  in
          let uu____7910 = arg_as_int to_col  in
          (uu____7898, uu____7901, uu____7904, uu____7907, uu____7910)  in
        (match uu____7877 with
         | (FStar_Pervasives_Native.Some fn1,FStar_Pervasives_Native.Some
            from_l,FStar_Pervasives_Native.Some
            from_c,FStar_Pervasives_Native.Some
            to_l,FStar_Pervasives_Native.Some to_c) ->
             let r =
               let uu____7941 =
                 let uu____7942 = FStar_BigInt.to_int_fs from_l  in
                 let uu____7943 = FStar_BigInt.to_int_fs from_c  in
                 FStar_Range.mk_pos uu____7942 uu____7943  in
               let uu____7944 =
                 let uu____7945 = FStar_BigInt.to_int_fs to_l  in
                 let uu____7946 = FStar_BigInt.to_int_fs to_c  in
                 FStar_Range.mk_pos uu____7945 uu____7946  in
               FStar_Range.mk_range fn1 uu____7941 uu____7944  in
             let uu____7947 =
               FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_range
                 psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____7947
         | uu____7948 -> FStar_Pervasives_Native.None)
    | uu____7969 -> FStar_Pervasives_Native.None  in
  let decidable_eq neg psc args =
    let r = psc.psc_range  in
    let tru =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true)) r
       in
    let fal =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false)) r
       in
    match args with
    | (_typ,uu____8002)::(a1,uu____8004)::(a2,uu____8006)::[] ->
        let uu____8043 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____8043 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some (if neg then fal else tru)
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some (if neg then tru else fal)
         | uu____8048 -> FStar_Pervasives_Native.None)
    | uu____8049 -> failwith "Unexpected number of arguments"  in
  let prims_to_fstar_range_step psc args =
    match args with
    | (a1,uu____8080)::[] ->
        let uu____8089 =
          FStar_Syntax_Embeddings.try_unembed FStar_Syntax_Embeddings.e_range
            a1
           in
        (match uu____8089 with
         | FStar_Pervasives_Native.Some r ->
             let uu____8095 =
               FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_range
                 psc.psc_range r
                in
             FStar_Pervasives_Native.Some uu____8095
         | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None)
    | uu____8096 -> failwith "Unexpected number of arguments"  in
  let basic_ops =
    let uu____8122 =
      let uu____8139 =
        let uu____8156 =
          let uu____8173 =
            let uu____8190 =
              let uu____8207 =
                let uu____8224 =
                  let uu____8241 =
                    let uu____8258 =
                      let uu____8275 =
                        let uu____8292 =
                          let uu____8309 =
                            let uu____8326 =
                              let uu____8343 =
                                let uu____8360 =
                                  let uu____8377 =
                                    let uu____8394 =
                                      let uu____8411 =
                                        let uu____8428 =
                                          let uu____8445 =
                                            let uu____8462 =
                                              let uu____8479 =
                                                let uu____8494 =
                                                  FStar_Parser_Const.p2l
                                                    ["FStar";
                                                    "String";
                                                    "list_of_string"]
                                                   in
                                                (uu____8494,
                                                  (Prims.parse_int "1"),
                                                  (unary_op arg_as_string
                                                     list_of_string'))
                                                 in
                                              let uu____8503 =
                                                let uu____8520 =
                                                  let uu____8535 =
                                                    FStar_Parser_Const.p2l
                                                      ["FStar";
                                                      "String";
                                                      "string_of_list"]
                                                     in
                                                  (uu____8535,
                                                    (Prims.parse_int "1"),
                                                    (unary_op
                                                       (arg_as_list
                                                          FStar_Syntax_Embeddings.e_char)
                                                       string_of_list'))
                                                   in
                                                let uu____8548 =
                                                  let uu____8565 =
                                                    let uu____8580 =
                                                      FStar_Parser_Const.p2l
                                                        ["FStar";
                                                        "String";
                                                        "concat"]
                                                       in
                                                    (uu____8580,
                                                      (Prims.parse_int "2"),
                                                      string_concat')
                                                     in
                                                  let uu____8589 =
                                                    let uu____8606 =
                                                      let uu____8621 =
                                                        FStar_Parser_Const.p2l
                                                          ["Prims";
                                                          "mk_range"]
                                                         in
                                                      (uu____8621,
                                                        (Prims.parse_int "5"),
                                                        mk_range1)
                                                       in
                                                    [uu____8606]  in
                                                  uu____8565 :: uu____8589
                                                   in
                                                uu____8520 :: uu____8548  in
                                              uu____8479 :: uu____8503  in
                                            (FStar_Parser_Const.op_notEq,
                                              (Prims.parse_int "3"),
                                              (decidable_eq true)) ::
                                              uu____8462
                                             in
                                          (FStar_Parser_Const.op_Eq,
                                            (Prims.parse_int "3"),
                                            (decidable_eq false)) ::
                                            uu____8445
                                           in
                                        (FStar_Parser_Const.string_compare,
                                          (Prims.parse_int "2"),
                                          (binary_op arg_as_string
                                             string_compare'))
                                          :: uu____8428
                                         in
                                      (FStar_Parser_Const.string_of_bool_lid,
                                        (Prims.parse_int "1"),
                                        (unary_op arg_as_bool string_of_bool1))
                                        :: uu____8411
                                       in
                                    (FStar_Parser_Const.string_of_int_lid,
                                      (Prims.parse_int "1"),
                                      (unary_op arg_as_int string_of_int1))
                                      :: uu____8394
                                     in
                                  (FStar_Parser_Const.str_make_lid,
                                    (Prims.parse_int "2"),
                                    (mixed_binary_op arg_as_int arg_as_char
                                       (FStar_Syntax_Embeddings.embed
                                          FStar_Syntax_Embeddings.e_string)
                                       (fun r  ->
                                          fun x  ->
                                            fun y  ->
                                              let uu____8841 =
                                                FStar_BigInt.to_int_fs x  in
                                              FStar_String.make uu____8841 y)))
                                    :: uu____8377
                                   in
                                (FStar_Parser_Const.strcat_lid',
                                  (Prims.parse_int "2"),
                                  (binary_string_op
                                     (fun x  -> fun y  -> Prims.strcat x y)))
                                  :: uu____8360
                                 in
                              (FStar_Parser_Const.strcat_lid,
                                (Prims.parse_int "2"),
                                (binary_string_op
                                   (fun x  -> fun y  -> Prims.strcat x y)))
                                :: uu____8343
                               in
                            (FStar_Parser_Const.op_Or, (Prims.parse_int "2"),
                              (binary_bool_op (fun x  -> fun y  -> x || y)))
                              :: uu____8326
                             in
                          (FStar_Parser_Const.op_And, (Prims.parse_int "2"),
                            (binary_bool_op (fun x  -> fun y  -> x && y))) ::
                            uu____8309
                           in
                        (FStar_Parser_Const.op_Negation,
                          (Prims.parse_int "1"),
                          (unary_bool_op (fun x  -> Prims.op_Negation x))) ::
                          uu____8292
                         in
                      (FStar_Parser_Const.op_Modulus, (Prims.parse_int "2"),
                        (binary_int_op
                           (fun x  -> fun y  -> FStar_BigInt.mod_big_int x y)))
                        :: uu____8275
                       in
                    (FStar_Parser_Const.op_GTE, (Prims.parse_int "2"),
                      (binary_op arg_as_int
                         (fun r  ->
                            fun x  ->
                              fun y  ->
                                let uu____9036 = FStar_BigInt.ge_big_int x y
                                   in
                                FStar_Syntax_Embeddings.embed
                                  FStar_Syntax_Embeddings.e_bool r uu____9036)))
                      :: uu____8258
                     in
                  (FStar_Parser_Const.op_GT, (Prims.parse_int "2"),
                    (binary_op arg_as_int
                       (fun r  ->
                          fun x  ->
                            fun y  ->
                              let uu____9066 = FStar_BigInt.gt_big_int x y
                                 in
                              FStar_Syntax_Embeddings.embed
                                FStar_Syntax_Embeddings.e_bool r uu____9066)))
                    :: uu____8241
                   in
                (FStar_Parser_Const.op_LTE, (Prims.parse_int "2"),
                  (binary_op arg_as_int
                     (fun r  ->
                        fun x  ->
                          fun y  ->
                            let uu____9096 = FStar_BigInt.le_big_int x y  in
                            FStar_Syntax_Embeddings.embed
                              FStar_Syntax_Embeddings.e_bool r uu____9096)))
                  :: uu____8224
                 in
              (FStar_Parser_Const.op_LT, (Prims.parse_int "2"),
                (binary_op arg_as_int
                   (fun r  ->
                      fun x  ->
                        fun y  ->
                          let uu____9126 = FStar_BigInt.lt_big_int x y  in
                          FStar_Syntax_Embeddings.embed
                            FStar_Syntax_Embeddings.e_bool r uu____9126)))
                :: uu____8207
               in
            (FStar_Parser_Const.op_Division, (Prims.parse_int "2"),
              (binary_int_op
                 (fun x  -> fun y  -> FStar_BigInt.div_big_int x y)))
              :: uu____8190
             in
          (FStar_Parser_Const.op_Multiply, (Prims.parse_int "2"),
            (binary_int_op
               (fun x  -> fun y  -> FStar_BigInt.mult_big_int x y)))
            :: uu____8173
           in
        (FStar_Parser_Const.op_Subtraction, (Prims.parse_int "2"),
          (binary_int_op (fun x  -> fun y  -> FStar_BigInt.sub_big_int x y)))
          :: uu____8156
         in
      (FStar_Parser_Const.op_Addition, (Prims.parse_int "2"),
        (binary_int_op (fun x  -> fun y  -> FStar_BigInt.add_big_int x y)))
        :: uu____8139
       in
    (FStar_Parser_Const.op_Minus, (Prims.parse_int "1"),
      (unary_int_op (fun x  -> FStar_BigInt.minus_big_int x))) :: uu____8122
     in
  let weak_ops =
    let uu____9281 =
      let uu____9296 =
        FStar_Parser_Const.p2l ["FStar"; "Range"; "prims_to_fstar_range"]  in
      (uu____9296, (Prims.parse_int "1"), prims_to_fstar_range_step)  in
    [uu____9281]  in
  let bounded_arith_ops =
    let bounded_signed_int_types = ["Int8"; "Int16"; "Int32"; "Int64"]  in
    let bounded_unsigned_int_types =
      ["UInt8"; "UInt16"; "UInt32"; "UInt64"; "UInt128"]  in
    let int_as_bounded r int_to_t1 n1 =
      let c =
        FStar_Syntax_Embeddings.embed FStar_Syntax_Embeddings.e_int r n1  in
      let int_to_t2 = FStar_Syntax_Syntax.fv_to_tm int_to_t1  in
      let uu____9376 =
        let uu____9381 =
          let uu____9382 = FStar_Syntax_Syntax.as_arg c  in [uu____9382]  in
        FStar_Syntax_Syntax.mk_Tm_app int_to_t2 uu____9381  in
      uu____9376 FStar_Pervasives_Native.None r  in
    let add_sub_mul_v =
      FStar_All.pipe_right
        (FStar_List.append bounded_signed_int_types
           bounded_unsigned_int_types)
        (FStar_List.collect
           (fun m  ->
              let uu____9456 =
                let uu____9471 = FStar_Parser_Const.p2l ["FStar"; m; "add"]
                   in
                (uu____9471, (Prims.parse_int "2"),
                  (binary_op arg_as_bounded_int
                     (fun r  ->
                        fun uu____9493  ->
                          fun uu____9494  ->
                            match (uu____9493, uu____9494) with
                            | ((int_to_t1,x),(uu____9513,y)) ->
                                let uu____9523 = FStar_BigInt.add_big_int x y
                                   in
                                int_as_bounded r int_to_t1 uu____9523)))
                 in
              let uu____9524 =
                let uu____9541 =
                  let uu____9556 = FStar_Parser_Const.p2l ["FStar"; m; "sub"]
                     in
                  (uu____9556, (Prims.parse_int "2"),
                    (binary_op arg_as_bounded_int
                       (fun r  ->
                          fun uu____9578  ->
                            fun uu____9579  ->
                              match (uu____9578, uu____9579) with
                              | ((int_to_t1,x),(uu____9598,y)) ->
                                  let uu____9608 =
                                    FStar_BigInt.sub_big_int x y  in
                                  int_as_bounded r int_to_t1 uu____9608)))
                   in
                let uu____9609 =
                  let uu____9626 =
                    let uu____9641 =
                      FStar_Parser_Const.p2l ["FStar"; m; "mul"]  in
                    (uu____9641, (Prims.parse_int "2"),
                      (binary_op arg_as_bounded_int
                         (fun r  ->
                            fun uu____9663  ->
                              fun uu____9664  ->
                                match (uu____9663, uu____9664) with
                                | ((int_to_t1,x),(uu____9683,y)) ->
                                    let uu____9693 =
                                      FStar_BigInt.mult_big_int x y  in
                                    int_as_bounded r int_to_t1 uu____9693)))
                     in
                  let uu____9694 =
                    let uu____9711 =
                      let uu____9726 =
                        FStar_Parser_Const.p2l ["FStar"; m; "v"]  in
                      (uu____9726, (Prims.parse_int "1"),
                        (unary_op arg_as_bounded_int
                           (fun r  ->
                              fun uu____9744  ->
                                match uu____9744 with
                                | (int_to_t1,x) ->
                                    FStar_Syntax_Embeddings.embed
                                      FStar_Syntax_Embeddings.e_int r x)))
                       in
                    [uu____9711]  in
                  uu____9626 :: uu____9694  in
                uu____9541 :: uu____9609  in
              uu____9456 :: uu____9524))
       in
    let div_mod_unsigned =
      FStar_All.pipe_right bounded_unsigned_int_types
        (FStar_List.collect
           (fun m  ->
              let uu____9874 =
                let uu____9889 = FStar_Parser_Const.p2l ["FStar"; m; "div"]
                   in
                (uu____9889, (Prims.parse_int "2"),
                  (binary_op arg_as_bounded_int
                     (fun r  ->
                        fun uu____9911  ->
                          fun uu____9912  ->
                            match (uu____9911, uu____9912) with
                            | ((int_to_t1,x),(uu____9931,y)) ->
                                let uu____9941 = FStar_BigInt.div_big_int x y
                                   in
                                int_as_bounded r int_to_t1 uu____9941)))
                 in
              let uu____9942 =
                let uu____9959 =
                  let uu____9974 = FStar_Parser_Const.p2l ["FStar"; m; "rem"]
                     in
                  (uu____9974, (Prims.parse_int "2"),
                    (binary_op arg_as_bounded_int
                       (fun r  ->
                          fun uu____9996  ->
                            fun uu____9997  ->
                              match (uu____9996, uu____9997) with
                              | ((int_to_t1,x),(uu____10016,y)) ->
                                  let uu____10026 =
                                    FStar_BigInt.mod_big_int x y  in
                                  int_as_bounded r int_to_t1 uu____10026)))
                   in
                [uu____9959]  in
              uu____9874 :: uu____9942))
       in
    FStar_List.append add_sub_mul_v div_mod_unsigned  in
  let strong_steps =
    FStar_List.map (as_primitive_step true)
      (FStar_List.append basic_ops bounded_arith_ops)
     in
  let weak_steps = FStar_List.map (as_primitive_step false) weak_ops  in
  FStar_All.pipe_left prim_from_list
    (FStar_List.append strong_steps weak_steps)
  
let (equality_ops : primitive_step FStar_Util.psmap) =
  let interp_prop psc args =
    let r = psc.psc_range  in
    match args with
    | (_typ,uu____10156)::(a1,uu____10158)::(a2,uu____10160)::[] ->
        let uu____10197 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____10197 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___169_10201 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___169_10201.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___169_10201.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___170_10203 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___170_10203.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___170_10203.FStar_Syntax_Syntax.vars)
                })
         | uu____10204 -> FStar_Pervasives_Native.None)
    | (_typ,uu____10206)::uu____10207::(a1,uu____10209)::(a2,uu____10211)::[]
        ->
        let uu____10260 = FStar_Syntax_Util.eq_tm a1 a2  in
        (match uu____10260 with
         | FStar_Syntax_Util.Equal  ->
             FStar_Pervasives_Native.Some
               (let uu___169_10264 = FStar_Syntax_Util.t_true  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___169_10264.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___169_10264.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             FStar_Pervasives_Native.Some
               (let uu___170_10266 = FStar_Syntax_Util.t_false  in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___170_10266.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___170_10266.FStar_Syntax_Syntax.vars)
                })
         | uu____10267 -> FStar_Pervasives_Native.None)
    | uu____10268 -> failwith "Unexpected number of arguments"  in
  let propositional_equality =
    {
      name = FStar_Parser_Const.eq2_lid;
      arity = (Prims.parse_int "3");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop
    }  in
  let hetero_propositional_equality =
    {
      name = FStar_Parser_Const.eq3_lid;
      arity = (Prims.parse_int "4");
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop
    }  in
  prim_from_list [propositional_equality; hetero_propositional_equality] 
let (unembed_binder_knot :
  FStar_Syntax_Syntax.binder FStar_Syntax_Embeddings.embedding
    FStar_Pervasives_Native.option FStar_ST.ref)
  = FStar_Util.mk_ref FStar_Pervasives_Native.None 
let (unembed_binder :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option)
  =
  fun t  ->
    let uu____10322 = FStar_ST.op_Bang unembed_binder_knot  in
    match uu____10322 with
    | FStar_Pervasives_Native.Some e -> FStar_Syntax_Embeddings.unembed e t
    | FStar_Pervasives_Native.None  ->
        (FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos
           (FStar_Errors.Warning_UnembedBinderKnot,
             "unembed_binder_knot is unset!");
         FStar_Pervasives_Native.None)
  
let mk_psc_subst :
  'Auu____10374 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____10374) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        FStar_Syntax_Syntax.subst_elt Prims.list
  =
  fun cfg  ->
    fun env  ->
      FStar_List.fold_right
        (fun uu____10436  ->
           fun subst1  ->
             match uu____10436 with
             | (binder_opt,closure) ->
                 (match (binder_opt, closure) with
                  | (FStar_Pervasives_Native.Some b,Clos
                     (env1,term,uu____10477,uu____10478)) ->
                      let uu____10537 = b  in
                      (match uu____10537 with
                       | (bv,uu____10545) ->
                           let uu____10546 =
                             let uu____10547 =
                               FStar_Syntax_Util.is_constructed_typ
                                 bv.FStar_Syntax_Syntax.sort
                                 FStar_Parser_Const.binder_lid
                                in
                             Prims.op_Negation uu____10547  in
                           if uu____10546
                           then subst1
                           else
                             (let term1 = closure_as_term cfg env1 term  in
                              let uu____10552 = unembed_binder term1  in
                              match uu____10552 with
                              | FStar_Pervasives_Native.None  -> subst1
                              | FStar_Pervasives_Native.Some x ->
                                  let b1 =
                                    let uu____10559 =
                                      let uu___171_10560 = bv  in
                                      let uu____10561 =
                                        FStar_Syntax_Subst.subst subst1
                                          (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort
                                         in
                                      {
                                        FStar_Syntax_Syntax.ppname =
                                          (uu___171_10560.FStar_Syntax_Syntax.ppname);
                                        FStar_Syntax_Syntax.index =
                                          (uu___171_10560.FStar_Syntax_Syntax.index);
                                        FStar_Syntax_Syntax.sort =
                                          uu____10561
                                      }  in
                                    FStar_Syntax_Syntax.freshen_bv
                                      uu____10559
                                     in
                                  let b_for_x =
                                    let uu____10565 =
                                      let uu____10572 =
                                        FStar_Syntax_Syntax.bv_to_name b1  in
                                      ((FStar_Pervasives_Native.fst x),
                                        uu____10572)
                                       in
                                    FStar_Syntax_Syntax.NT uu____10565  in
                                  let subst2 =
                                    FStar_List.filter
                                      (fun uu___111_10586  ->
                                         match uu___111_10586 with
                                         | FStar_Syntax_Syntax.NT
                                             (uu____10587,{
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_name
                                                              b';
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____10589;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____10590;_})
                                             ->
                                             let uu____10595 =
                                               FStar_Ident.ident_equals
                                                 b1.FStar_Syntax_Syntax.ppname
                                                 b'.FStar_Syntax_Syntax.ppname
                                                in
                                             Prims.op_Negation uu____10595
                                         | uu____10596 -> true) subst1
                                     in
                                  b_for_x :: subst2))
                  | uu____10597 -> subst1)) env []
  
let reduce_primops :
  'Auu____10620 'Auu____10621 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____10620) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        'Auu____10621 ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          if Prims.op_Negation (cfg.steps).primops
          then tm
          else
            (let uu____10669 = FStar_Syntax_Util.head_and_args tm  in
             match uu____10669 with
             | (head1,args) ->
                 let uu____10708 =
                   let uu____10709 = FStar_Syntax_Util.un_uinst head1  in
                   uu____10709.FStar_Syntax_Syntax.n  in
                 (match uu____10708 with
                  | FStar_Syntax_Syntax.Tm_fvar fv ->
                      let uu____10715 = find_prim_step cfg fv  in
                      (match uu____10715 with
                       | FStar_Pervasives_Native.Some prim_step when
                           prim_step.strong_reduction_ok ||
                             (Prims.op_Negation cfg.strong)
                           ->
                           let l = FStar_List.length args  in
                           if l < prim_step.arity
                           then
                             (log_primops cfg
                                (fun uu____10741  ->
                                   let uu____10742 =
                                     FStar_Syntax_Print.lid_to_string
                                       prim_step.name
                                      in
                                   let uu____10743 =
                                     FStar_Util.string_of_int l  in
                                   let uu____10750 =
                                     FStar_Util.string_of_int prim_step.arity
                                      in
                                   FStar_Util.print3
                                     "primop: found partially applied %s (%s/%s args)\n"
                                     uu____10742 uu____10743 uu____10750);
                              tm)
                           else
                             (let uu____10752 =
                                if l = prim_step.arity
                                then (args, [])
                                else FStar_List.splitAt prim_step.arity args
                                 in
                              match uu____10752 with
                              | (args_1,args_2) ->
                                  (log_primops cfg
                                     (fun uu____10865  ->
                                        let uu____10866 =
                                          FStar_Syntax_Print.term_to_string
                                            tm
                                           in
                                        FStar_Util.print1
                                          "primop: trying to reduce <%s>\n"
                                          uu____10866);
                                   (let psc =
                                      {
                                        psc_range =
                                          (head1.FStar_Syntax_Syntax.pos);
                                        psc_subst =
                                          (fun uu____10869  ->
                                             if
                                               prim_step.requires_binder_substitution
                                             then mk_psc_subst cfg env
                                             else [])
                                      }  in
                                    let uu____10871 =
                                      prim_step.interpretation psc args_1  in
                                    match uu____10871 with
                                    | FStar_Pervasives_Native.None  ->
                                        (log_primops cfg
                                           (fun uu____10879  ->
                                              let uu____10880 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              FStar_Util.print1
                                                "primop: <%s> did not reduce\n"
                                                uu____10880);
                                         tm)
                                    | FStar_Pervasives_Native.Some reduced ->
                                        (log_primops cfg
                                           (fun uu____10886  ->
                                              let uu____10887 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              let uu____10888 =
                                                FStar_Syntax_Print.term_to_string
                                                  reduced
                                                 in
                                              FStar_Util.print2
                                                "primop: <%s> reduced to <%s>\n"
                                                uu____10887 uu____10888);
                                         FStar_Syntax_Util.mk_app reduced
                                           args_2))))
                       | FStar_Pervasives_Native.Some uu____10889 ->
                           (log_primops cfg
                              (fun uu____10893  ->
                                 let uu____10894 =
                                   FStar_Syntax_Print.term_to_string tm  in
                                 FStar_Util.print1
                                   "primop: not reducing <%s> since we're doing strong reduction\n"
                                   uu____10894);
                            tm)
                       | FStar_Pervasives_Native.None  -> tm)
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_range_of ) when
                      Prims.op_Negation cfg.strong ->
                      (log_primops cfg
                         (fun uu____10898  ->
                            let uu____10899 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____10899);
                       (match args with
                        | (a1,uu____10903)::[] ->
                            FStar_Syntax_Embeddings.embed
                              FStar_Syntax_Embeddings.e_range
                              tm.FStar_Syntax_Syntax.pos
                              a1.FStar_Syntax_Syntax.pos
                        | uu____10920 -> tm))
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_set_range_of ) when
                      Prims.op_Negation cfg.strong ->
                      (log_primops cfg
                         (fun uu____10932  ->
                            let uu____10933 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____10933);
                       (match args with
                        | (t,uu____10937)::(r,uu____10939)::[] ->
                            let uu____10966 =
                              FStar_Syntax_Embeddings.try_unembed
                                FStar_Syntax_Embeddings.e_range r
                               in
                            (match uu____10966 with
                             | FStar_Pervasives_Native.Some rng ->
                                 FStar_Syntax_Subst.set_use_range rng t
                             | FStar_Pervasives_Native.None  -> tm)
                        | uu____10972 -> tm))
                  | uu____10981 -> tm))
  
let reduce_equality :
  'Auu____10992 'Auu____10993 .
    cfg ->
      ((FStar_Syntax_Syntax.bv,'Auu____10992) FStar_Pervasives_Native.tuple2
         FStar_Pervasives_Native.option,closure)
        FStar_Pervasives_Native.tuple2 Prims.list ->
        'Auu____10993 ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun tm  ->
      reduce_primops
        (let uu___172_11039 = cfg  in
         {
           steps =
             (let uu___173_11042 = default_steps  in
              {
                beta = (uu___173_11042.beta);
                iota = (uu___173_11042.iota);
                zeta = (uu___173_11042.zeta);
                weak = (uu___173_11042.weak);
                hnf = (uu___173_11042.hnf);
                primops = true;
                do_not_unfold_pure_lets =
                  (uu___173_11042.do_not_unfold_pure_lets);
                unfold_until = (uu___173_11042.unfold_until);
                unfold_only = (uu___173_11042.unfold_only);
                unfold_fully = (uu___173_11042.unfold_fully);
                unfold_attr = (uu___173_11042.unfold_attr);
                unfold_tac = (uu___173_11042.unfold_tac);
                pure_subterms_within_computations =
                  (uu___173_11042.pure_subterms_within_computations);
                simplify = (uu___173_11042.simplify);
                erase_universes = (uu___173_11042.erase_universes);
                allow_unbound_universes =
                  (uu___173_11042.allow_unbound_universes);
                reify_ = (uu___173_11042.reify_);
                compress_uvars = (uu___173_11042.compress_uvars);
                no_full_norm = (uu___173_11042.no_full_norm);
                check_no_uvars = (uu___173_11042.check_no_uvars);
                unmeta = (uu___173_11042.unmeta);
                unascribe = (uu___173_11042.unascribe);
                in_full_norm_request = (uu___173_11042.in_full_norm_request);
                weakly_reduce_scrutinee =
                  (uu___173_11042.weakly_reduce_scrutinee)
              });
           tcenv = (uu___172_11039.tcenv);
           debug = (uu___172_11039.debug);
           delta_level = (uu___172_11039.delta_level);
           primitive_steps = equality_ops;
           strong = (uu___172_11039.strong);
           memoize_lazy = (uu___172_11039.memoize_lazy);
           normalize_pure_lets = (uu___172_11039.normalize_pure_lets)
         }) tm
  
let is_norm_request :
  'Auu____11049 .
    FStar_Syntax_Syntax.term -> 'Auu____11049 Prims.list -> Prims.bool
  =
  fun hd1  ->
    fun args  ->
      let uu____11064 =
        let uu____11071 =
          let uu____11072 = FStar_Syntax_Util.un_uinst hd1  in
          uu____11072.FStar_Syntax_Syntax.n  in
        (uu____11071, args)  in
      match uu____11064 with
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____11078::uu____11079::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize_term
      | (FStar_Syntax_Syntax.Tm_fvar fv,uu____11083::[]) ->
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize
      | (FStar_Syntax_Syntax.Tm_fvar fv,steps::uu____11088::uu____11089::[])
          -> FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.norm
      | uu____11092 -> false
  
let (tr_norm_step : FStar_Syntax_Embeddings.norm_step -> step Prims.list) =
  fun uu___112_11105  ->
    match uu___112_11105 with
    | FStar_Syntax_Embeddings.Zeta  -> [Zeta]
    | FStar_Syntax_Embeddings.Iota  -> [Iota]
    | FStar_Syntax_Embeddings.Delta  ->
        [UnfoldUntil FStar_Syntax_Syntax.delta_constant]
    | FStar_Syntax_Embeddings.Simpl  -> [Simplify]
    | FStar_Syntax_Embeddings.Weak  -> [Weak]
    | FStar_Syntax_Embeddings.HNF  -> [HNF]
    | FStar_Syntax_Embeddings.Primops  -> [Primops]
    | FStar_Syntax_Embeddings.UnfoldOnly names1 ->
        let uu____11111 =
          let uu____11114 =
            let uu____11115 = FStar_List.map FStar_Ident.lid_of_str names1
               in
            UnfoldOnly uu____11115  in
          [uu____11114]  in
        (UnfoldUntil FStar_Syntax_Syntax.delta_constant) :: uu____11111
    | FStar_Syntax_Embeddings.UnfoldFully names1 ->
        let uu____11121 =
          let uu____11124 =
            let uu____11125 = FStar_List.map FStar_Ident.lid_of_str names1
               in
            UnfoldFully uu____11125  in
          [uu____11124]  in
        (UnfoldUntil FStar_Syntax_Syntax.delta_constant) :: uu____11121
    | FStar_Syntax_Embeddings.UnfoldAttr t ->
        [UnfoldUntil FStar_Syntax_Syntax.delta_constant; UnfoldAttr t]
  
let (tr_norm_steps :
  FStar_Syntax_Embeddings.norm_step Prims.list -> step Prims.list) =
  fun s  -> FStar_List.concatMap tr_norm_step s 
let get_norm_request :
  'Auu____11148 .
    cfg ->
      (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
        (FStar_Syntax_Syntax.term,'Auu____11148)
          FStar_Pervasives_Native.tuple2 Prims.list ->
          (step Prims.list,FStar_Syntax_Syntax.term)
            FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun cfg  ->
    fun full_norm  ->
      fun args  ->
        let parse_steps s =
          let uu____11199 =
            let uu____11204 =
              FStar_Syntax_Embeddings.e_list
                FStar_Syntax_Embeddings.e_norm_step
               in
            FStar_Syntax_Embeddings.try_unembed uu____11204 s  in
          match uu____11199 with
          | FStar_Pervasives_Native.Some steps ->
              let uu____11220 = tr_norm_steps steps  in
              FStar_Pervasives_Native.Some uu____11220
          | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None  in
        let inherited_steps =
          FStar_List.append
            (if (cfg.steps).erase_universes then [EraseUniverses] else [])
            (if (cfg.steps).allow_unbound_universes
             then [AllowUnboundUniverses]
             else [])
           in
        match args with
        | uu____11246::(tm,uu____11248)::[] ->
            let s =
              [Beta;
              Zeta;
              Iota;
              Primops;
              UnfoldUntil FStar_Syntax_Syntax.delta_constant;
              Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (tm,uu____11277)::[] ->
            let s =
              [Beta;
              Zeta;
              Iota;
              Primops;
              UnfoldUntil FStar_Syntax_Syntax.delta_constant;
              Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (steps,uu____11298)::uu____11299::(tm,uu____11301)::[] ->
            let add_exclude s z =
              if FStar_List.contains z s then s else (Exclude z) :: s  in
            let uu____11342 =
              let uu____11347 = full_norm steps  in parse_steps uu____11347
               in
            (match uu____11342 with
             | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
             | FStar_Pervasives_Native.Some s ->
                 let s1 = Beta :: s  in
                 let s2 = add_exclude s1 Zeta  in
                 let s3 = add_exclude s2 Iota  in
                 FStar_Pervasives_Native.Some
                   ((FStar_List.append inherited_steps s3), tm))
        | uu____11386 -> FStar_Pervasives_Native.None
  
let (is_reify_head : stack_elt Prims.list -> Prims.bool) =
  fun uu___113_11405  ->
    match uu___113_11405 with
    | (App
        (uu____11408,{
                       FStar_Syntax_Syntax.n =
                         FStar_Syntax_Syntax.Tm_constant
                         (FStar_Const.Const_reify );
                       FStar_Syntax_Syntax.pos = uu____11409;
                       FStar_Syntax_Syntax.vars = uu____11410;_},uu____11411,uu____11412))::uu____11413
        -> true
    | uu____11418 -> false
  
let firstn :
  'Auu____11427 .
    Prims.int ->
      'Auu____11427 Prims.list ->
        ('Auu____11427 Prims.list,'Auu____11427 Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun k  ->
    fun l  ->
      if (FStar_List.length l) < k then (l, []) else FStar_Util.first_N k l
  
let (should_reify : cfg -> stack_elt Prims.list -> Prims.bool) =
  fun cfg  ->
    fun stack  ->
      match stack with
      | (App
          (uu____11469,{
                         FStar_Syntax_Syntax.n =
                           FStar_Syntax_Syntax.Tm_constant
                           (FStar_Const.Const_reify );
                         FStar_Syntax_Syntax.pos = uu____11470;
                         FStar_Syntax_Syntax.vars = uu____11471;_},uu____11472,uu____11473))::uu____11474
          -> (cfg.steps).reify_
      | uu____11479 -> false
  
let rec (maybe_weakly_reduced :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax -> Prims.bool) =
  fun tm  ->
    let aux_comp c =
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.GTotal (t,uu____11502) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Total (t,uu____11512) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Comp ct ->
          (maybe_weakly_reduced ct.FStar_Syntax_Syntax.result_typ) ||
            (FStar_Util.for_some
               (fun uu____11531  ->
                  match uu____11531 with
                  | (a,uu____11539) -> maybe_weakly_reduced a)
               ct.FStar_Syntax_Syntax.effect_args)
       in
    let t = FStar_Syntax_Subst.compress tm  in
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____11545 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_name uu____11570 -> false
    | FStar_Syntax_Syntax.Tm_uvar uu____11571 -> false
    | FStar_Syntax_Syntax.Tm_type uu____11586 -> false
    | FStar_Syntax_Syntax.Tm_bvar uu____11587 -> false
    | FStar_Syntax_Syntax.Tm_fvar uu____11588 -> false
    | FStar_Syntax_Syntax.Tm_constant uu____11589 -> false
    | FStar_Syntax_Syntax.Tm_lazy uu____11590 -> false
    | FStar_Syntax_Syntax.Tm_unknown  -> false
    | FStar_Syntax_Syntax.Tm_uinst uu____11591 -> false
    | FStar_Syntax_Syntax.Tm_quoted uu____11598 -> false
    | FStar_Syntax_Syntax.Tm_let uu____11605 -> true
    | FStar_Syntax_Syntax.Tm_abs uu____11618 -> true
    | FStar_Syntax_Syntax.Tm_arrow uu____11635 -> true
    | FStar_Syntax_Syntax.Tm_refine uu____11648 -> true
    | FStar_Syntax_Syntax.Tm_match uu____11655 -> true
    | FStar_Syntax_Syntax.Tm_app (t1,args) ->
        (maybe_weakly_reduced t1) ||
          (FStar_All.pipe_right args
             (FStar_Util.for_some
                (fun uu____11717  ->
                   match uu____11717 with
                   | (a,uu____11725) -> maybe_weakly_reduced a)))
    | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,uu____11732) ->
        ((maybe_weakly_reduced t1) ||
           (match FStar_Pervasives_Native.fst asc with
            | FStar_Util.Inl t2 -> maybe_weakly_reduced t2
            | FStar_Util.Inr c2 -> aux_comp c2))
          ||
          ((match FStar_Pervasives_Native.snd asc with
            | FStar_Pervasives_Native.None  -> false
            | FStar_Pervasives_Native.Some tac -> maybe_weakly_reduced tac))
    | FStar_Syntax_Syntax.Tm_meta (t1,m) ->
        (maybe_weakly_reduced t1) ||
          ((match m with
            | FStar_Syntax_Syntax.Meta_pattern args ->
                FStar_Util.for_some
                  (FStar_Util.for_some
                     (fun uu____11854  ->
                        match uu____11854 with
                        | (a,uu____11862) -> maybe_weakly_reduced a)) args
            | FStar_Syntax_Syntax.Meta_monadic_lift
                (uu____11867,uu____11868,t') -> maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_monadic (uu____11874,t') ->
                maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_labeled uu____11880 -> false
            | FStar_Syntax_Syntax.Meta_desugared uu____11887 -> false
            | FStar_Syntax_Syntax.Meta_named uu____11888 -> false))
  
let rec (norm :
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          let t1 =
            if (cfg.debug).norm_delayed
            then
              (match t.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_delayed uu____12180 ->
                   let uu____12205 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "NORM delayed: %s\n" uu____12205
               | uu____12206 -> ())
            else ();
            FStar_Syntax_Subst.compress t  in
          log cfg
            (fun uu____12214  ->
               let uu____12215 = FStar_Syntax_Print.tag_of_term t1  in
               let uu____12216 = FStar_Syntax_Print.term_to_string t1  in
               let uu____12217 =
                 FStar_Util.string_of_int (FStar_List.length env)  in
               let uu____12224 =
                 let uu____12225 =
                   let uu____12228 = firstn (Prims.parse_int "4") stack  in
                   FStar_All.pipe_left FStar_Pervasives_Native.fst
                     uu____12228
                    in
                 stack_to_string uu____12225  in
               FStar_Util.print4
                 ">>> %s\nNorm %s with with %s env elements top of the stack %s \n"
                 uu____12215 uu____12216 uu____12217 uu____12224);
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_constant uu____12251 ->
               rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_name uu____12252 ->
               rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_lazy uu____12253 ->
               rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____12254;
                 FStar_Syntax_Syntax.fv_delta =
                   FStar_Syntax_Syntax.Delta_constant_at_level _0_17;
                 FStar_Syntax_Syntax.fv_qual = uu____12255;_}
               when _0_17 = (Prims.parse_int "0") -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____12258;
                 FStar_Syntax_Syntax.fv_delta = uu____12259;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Data_ctor );_}
               -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____12260;
                 FStar_Syntax_Syntax.fv_delta = uu____12261;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Record_ctor uu____12262);_}
               -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_quoted uu____12269 ->
               let uu____12276 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____12276
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               ((Prims.op_Negation (cfg.steps).no_full_norm) &&
                  (is_norm_request hd1 args))
                 &&
                 (let uu____12306 =
                    FStar_Ident.lid_equals
                      (cfg.tcenv).FStar_TypeChecker_Env.curmodule
                      FStar_Parser_Const.prims_lid
                     in
                  Prims.op_Negation uu____12306)
               ->
               let cfg' =
                 let uu___174_12308 = cfg  in
                 {
                   steps =
                     (let uu___175_12311 = cfg.steps  in
                      {
                        beta = (uu___175_12311.beta);
                        iota = (uu___175_12311.iota);
                        zeta = (uu___175_12311.zeta);
                        weak = (uu___175_12311.weak);
                        hnf = (uu___175_12311.hnf);
                        primops = (uu___175_12311.primops);
                        do_not_unfold_pure_lets = false;
                        unfold_until = (uu___175_12311.unfold_until);
                        unfold_only = FStar_Pervasives_Native.None;
                        unfold_fully = FStar_Pervasives_Native.None;
                        unfold_attr = (uu___175_12311.unfold_attr);
                        unfold_tac = (uu___175_12311.unfold_tac);
                        pure_subterms_within_computations =
                          (uu___175_12311.pure_subterms_within_computations);
                        simplify = (uu___175_12311.simplify);
                        erase_universes = (uu___175_12311.erase_universes);
                        allow_unbound_universes =
                          (uu___175_12311.allow_unbound_universes);
                        reify_ = (uu___175_12311.reify_);
                        compress_uvars = (uu___175_12311.compress_uvars);
                        no_full_norm = (uu___175_12311.no_full_norm);
                        check_no_uvars = (uu___175_12311.check_no_uvars);
                        unmeta = (uu___175_12311.unmeta);
                        unascribe = (uu___175_12311.unascribe);
                        in_full_norm_request =
                          (uu___175_12311.in_full_norm_request);
                        weakly_reduce_scrutinee =
                          (uu___175_12311.weakly_reduce_scrutinee)
                      });
                   tcenv = (uu___174_12308.tcenv);
                   debug = (uu___174_12308.debug);
                   delta_level =
                     [FStar_TypeChecker_Env.Unfold
                        FStar_Syntax_Syntax.delta_constant];
                   primitive_steps = (uu___174_12308.primitive_steps);
                   strong = (uu___174_12308.strong);
                   memoize_lazy = (uu___174_12308.memoize_lazy);
                   normalize_pure_lets = true
                 }  in
               let uu____12316 = get_norm_request cfg (norm cfg' env []) args
                  in
               (match uu____12316 with
                | FStar_Pervasives_Native.None  ->
                    let stack1 =
                      FStar_All.pipe_right stack
                        (FStar_List.fold_right
                           (fun uu____12345  ->
                              fun stack1  ->
                                match uu____12345 with
                                | (a,aq) ->
                                    let uu____12357 =
                                      let uu____12358 =
                                        let uu____12365 =
                                          let uu____12366 =
                                            let uu____12397 =
                                              FStar_Util.mk_ref
                                                FStar_Pervasives_Native.None
                                               in
                                            (env, a, uu____12397, false)  in
                                          Clos uu____12366  in
                                        (uu____12365, aq,
                                          (t1.FStar_Syntax_Syntax.pos))
                                         in
                                      Arg uu____12358  in
                                    uu____12357 :: stack1) args)
                       in
                    (log cfg
                       (fun uu____12485  ->
                          let uu____12486 =
                            FStar_All.pipe_left FStar_Util.string_of_int
                              (FStar_List.length args)
                             in
                          FStar_Util.print1 "\tPushed %s arguments\n"
                            uu____12486);
                     norm cfg env stack1 hd1)
                | FStar_Pervasives_Native.Some (s,tm) ->
                    let delta_level =
                      let uu____12508 =
                        FStar_All.pipe_right s
                          (FStar_Util.for_some
                             (fun uu___114_12513  ->
                                match uu___114_12513 with
                                | UnfoldUntil uu____12514 -> true
                                | UnfoldOnly uu____12515 -> true
                                | UnfoldFully uu____12518 -> true
                                | uu____12521 -> false))
                         in
                      if uu____12508
                      then
                        [FStar_TypeChecker_Env.Unfold
                           FStar_Syntax_Syntax.delta_constant]
                      else [FStar_TypeChecker_Env.NoDelta]  in
                    let cfg'1 =
                      let uu___176_12526 = cfg  in
                      let uu____12527 =
                        let uu___177_12528 = to_fsteps s  in
                        {
                          beta = (uu___177_12528.beta);
                          iota = (uu___177_12528.iota);
                          zeta = (uu___177_12528.zeta);
                          weak = (uu___177_12528.weak);
                          hnf = (uu___177_12528.hnf);
                          primops = (uu___177_12528.primops);
                          do_not_unfold_pure_lets =
                            (uu___177_12528.do_not_unfold_pure_lets);
                          unfold_until = (uu___177_12528.unfold_until);
                          unfold_only = (uu___177_12528.unfold_only);
                          unfold_fully = (uu___177_12528.unfold_fully);
                          unfold_attr = (uu___177_12528.unfold_attr);
                          unfold_tac = (uu___177_12528.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___177_12528.pure_subterms_within_computations);
                          simplify = (uu___177_12528.simplify);
                          erase_universes = (uu___177_12528.erase_universes);
                          allow_unbound_universes =
                            (uu___177_12528.allow_unbound_universes);
                          reify_ = (uu___177_12528.reify_);
                          compress_uvars = (uu___177_12528.compress_uvars);
                          no_full_norm = (uu___177_12528.no_full_norm);
                          check_no_uvars = (uu___177_12528.check_no_uvars);
                          unmeta = (uu___177_12528.unmeta);
                          unascribe = (uu___177_12528.unascribe);
                          in_full_norm_request = true;
                          weakly_reduce_scrutinee =
                            (uu___177_12528.weakly_reduce_scrutinee)
                        }  in
                      {
                        steps = uu____12527;
                        tcenv = (uu___176_12526.tcenv);
                        debug = (uu___176_12526.debug);
                        delta_level;
                        primitive_steps = (uu___176_12526.primitive_steps);
                        strong = (uu___176_12526.strong);
                        memoize_lazy = (uu___176_12526.memoize_lazy);
                        normalize_pure_lets = true
                      }  in
                    let stack' =
                      let tail1 = (Cfg cfg) :: stack  in
                      if (cfg.debug).print_normalized
                      then
                        let uu____12537 =
                          let uu____12538 =
                            let uu____12543 = FStar_Util.now ()  in
                            (t1, uu____12543)  in
                          Debug uu____12538  in
                        uu____12537 :: tail1
                      else tail1  in
                    norm cfg'1 env stack' tm)
           | FStar_Syntax_Syntax.Tm_type u ->
               let u1 = norm_universe cfg env u  in
               let uu____12547 =
                 mk (FStar_Syntax_Syntax.Tm_type u1)
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____12547
           | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
               if (cfg.steps).erase_universes
               then norm cfg env stack t'
               else
                 (let us1 =
                    let uu____12556 =
                      let uu____12563 =
                        FStar_List.map (norm_universe cfg env) us  in
                      (uu____12563, (t1.FStar_Syntax_Syntax.pos))  in
                    UnivArgs uu____12556  in
                  let stack1 = us1 :: stack  in norm cfg env stack1 t')
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               let qninfo =
                 let uu____12573 = FStar_Syntax_Syntax.lid_of_fv fv  in
                 FStar_TypeChecker_Env.lookup_qname cfg.tcenv uu____12573  in
               let uu____12574 =
                 FStar_TypeChecker_Env.qninfo_is_action qninfo  in
               if uu____12574
               then
                 let b = should_reify cfg stack  in
                 (log cfg
                    (fun uu____12580  ->
                       let uu____12581 = FStar_Syntax_Print.term_to_string t1
                          in
                       let uu____12582 = FStar_Util.string_of_bool b  in
                       FStar_Util.print2
                         ">>> For DM4F action %s, should_reify = %s\n"
                         uu____12581 uu____12582);
                  if b
                  then
                    (let uu____12583 = FStar_List.tl stack  in
                     do_unfold_fv cfg env uu____12583 t1 qninfo fv)
                  else rebuild cfg env stack t1)
               else
                 (let should_delta =
                    ((let uu____12591 = find_prim_step cfg fv  in
                      FStar_Option.isNone uu____12591) &&
                       (match qninfo with
                        | FStar_Pervasives_Native.Some
                            (FStar_Util.Inr
                             ({
                                FStar_Syntax_Syntax.sigel =
                                  FStar_Syntax_Syntax.Sig_let
                                  ((is_rec,uu____12604),uu____12605);
                                FStar_Syntax_Syntax.sigrng = uu____12606;
                                FStar_Syntax_Syntax.sigquals = qs;
                                FStar_Syntax_Syntax.sigmeta = uu____12608;
                                FStar_Syntax_Syntax.sigattrs = uu____12609;_},uu____12610),uu____12611)
                            ->
                            (Prims.op_Negation
                               (FStar_List.contains
                                  FStar_Syntax_Syntax.HasMaskedEffect qs))
                              &&
                              ((Prims.op_Negation is_rec) || (cfg.steps).zeta)
                        | uu____12670 -> true))
                      &&
                      (FStar_All.pipe_right cfg.delta_level
                         (FStar_Util.for_some
                            (fun uu___115_12674  ->
                               match uu___115_12674 with
                               | FStar_TypeChecker_Env.UnfoldTac  -> false
                               | FStar_TypeChecker_Env.NoDelta  -> false
                               | FStar_TypeChecker_Env.Inlining  -> true
                               | FStar_TypeChecker_Env.Eager_unfolding_only 
                                   -> true
                               | FStar_TypeChecker_Env.Unfold l ->
                                   FStar_TypeChecker_Common.delta_depth_greater_than
                                     fv.FStar_Syntax_Syntax.fv_delta l)))
                     in
                  let should_delta1 =
                    should_delta &&
                      (let attrs =
                         FStar_TypeChecker_Env.attrs_of_qninfo qninfo  in
                       (((Prims.op_Negation (cfg.steps).unfold_tac) ||
                           (let uu____12684 =
                              cases
                                (FStar_Util.for_some
                                   (FStar_Syntax_Util.attr_eq
                                      FStar_Syntax_Util.tac_opaque_attr))
                                false attrs
                               in
                            Prims.op_Negation uu____12684))
                          &&
                          (match (cfg.steps).unfold_only with
                           | FStar_Pervasives_Native.None  -> true
                           | FStar_Pervasives_Native.Some lids ->
                               FStar_Util.for_some
                                 (FStar_Syntax_Syntax.fv_eq_lid fv) lids))
                         &&
                         (match (attrs, ((cfg.steps).unfold_attr)) with
                          | (FStar_Pervasives_Native.None
                             ,FStar_Pervasives_Native.Some uu____12703) ->
                              false
                          | (FStar_Pervasives_Native.Some
                             ats,FStar_Pervasives_Native.Some ats') ->
                              FStar_Util.for_some
                                (fun at  ->
                                   FStar_Util.for_some
                                     (FStar_Syntax_Util.attr_eq at) ats') ats
                          | (uu____12738,FStar_Pervasives_Native.None ) ->
                              true))
                     in
                  let uu____12753 =
                    match (cfg.steps).unfold_fully with
                    | FStar_Pervasives_Native.None  -> (should_delta1, false)
                    | FStar_Pervasives_Native.Some lids ->
                        let uu____12769 =
                          FStar_Util.for_some
                            (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                           in
                        if uu____12769 then (true, true) else (false, false)
                     in
                  match uu____12753 with
                  | (should_delta2,fully) ->
                      (log cfg
                         (fun uu____12782  ->
                            let uu____12783 =
                              FStar_Syntax_Print.term_to_string t1  in
                            let uu____12784 =
                              FStar_Range.string_of_range
                                t1.FStar_Syntax_Syntax.pos
                               in
                            let uu____12785 =
                              FStar_Util.string_of_bool should_delta2  in
                            FStar_Util.print3
                              ">>> For %s (%s), should_delta = %s\n"
                              uu____12783 uu____12784 uu____12785);
                       if should_delta2
                       then
                         (let uu____12786 =
                            if fully
                            then
                              (((Cfg cfg) :: stack),
                                (let uu___178_12796 = cfg  in
                                 {
                                   steps =
                                     (let uu___179_12799 = cfg.steps  in
                                      {
                                        beta = (uu___179_12799.beta);
                                        iota = false;
                                        zeta = false;
                                        weak = false;
                                        hnf = false;
                                        primops = false;
                                        do_not_unfold_pure_lets =
                                          (uu___179_12799.do_not_unfold_pure_lets);
                                        unfold_until =
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.delta_constant);
                                        unfold_only =
                                          FStar_Pervasives_Native.None;
                                        unfold_fully =
                                          FStar_Pervasives_Native.None;
                                        unfold_attr =
                                          (uu___179_12799.unfold_attr);
                                        unfold_tac =
                                          (uu___179_12799.unfold_tac);
                                        pure_subterms_within_computations =
                                          (uu___179_12799.pure_subterms_within_computations);
                                        simplify = false;
                                        erase_universes =
                                          (uu___179_12799.erase_universes);
                                        allow_unbound_universes =
                                          (uu___179_12799.allow_unbound_universes);
                                        reify_ = (uu___179_12799.reify_);
                                        compress_uvars =
                                          (uu___179_12799.compress_uvars);
                                        no_full_norm =
                                          (uu___179_12799.no_full_norm);
                                        check_no_uvars =
                                          (uu___179_12799.check_no_uvars);
                                        unmeta = (uu___179_12799.unmeta);
                                        unascribe =
                                          (uu___179_12799.unascribe);
                                        in_full_norm_request =
                                          (uu___179_12799.in_full_norm_request);
                                        weakly_reduce_scrutinee =
                                          (uu___179_12799.weakly_reduce_scrutinee)
                                      });
                                   tcenv = (uu___178_12796.tcenv);
                                   debug = (uu___178_12796.debug);
                                   delta_level = (uu___178_12796.delta_level);
                                   primitive_steps =
                                     (uu___178_12796.primitive_steps);
                                   strong = (uu___178_12796.strong);
                                   memoize_lazy =
                                     (uu___178_12796.memoize_lazy);
                                   normalize_pure_lets =
                                     (uu___178_12796.normalize_pure_lets)
                                 }))
                            else (stack, cfg)  in
                          match uu____12786 with
                          | (stack1,cfg1) ->
                              do_unfold_fv cfg1 env stack1 t1 qninfo fv)
                       else rebuild cfg env stack t1))
           | FStar_Syntax_Syntax.Tm_bvar x ->
               let uu____12809 = lookup_bvar env x  in
               (match uu____12809 with
                | Univ uu____12810 ->
                    failwith
                      "Impossible: term variable is bound to a universe"
                | Dummy  -> failwith "Term variable not found"
                | Clos (env1,t0,r,fix) ->
                    if (Prims.op_Negation fix) || (cfg.steps).zeta
                    then
                      let uu____12859 = FStar_ST.op_Bang r  in
                      (match uu____12859 with
                       | FStar_Pervasives_Native.Some (env2,t') ->
                           (log cfg
                              (fun uu____12981  ->
                                 let uu____12982 =
                                   FStar_Syntax_Print.term_to_string t1  in
                                 let uu____12983 =
                                   FStar_Syntax_Print.term_to_string t'  in
                                 FStar_Util.print2
                                   "Lazy hit: %s cached to %s\n" uu____12982
                                   uu____12983);
                            (let uu____12984 = maybe_weakly_reduced t'  in
                             if uu____12984
                             then
                               match stack with
                               | [] when
                                   (cfg.steps).weak ||
                                     (cfg.steps).compress_uvars
                                   -> rebuild cfg env2 stack t'
                               | uu____12985 -> norm cfg env2 stack t'
                             else rebuild cfg env2 stack t'))
                       | FStar_Pervasives_Native.None  ->
                           norm cfg env1 ((MemoLazy r) :: stack) t0)
                    else norm cfg env1 stack t0)
           | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
               (match stack with
                | (UnivArgs uu____13056)::uu____13057 ->
                    failwith
                      "Ill-typed term: universes cannot be applied to term abstraction"
                | (Arg (c,uu____13067,uu____13068))::stack_rest ->
                    (match c with
                     | Univ uu____13072 ->
                         norm cfg ((FStar_Pervasives_Native.None, c) :: env)
                           stack_rest t1
                     | uu____13081 ->
                         (match bs with
                          | [] -> failwith "Impossible"
                          | b::[] ->
                              (log cfg
                                 (fun uu____13102  ->
                                    let uu____13103 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____13103);
                               norm cfg
                                 (((FStar_Pervasives_Native.Some b), c) ::
                                 env) stack_rest body)
                          | b::tl1 ->
                              (log cfg
                                 (fun uu____13131  ->
                                    let uu____13132 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____13132);
                               (let body1 =
                                  mk
                                    (FStar_Syntax_Syntax.Tm_abs
                                       (tl1, body, lopt))
                                    t1.FStar_Syntax_Syntax.pos
                                   in
                                norm cfg
                                  (((FStar_Pervasives_Native.Some b), c) ::
                                  env) stack_rest body1))))
                | (Cfg cfg1)::stack1 -> norm cfg1 env stack1 t1
                | (MemoLazy r)::stack1 ->
                    (set_memo cfg r (env, t1);
                     log cfg
                       (fun uu____13198  ->
                          let uu____13199 =
                            FStar_Syntax_Print.term_to_string t1  in
                          FStar_Util.print1 "\tSet memo %s\n" uu____13199);
                     norm cfg env stack1 t1)
                | (Match uu____13200)::uu____13201 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13215 = cfg.steps  in
                             {
                               beta = (uu___180_13215.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13215.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13215.unfold_until);
                               unfold_only = (uu___180_13215.unfold_only);
                               unfold_fully = (uu___180_13215.unfold_fully);
                               unfold_attr = (uu___180_13215.unfold_attr);
                               unfold_tac = (uu___180_13215.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13215.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13215.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13215.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13215.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13215.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13215.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13217 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13217.tcenv);
                               debug = (uu___181_13217.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13217.primitive_steps);
                               strong = (uu___181_13217.strong);
                               memoize_lazy = (uu___181_13217.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13217.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13219 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13219 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13251  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13292 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13292)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13297 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13297.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13297.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13298 -> lopt  in
                           (log cfg
                              (fun uu____13304  ->
                                 let uu____13305 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13305);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13314 = cfg  in
                               {
                                 steps = (uu___183_13314.steps);
                                 tcenv = (uu___183_13314.tcenv);
                                 debug = (uu___183_13314.debug);
                                 delta_level = (uu___183_13314.delta_level);
                                 primitive_steps =
                                   (uu___183_13314.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13314.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13314.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Debug uu____13317)::uu____13318 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13328 = cfg.steps  in
                             {
                               beta = (uu___180_13328.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13328.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13328.unfold_until);
                               unfold_only = (uu___180_13328.unfold_only);
                               unfold_fully = (uu___180_13328.unfold_fully);
                               unfold_attr = (uu___180_13328.unfold_attr);
                               unfold_tac = (uu___180_13328.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13328.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13328.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13328.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13328.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13328.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13328.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13330 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13330.tcenv);
                               debug = (uu___181_13330.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13330.primitive_steps);
                               strong = (uu___181_13330.strong);
                               memoize_lazy = (uu___181_13330.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13330.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13332 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13332 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13364  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13405 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13405)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13410 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13410.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13410.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13411 -> lopt  in
                           (log cfg
                              (fun uu____13417  ->
                                 let uu____13418 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13418);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13427 = cfg  in
                               {
                                 steps = (uu___183_13427.steps);
                                 tcenv = (uu___183_13427.tcenv);
                                 debug = (uu___183_13427.debug);
                                 delta_level = (uu___183_13427.delta_level);
                                 primitive_steps =
                                   (uu___183_13427.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13427.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13427.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Meta uu____13430)::uu____13431 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13443 = cfg.steps  in
                             {
                               beta = (uu___180_13443.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13443.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13443.unfold_until);
                               unfold_only = (uu___180_13443.unfold_only);
                               unfold_fully = (uu___180_13443.unfold_fully);
                               unfold_attr = (uu___180_13443.unfold_attr);
                               unfold_tac = (uu___180_13443.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13443.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13443.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13443.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13443.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13443.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13443.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13445 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13445.tcenv);
                               debug = (uu___181_13445.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13445.primitive_steps);
                               strong = (uu___181_13445.strong);
                               memoize_lazy = (uu___181_13445.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13445.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13447 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13447 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13479  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13520 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13520)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13525 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13525.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13525.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13526 -> lopt  in
                           (log cfg
                              (fun uu____13532  ->
                                 let uu____13533 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13533);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13542 = cfg  in
                               {
                                 steps = (uu___183_13542.steps);
                                 tcenv = (uu___183_13542.tcenv);
                                 debug = (uu___183_13542.debug);
                                 delta_level = (uu___183_13542.delta_level);
                                 primitive_steps =
                                   (uu___183_13542.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13542.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13542.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Let uu____13545)::uu____13546 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13560 = cfg.steps  in
                             {
                               beta = (uu___180_13560.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13560.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13560.unfold_until);
                               unfold_only = (uu___180_13560.unfold_only);
                               unfold_fully = (uu___180_13560.unfold_fully);
                               unfold_attr = (uu___180_13560.unfold_attr);
                               unfold_tac = (uu___180_13560.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13560.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13560.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13560.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13560.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13560.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13560.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13562 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13562.tcenv);
                               debug = (uu___181_13562.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13562.primitive_steps);
                               strong = (uu___181_13562.strong);
                               memoize_lazy = (uu___181_13562.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13562.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13564 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13564 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13596  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13637 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13637)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13642 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13642.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13642.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13643 -> lopt  in
                           (log cfg
                              (fun uu____13649  ->
                                 let uu____13650 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13650);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13659 = cfg  in
                               {
                                 steps = (uu___183_13659.steps);
                                 tcenv = (uu___183_13659.tcenv);
                                 debug = (uu___183_13659.debug);
                                 delta_level = (uu___183_13659.delta_level);
                                 primitive_steps =
                                   (uu___183_13659.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13659.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13659.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (App uu____13662)::uu____13663 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13677 = cfg.steps  in
                             {
                               beta = (uu___180_13677.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13677.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13677.unfold_until);
                               unfold_only = (uu___180_13677.unfold_only);
                               unfold_fully = (uu___180_13677.unfold_fully);
                               unfold_attr = (uu___180_13677.unfold_attr);
                               unfold_tac = (uu___180_13677.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13677.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13677.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13677.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13677.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13677.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13677.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13679 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13679.tcenv);
                               debug = (uu___181_13679.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13679.primitive_steps);
                               strong = (uu___181_13679.strong);
                               memoize_lazy = (uu___181_13679.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13679.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13681 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13681 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13713  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13754 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13754)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13759 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13759.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13759.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13760 -> lopt  in
                           (log cfg
                              (fun uu____13766  ->
                                 let uu____13767 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13767);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13776 = cfg  in
                               {
                                 steps = (uu___183_13776.steps);
                                 tcenv = (uu___183_13776.tcenv);
                                 debug = (uu___183_13776.debug);
                                 delta_level = (uu___183_13776.delta_level);
                                 primitive_steps =
                                   (uu___183_13776.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13776.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13776.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | (Abs uu____13779)::uu____13780 ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13798 = cfg.steps  in
                             {
                               beta = (uu___180_13798.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13798.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13798.unfold_until);
                               unfold_only = (uu___180_13798.unfold_only);
                               unfold_fully = (uu___180_13798.unfold_fully);
                               unfold_attr = (uu___180_13798.unfold_attr);
                               unfold_tac = (uu___180_13798.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13798.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13798.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13798.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13798.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13798.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13798.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13800 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13800.tcenv);
                               debug = (uu___181_13800.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13800.primitive_steps);
                               strong = (uu___181_13800.strong);
                               memoize_lazy = (uu___181_13800.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13800.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13802 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13802 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13834  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13875 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13875)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13880 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13880.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13880.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13881 -> lopt  in
                           (log cfg
                              (fun uu____13887  ->
                                 let uu____13888 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13888);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_13897 = cfg  in
                               {
                                 steps = (uu___183_13897.steps);
                                 tcenv = (uu___183_13897.tcenv);
                                 debug = (uu___183_13897.debug);
                                 delta_level = (uu___183_13897.delta_level);
                                 primitive_steps =
                                   (uu___183_13897.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_13897.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_13897.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | [] ->
                    if (cfg.steps).weak
                    then
                      let t2 =
                        if (cfg.steps).in_full_norm_request
                        then closure_as_term cfg env t1
                        else
                          (let steps' =
                             let uu___180_13903 = cfg.steps  in
                             {
                               beta = (uu___180_13903.beta);
                               iota = false;
                               zeta = false;
                               weak = false;
                               hnf = (uu___180_13903.hnf);
                               primops = false;
                               do_not_unfold_pure_lets = true;
                               unfold_until = (uu___180_13903.unfold_until);
                               unfold_only = (uu___180_13903.unfold_only);
                               unfold_fully = (uu___180_13903.unfold_fully);
                               unfold_attr = (uu___180_13903.unfold_attr);
                               unfold_tac = (uu___180_13903.unfold_tac);
                               pure_subterms_within_computations = false;
                               simplify = false;
                               erase_universes =
                                 (uu___180_13903.erase_universes);
                               allow_unbound_universes =
                                 (uu___180_13903.allow_unbound_universes);
                               reify_ = false;
                               compress_uvars =
                                 (uu___180_13903.compress_uvars);
                               no_full_norm = true;
                               check_no_uvars =
                                 (uu___180_13903.check_no_uvars);
                               unmeta = false;
                               unascribe = false;
                               in_full_norm_request =
                                 (uu___180_13903.in_full_norm_request);
                               weakly_reduce_scrutinee =
                                 (uu___180_13903.weakly_reduce_scrutinee)
                             }  in
                           let cfg' =
                             let uu___181_13905 = cfg  in
                             {
                               steps = steps';
                               tcenv = (uu___181_13905.tcenv);
                               debug = (uu___181_13905.debug);
                               delta_level = [FStar_TypeChecker_Env.NoDelta];
                               primitive_steps =
                                 (uu___181_13905.primitive_steps);
                               strong = (uu___181_13905.strong);
                               memoize_lazy = (uu___181_13905.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___181_13905.normalize_pure_lets)
                             }  in
                           norm cfg' env [] t1)
                         in
                      rebuild cfg env stack t2
                    else
                      (let uu____13907 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____13907 with
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____13939  -> dummy :: env1) env)
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if (cfg.steps).check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
                                          let uu____13980 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____13980)
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
                                   (let uu___182_13985 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___182_13985.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___182_13985.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____13986 -> lopt  in
                           (log cfg
                              (fun uu____13992  ->
                                 let uu____13993 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____13993);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___183_14002 = cfg  in
                               {
                                 steps = (uu___183_14002.steps);
                                 tcenv = (uu___183_14002.tcenv);
                                 debug = (uu___183_14002.debug);
                                 delta_level = (uu___183_14002.delta_level);
                                 primitive_steps =
                                   (uu___183_14002.primitive_steps);
                                 strong = true;
                                 memoize_lazy = (uu___183_14002.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___183_14002.normalize_pure_lets)
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1))))
           | FStar_Syntax_Syntax.Tm_app (head1,args) ->
               let stack1 =
                 FStar_All.pipe_right stack
                   (FStar_List.fold_right
                      (fun uu____14041  ->
                         fun stack1  ->
                           match uu____14041 with
                           | (a,aq) ->
                               let uu____14053 =
                                 let uu____14054 =
                                   let uu____14061 =
                                     let uu____14062 =
                                       let uu____14093 =
                                         FStar_Util.mk_ref
                                           FStar_Pervasives_Native.None
                                          in
                                       (env, a, uu____14093, false)  in
                                     Clos uu____14062  in
                                   (uu____14061, aq,
                                     (t1.FStar_Syntax_Syntax.pos))
                                    in
                                 Arg uu____14054  in
                               uu____14053 :: stack1) args)
                  in
               (log cfg
                  (fun uu____14181  ->
                     let uu____14182 =
                       FStar_All.pipe_left FStar_Util.string_of_int
                         (FStar_List.length args)
                        in
                     FStar_Util.print1 "\tPushed %s arguments\n" uu____14182);
                norm cfg env stack1 head1)
           | FStar_Syntax_Syntax.Tm_refine (x,f) ->
               if (cfg.steps).weak
               then
                 (match (env, stack) with
                  | ([],[]) ->
                      let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort
                         in
                      let t2 =
                        mk
                          (FStar_Syntax_Syntax.Tm_refine
                             ((let uu___184_14228 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___184_14228.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___184_14228.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = t_x
                               }), f)) t1.FStar_Syntax_Syntax.pos
                         in
                      rebuild cfg env stack t2
                  | uu____14229 ->
                      let uu____14244 = closure_as_term cfg env t1  in
                      rebuild cfg env stack uu____14244)
               else
                 (let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort  in
                  let uu____14247 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] f
                     in
                  match uu____14247 with
                  | (closing,f1) ->
                      let f2 = norm cfg (dummy :: env) [] f1  in
                      let t2 =
                        let uu____14272 =
                          let uu____14273 =
                            let uu____14280 =
                              FStar_Syntax_Subst.close closing f2  in
                            ((let uu___185_14286 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___185_14286.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___185_14286.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = t_x
                              }), uu____14280)
                             in
                          FStar_Syntax_Syntax.Tm_refine uu____14273  in
                        mk uu____14272 t1.FStar_Syntax_Syntax.pos  in
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
               if (cfg.steps).weak
               then
                 let uu____14305 = closure_as_term cfg env t1  in
                 rebuild cfg env stack uu____14305
               else
                 (let uu____14307 = FStar_Syntax_Subst.open_comp bs c  in
                  match uu____14307 with
                  | (bs1,c1) ->
                      let c2 =
                        let uu____14315 =
                          FStar_All.pipe_right bs1
                            (FStar_List.fold_left
                               (fun env1  ->
                                  fun uu____14337  -> dummy :: env1) env)
                           in
                        norm_comp cfg uu____14315 c1  in
                      let t2 =
                        let uu____14359 = norm_binders cfg env bs1  in
                        FStar_Syntax_Util.arrow uu____14359 c2  in
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) when
               (cfg.steps).unascribe -> norm cfg env stack t11
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) ->
               (match stack with
                | (Match uu____14470)::uu____14471 ->
                    (log cfg
                       (fun uu____14484  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (Arg uu____14485)::uu____14486 ->
                    (log cfg
                       (fun uu____14497  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (App
                    (uu____14498,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_constant
                                     (FStar_Const.Const_reify );
                                   FStar_Syntax_Syntax.pos = uu____14499;
                                   FStar_Syntax_Syntax.vars = uu____14500;_},uu____14501,uu____14502))::uu____14503
                    ->
                    (log cfg
                       (fun uu____14510  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (MemoLazy uu____14511)::uu____14512 ->
                    (log cfg
                       (fun uu____14523  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | uu____14524 ->
                    (log cfg
                       (fun uu____14527  ->
                          FStar_Util.print_string "+++ Keeping ascription \n");
                     (let t12 = norm cfg env [] t11  in
                      log cfg
                        (fun uu____14531  ->
                           FStar_Util.print_string
                             "+++ Normalizing ascription \n");
                      (let tc1 =
                         match tc with
                         | FStar_Util.Inl t2 ->
                             let uu____14556 = norm cfg env [] t2  in
                             FStar_Util.Inl uu____14556
                         | FStar_Util.Inr c ->
                             let uu____14566 = norm_comp cfg env c  in
                             FStar_Util.Inr uu____14566
                          in
                       let tacopt1 =
                         FStar_Util.map_opt tacopt (norm cfg env [])  in
                       match stack with
                       | (Cfg cfg1)::stack1 ->
                           let t2 =
                             let uu____14585 =
                               let uu____14586 =
                                 let uu____14613 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____14613, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____14586
                                in
                             mk uu____14585 t1.FStar_Syntax_Syntax.pos  in
                           norm cfg1 env stack1 t2
                       | uu____14648 ->
                           let uu____14649 =
                             let uu____14650 =
                               let uu____14651 =
                                 let uu____14678 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____14678, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____14651
                                in
                             mk uu____14650 t1.FStar_Syntax_Syntax.pos  in
                           rebuild cfg env stack uu____14649))))
           | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
               let stack1 =
                 (Match (env, branches, cfg, (t1.FStar_Syntax_Syntax.pos)))
                 :: stack  in
               if
                 ((cfg.steps).iota && (cfg.steps).weakly_reduce_scrutinee) &&
                   (Prims.op_Negation (cfg.steps).weak)
               then
                 let cfg' =
                   let uu___186_14755 = cfg  in
                   {
                     steps =
                       (let uu___187_14758 = cfg.steps  in
                        {
                          beta = (uu___187_14758.beta);
                          iota = (uu___187_14758.iota);
                          zeta = (uu___187_14758.zeta);
                          weak = true;
                          hnf = (uu___187_14758.hnf);
                          primops = (uu___187_14758.primops);
                          do_not_unfold_pure_lets =
                            (uu___187_14758.do_not_unfold_pure_lets);
                          unfold_until = (uu___187_14758.unfold_until);
                          unfold_only = (uu___187_14758.unfold_only);
                          unfold_fully = (uu___187_14758.unfold_fully);
                          unfold_attr = (uu___187_14758.unfold_attr);
                          unfold_tac = (uu___187_14758.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___187_14758.pure_subterms_within_computations);
                          simplify = (uu___187_14758.simplify);
                          erase_universes = (uu___187_14758.erase_universes);
                          allow_unbound_universes =
                            (uu___187_14758.allow_unbound_universes);
                          reify_ = (uu___187_14758.reify_);
                          compress_uvars = (uu___187_14758.compress_uvars);
                          no_full_norm = (uu___187_14758.no_full_norm);
                          check_no_uvars = (uu___187_14758.check_no_uvars);
                          unmeta = (uu___187_14758.unmeta);
                          unascribe = (uu___187_14758.unascribe);
                          in_full_norm_request =
                            (uu___187_14758.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___187_14758.weakly_reduce_scrutinee)
                        });
                     tcenv = (uu___186_14755.tcenv);
                     debug = (uu___186_14755.debug);
                     delta_level = (uu___186_14755.delta_level);
                     primitive_steps = (uu___186_14755.primitive_steps);
                     strong = (uu___186_14755.strong);
                     memoize_lazy = (uu___186_14755.memoize_lazy);
                     normalize_pure_lets =
                       (uu___186_14755.normalize_pure_lets)
                   }  in
                 norm cfg' env ((Cfg cfg) :: stack1) head1
               else norm cfg env stack1 head1
           | FStar_Syntax_Syntax.Tm_let ((b,lbs),lbody) when
               (FStar_Syntax_Syntax.is_top_level lbs) &&
                 (cfg.steps).compress_uvars
               ->
               let lbs1 =
                 FStar_All.pipe_right lbs
                   (FStar_List.map
                      (fun lb  ->
                         let uu____14794 =
                           FStar_Syntax_Subst.univ_var_opening
                             lb.FStar_Syntax_Syntax.lbunivs
                            in
                         match uu____14794 with
                         | (openings,lbunivs) ->
                             let cfg1 =
                               let uu___188_14814 = cfg  in
                               let uu____14815 =
                                 FStar_TypeChecker_Env.push_univ_vars
                                   cfg.tcenv lbunivs
                                  in
                               {
                                 steps = (uu___188_14814.steps);
                                 tcenv = uu____14815;
                                 debug = (uu___188_14814.debug);
                                 delta_level = (uu___188_14814.delta_level);
                                 primitive_steps =
                                   (uu___188_14814.primitive_steps);
                                 strong = (uu___188_14814.strong);
                                 memoize_lazy = (uu___188_14814.memoize_lazy);
                                 normalize_pure_lets =
                                   (uu___188_14814.normalize_pure_lets)
                               }  in
                             let norm1 t2 =
                               let uu____14822 =
                                 let uu____14823 =
                                   FStar_Syntax_Subst.subst openings t2  in
                                 norm cfg1 env [] uu____14823  in
                               FStar_Syntax_Subst.close_univ_vars lbunivs
                                 uu____14822
                                in
                             let lbtyp = norm1 lb.FStar_Syntax_Syntax.lbtyp
                                in
                             let lbdef = norm1 lb.FStar_Syntax_Syntax.lbdef
                                in
                             let uu___189_14826 = lb  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___189_14826.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs = lbunivs;
                               FStar_Syntax_Syntax.lbtyp = lbtyp;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___189_14826.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = lbdef;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___189_14826.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___189_14826.FStar_Syntax_Syntax.lbpos)
                             }))
                  in
               let uu____14827 =
                 mk (FStar_Syntax_Syntax.Tm_let ((b, lbs1), lbody))
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____14827
           | FStar_Syntax_Syntax.Tm_let
               ((uu____14838,{
                               FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                                 uu____14839;
                               FStar_Syntax_Syntax.lbunivs = uu____14840;
                               FStar_Syntax_Syntax.lbtyp = uu____14841;
                               FStar_Syntax_Syntax.lbeff = uu____14842;
                               FStar_Syntax_Syntax.lbdef = uu____14843;
                               FStar_Syntax_Syntax.lbattrs = uu____14844;
                               FStar_Syntax_Syntax.lbpos = uu____14845;_}::uu____14846),uu____14847)
               -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
               let n1 =
                 FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
                   lb.FStar_Syntax_Syntax.lbeff
                  in
               let uu____14887 =
                 (Prims.op_Negation (cfg.steps).do_not_unfold_pure_lets) &&
                   ((((cfg.steps).pure_subterms_within_computations &&
                        (FStar_Syntax_Util.has_attribute
                           lb.FStar_Syntax_Syntax.lbattrs
                           FStar_Parser_Const.inline_let_attr))
                       ||
                       ((FStar_Syntax_Util.is_pure_effect n1) &&
                          (cfg.normalize_pure_lets ||
                             (FStar_Syntax_Util.has_attribute
                                lb.FStar_Syntax_Syntax.lbattrs
                                FStar_Parser_Const.inline_let_attr))))
                      ||
                      ((FStar_Syntax_Util.is_ghost_effect n1) &&
                         (Prims.op_Negation
                            (cfg.steps).pure_subterms_within_computations)))
                  in
               if uu____14887
               then
                 let binder =
                   let uu____14889 =
                     FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                   FStar_Syntax_Syntax.mk_binder uu____14889  in
                 let env1 =
                   let uu____14899 =
                     let uu____14906 =
                       let uu____14907 =
                         let uu____14938 =
                           FStar_Util.mk_ref FStar_Pervasives_Native.None  in
                         (env, (lb.FStar_Syntax_Syntax.lbdef), uu____14938,
                           false)
                          in
                       Clos uu____14907  in
                     ((FStar_Pervasives_Native.Some binder), uu____14906)  in
                   uu____14899 :: env  in
                 (log cfg
                    (fun uu____15033  ->
                       FStar_Util.print_string "+++ Reducing Tm_let\n");
                  norm cfg env1 stack body)
               else
                 if (cfg.steps).weak
                 then
                   (log cfg
                      (fun uu____15037  ->
                         FStar_Util.print_string "+++ Not touching Tm_let\n");
                    (let uu____15038 = closure_as_term cfg env t1  in
                     rebuild cfg env stack uu____15038))
                 else
                   (let uu____15040 =
                      let uu____15045 =
                        let uu____15046 =
                          let uu____15051 =
                            FStar_All.pipe_right
                              lb.FStar_Syntax_Syntax.lbname FStar_Util.left
                             in
                          FStar_All.pipe_right uu____15051
                            FStar_Syntax_Syntax.mk_binder
                           in
                        [uu____15046]  in
                      FStar_Syntax_Subst.open_term uu____15045 body  in
                    match uu____15040 with
                    | (bs,body1) ->
                        (log cfg
                           (fun uu____15072  ->
                              FStar_Util.print_string
                                "+++ Normalizing Tm_let -- type");
                         (let ty =
                            norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                          let lbname =
                            let x =
                              let uu____15080 = FStar_List.hd bs  in
                              FStar_Pervasives_Native.fst uu____15080  in
                            FStar_Util.Inl
                              (let uu___190_15090 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___190_15090.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___190_15090.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               })
                             in
                          log cfg
                            (fun uu____15093  ->
                               FStar_Util.print_string
                                 "+++ Normalizing Tm_let -- definiens\n");
                          (let lb1 =
                             let uu___191_15095 = lb  in
                             let uu____15096 =
                               norm cfg env [] lb.FStar_Syntax_Syntax.lbdef
                                in
                             {
                               FStar_Syntax_Syntax.lbname = lbname;
                               FStar_Syntax_Syntax.lbunivs =
                                 (uu___191_15095.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp = ty;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___191_15095.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____15096;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___191_15095.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___191_15095.FStar_Syntax_Syntax.lbpos)
                             }  in
                           let env' =
                             FStar_All.pipe_right bs
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____15121  -> dummy :: env1) env)
                              in
                           let stack1 = (Cfg cfg) :: stack  in
                           let cfg1 =
                             let uu___192_15144 = cfg  in
                             {
                               steps = (uu___192_15144.steps);
                               tcenv = (uu___192_15144.tcenv);
                               debug = (uu___192_15144.debug);
                               delta_level = (uu___192_15144.delta_level);
                               primitive_steps =
                                 (uu___192_15144.primitive_steps);
                               strong = true;
                               memoize_lazy = (uu___192_15144.memoize_lazy);
                               normalize_pure_lets =
                                 (uu___192_15144.normalize_pure_lets)
                             }  in
                           log cfg1
                             (fun uu____15147  ->
                                FStar_Util.print_string
                                  "+++ Normalizing Tm_let -- body\n");
                           norm cfg1 env'
                             ((Let
                                 (env, bs, lb1, (t1.FStar_Syntax_Syntax.pos)))
                             :: stack1) body1))))
           | FStar_Syntax_Syntax.Tm_let ((true ,lbs),body) when
               (cfg.steps).compress_uvars ||
                 ((Prims.op_Negation (cfg.steps).zeta) &&
                    (cfg.steps).pure_subterms_within_computations)
               ->
               let uu____15164 = FStar_Syntax_Subst.open_let_rec lbs body  in
               (match uu____15164 with
                | (lbs1,body1) ->
                    let lbs2 =
                      FStar_List.map
                        (fun lb  ->
                           let ty =
                             norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                           let lbname =
                             let uu____15200 =
                               let uu___193_15201 =
                                 FStar_Util.left
                                   lb.FStar_Syntax_Syntax.lbname
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___193_15201.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___193_15201.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               }  in
                             FStar_Util.Inl uu____15200  in
                           let uu____15202 =
                             FStar_Syntax_Util.abs_formals
                               lb.FStar_Syntax_Syntax.lbdef
                              in
                           match uu____15202 with
                           | (xs,def_body,lopt) ->
                               let xs1 = norm_binders cfg env xs  in
                               let env1 =
                                 let uu____15228 =
                                   FStar_List.map (fun uu____15244  -> dummy)
                                     lbs1
                                    in
                                 let uu____15245 =
                                   let uu____15254 =
                                     FStar_List.map
                                       (fun uu____15274  -> dummy) xs1
                                      in
                                   FStar_List.append uu____15254 env  in
                                 FStar_List.append uu____15228 uu____15245
                                  in
                               let def_body1 = norm cfg env1 [] def_body  in
                               let lopt1 =
                                 match lopt with
                                 | FStar_Pervasives_Native.Some rc ->
                                     let uu____15298 =
                                       let uu___194_15299 = rc  in
                                       let uu____15300 =
                                         FStar_Util.map_opt
                                           rc.FStar_Syntax_Syntax.residual_typ
                                           (norm cfg env1 [])
                                          in
                                       {
                                         FStar_Syntax_Syntax.residual_effect
                                           =
                                           (uu___194_15299.FStar_Syntax_Syntax.residual_effect);
                                         FStar_Syntax_Syntax.residual_typ =
                                           uu____15300;
                                         FStar_Syntax_Syntax.residual_flags =
                                           (uu___194_15299.FStar_Syntax_Syntax.residual_flags)
                                       }  in
                                     FStar_Pervasives_Native.Some uu____15298
                                 | uu____15309 -> lopt  in
                               let def =
                                 FStar_Syntax_Util.abs xs1 def_body1 lopt1
                                  in
                               let uu___195_15315 = lb  in
                               {
                                 FStar_Syntax_Syntax.lbname = lbname;
                                 FStar_Syntax_Syntax.lbunivs =
                                   (uu___195_15315.FStar_Syntax_Syntax.lbunivs);
                                 FStar_Syntax_Syntax.lbtyp = ty;
                                 FStar_Syntax_Syntax.lbeff =
                                   (uu___195_15315.FStar_Syntax_Syntax.lbeff);
                                 FStar_Syntax_Syntax.lbdef = def;
                                 FStar_Syntax_Syntax.lbattrs =
                                   (uu___195_15315.FStar_Syntax_Syntax.lbattrs);
                                 FStar_Syntax_Syntax.lbpos =
                                   (uu___195_15315.FStar_Syntax_Syntax.lbpos)
                               }) lbs1
                       in
                    let env' =
                      let uu____15325 =
                        FStar_List.map (fun uu____15341  -> dummy) lbs2  in
                      FStar_List.append uu____15325 env  in
                    let body2 = norm cfg env' [] body1  in
                    let uu____15349 =
                      FStar_Syntax_Subst.close_let_rec lbs2 body2  in
                    (match uu____15349 with
                     | (lbs3,body3) ->
                         let t2 =
                           let uu___196_15365 = t1  in
                           {
                             FStar_Syntax_Syntax.n =
                               (FStar_Syntax_Syntax.Tm_let
                                  ((true, lbs3), body3));
                             FStar_Syntax_Syntax.pos =
                               (uu___196_15365.FStar_Syntax_Syntax.pos);
                             FStar_Syntax_Syntax.vars =
                               (uu___196_15365.FStar_Syntax_Syntax.vars)
                           }  in
                         rebuild cfg env stack t2))
           | FStar_Syntax_Syntax.Tm_let (lbs,body) when
               Prims.op_Negation (cfg.steps).zeta ->
               let uu____15394 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____15394
           | FStar_Syntax_Syntax.Tm_let (lbs,body) ->
               let uu____15413 =
                 FStar_List.fold_right
                   (fun lb  ->
                      fun uu____15489  ->
                        match uu____15489 with
                        | (rec_env,memos,i) ->
                            let bv =
                              let uu___197_15610 =
                                FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                                 in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___197_15610.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index = i;
                                FStar_Syntax_Syntax.sort =
                                  (uu___197_15610.FStar_Syntax_Syntax.sort)
                              }  in
                            let f_i = FStar_Syntax_Syntax.bv_to_tm bv  in
                            let fix_f_i =
                              mk (FStar_Syntax_Syntax.Tm_let (lbs, f_i))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            let memo =
                              FStar_Util.mk_ref FStar_Pervasives_Native.None
                               in
                            let rec_env1 =
                              (FStar_Pervasives_Native.None,
                                (Clos (env, fix_f_i, memo, true)))
                              :: rec_env  in
                            (rec_env1, (memo :: memos),
                              (i + (Prims.parse_int "1"))))
                   (FStar_Pervasives_Native.snd lbs)
                   (env, [], (Prims.parse_int "0"))
                  in
               (match uu____15413 with
                | (rec_env,memos,uu____15837) ->
                    let uu____15890 =
                      FStar_List.map2
                        (fun lb  ->
                           fun memo  ->
                             FStar_ST.op_Colon_Equals memo
                               (FStar_Pervasives_Native.Some
                                  (rec_env, (lb.FStar_Syntax_Syntax.lbdef))))
                        (FStar_Pervasives_Native.snd lbs) memos
                       in
                    let body_env =
                      FStar_List.fold_right
                        (fun lb  ->
                           fun env1  ->
                             let uu____16213 =
                               let uu____16220 =
                                 let uu____16221 =
                                   let uu____16252 =
                                     FStar_Util.mk_ref
                                       FStar_Pervasives_Native.None
                                      in
                                   (rec_env, (lb.FStar_Syntax_Syntax.lbdef),
                                     uu____16252, false)
                                    in
                                 Clos uu____16221  in
                               (FStar_Pervasives_Native.None, uu____16220)
                                in
                             uu____16213 :: env1)
                        (FStar_Pervasives_Native.snd lbs) env
                       in
                    norm cfg body_env stack body)
           | FStar_Syntax_Syntax.Tm_meta (head1,m) ->
               (log cfg
                  (fun uu____16356  ->
                     let uu____16357 =
                       FStar_Syntax_Print.metadata_to_string m  in
                     FStar_Util.print1 ">> metadata = %s\n" uu____16357);
                (match m with
                 | FStar_Syntax_Syntax.Meta_monadic (m1,t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inl m1) t2
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m',t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inr (m1, m')) t2
                 | uu____16379 ->
                     if (cfg.steps).unmeta
                     then norm cfg env stack head1
                     else
                       (match stack with
                        | uu____16381::uu____16382 ->
                            (match m with
                             | FStar_Syntax_Syntax.Meta_labeled
                                 (l,r,uu____16387) ->
                                 norm cfg env ((Meta (env, m, r)) :: stack)
                                   head1
                             | FStar_Syntax_Syntax.Meta_pattern args ->
                                 let args1 = norm_pattern_args cfg env args
                                    in
                                 norm cfg env
                                   ((Meta
                                       (env,
                                         (FStar_Syntax_Syntax.Meta_pattern
                                            args1),
                                         (t1.FStar_Syntax_Syntax.pos))) ::
                                   stack) head1
                             | uu____16410 -> norm cfg env stack head1)
                        | [] ->
                            let head2 = norm cfg env [] head1  in
                            let m1 =
                              match m with
                              | FStar_Syntax_Syntax.Meta_pattern args ->
                                  let uu____16424 =
                                    norm_pattern_args cfg env args  in
                                  FStar_Syntax_Syntax.Meta_pattern
                                    uu____16424
                              | uu____16435 -> m  in
                            let t2 =
                              mk (FStar_Syntax_Syntax.Tm_meta (head2, m1))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            rebuild cfg env stack t2)))
           | FStar_Syntax_Syntax.Tm_delayed uu____16441 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               norm cfg env stack t2
           | FStar_Syntax_Syntax.Tm_uvar uu____16467 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               (match t2.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_uvar uu____16483 ->
                    if (cfg.steps).check_no_uvars
                    then
                      let uu____16498 =
                        let uu____16499 =
                          FStar_Range.string_of_range
                            t2.FStar_Syntax_Syntax.pos
                           in
                        let uu____16500 =
                          FStar_Syntax_Print.term_to_string t2  in
                        FStar_Util.format2
                          "(%s) CheckNoUvars: Unexpected unification variable remains: %s"
                          uu____16499 uu____16500
                         in
                      failwith uu____16498
                    else
                      (let uu____16502 = inline_closure_env cfg env [] t2  in
                       rebuild cfg env stack uu____16502)
                | uu____16503 -> norm cfg env stack t2))

and (do_unfold_fv :
  cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_TypeChecker_Env.qninfo ->
            FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t0  ->
          fun qninfo  ->
            fun f  ->
              let r_env =
                let uu____16513 = FStar_Syntax_Syntax.range_of_fv f  in
                FStar_TypeChecker_Env.set_range cfg.tcenv uu____16513  in
              let uu____16514 =
                FStar_TypeChecker_Env.lookup_definition_qninfo
                  cfg.delta_level
                  (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                  qninfo
                 in
              match uu____16514 with
              | FStar_Pervasives_Native.None  ->
                  (log cfg
                     (fun uu____16527  ->
                        FStar_Util.print "Tm_fvar case 2\n" []);
                   rebuild cfg env stack t0)
              | FStar_Pervasives_Native.Some (us,t) ->
                  (log cfg
                     (fun uu____16538  ->
                        let uu____16539 =
                          FStar_Syntax_Print.term_to_string t0  in
                        let uu____16540 = FStar_Syntax_Print.term_to_string t
                           in
                        FStar_Util.print2 ">>> Unfolded %s to %s\n"
                          uu____16539 uu____16540);
                   (let t1 =
                      if
                        ((cfg.steps).unfold_until =
                           (FStar_Pervasives_Native.Some
                              FStar_Syntax_Syntax.delta_constant))
                          && (Prims.op_Negation (cfg.steps).unfold_tac)
                      then t
                      else
                        (let uu____16545 =
                           FStar_Ident.range_of_lid
                             (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                            in
                         FStar_Syntax_Subst.set_use_range uu____16545 t)
                       in
                    let n1 = FStar_List.length us  in
                    if n1 > (Prims.parse_int "0")
                    then
                      match stack with
                      | (UnivArgs (us',uu____16554))::stack1 ->
                          let env1 =
                            FStar_All.pipe_right us'
                              (FStar_List.fold_left
                                 (fun env1  ->
                                    fun u  ->
                                      (FStar_Pervasives_Native.None,
                                        (Univ u))
                                      :: env1) env)
                             in
                          norm cfg env1 stack1 t1
                      | uu____16593 when
                          (cfg.steps).erase_universes ||
                            (cfg.steps).allow_unbound_universes
                          -> norm cfg env stack t1
                      | uu____16596 ->
                          let uu____16599 =
                            let uu____16600 =
                              FStar_Syntax_Print.lid_to_string
                                (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                               in
                            FStar_Util.format1
                              "Impossible: missing universe instantiation on %s"
                              uu____16600
                             in
                          failwith uu____16599
                    else norm cfg env stack t1))

and (reduce_impure_comp :
  cfg ->
    env ->
      stack ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.monad_name,(FStar_Syntax_Syntax.monad_name,
                                            FStar_Syntax_Syntax.monad_name)
                                            FStar_Pervasives_Native.tuple2)
            FStar_Util.either ->
            FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun head1  ->
          fun m  ->
            fun t  ->
              let t1 = norm cfg env [] t  in
              let stack1 = (Cfg cfg) :: stack  in
              let cfg1 =
                if (cfg.steps).pure_subterms_within_computations
                then
                  let new_steps =
                    [PureSubtermsWithinComputations;
                    Primops;
                    AllowUnboundUniverses;
                    EraseUniverses;
                    Exclude Zeta;
                    Inlining]  in
                  let uu___198_16624 = cfg  in
                  let uu____16625 =
                    FStar_List.fold_right fstep_add_one new_steps cfg.steps
                     in
                  {
                    steps = uu____16625;
                    tcenv = (uu___198_16624.tcenv);
                    debug = (uu___198_16624.debug);
                    delta_level =
                      [FStar_TypeChecker_Env.Inlining;
                      FStar_TypeChecker_Env.Eager_unfolding_only];
                    primitive_steps = (uu___198_16624.primitive_steps);
                    strong = (uu___198_16624.strong);
                    memoize_lazy = (uu___198_16624.memoize_lazy);
                    normalize_pure_lets =
                      (uu___198_16624.normalize_pure_lets)
                  }
                else
                  (let uu___199_16627 = cfg  in
                   {
                     steps =
                       (let uu___200_16630 = cfg.steps  in
                        {
                          beta = (uu___200_16630.beta);
                          iota = (uu___200_16630.iota);
                          zeta = false;
                          weak = (uu___200_16630.weak);
                          hnf = (uu___200_16630.hnf);
                          primops = (uu___200_16630.primops);
                          do_not_unfold_pure_lets =
                            (uu___200_16630.do_not_unfold_pure_lets);
                          unfold_until = (uu___200_16630.unfold_until);
                          unfold_only = (uu___200_16630.unfold_only);
                          unfold_fully = (uu___200_16630.unfold_fully);
                          unfold_attr = (uu___200_16630.unfold_attr);
                          unfold_tac = (uu___200_16630.unfold_tac);
                          pure_subterms_within_computations =
                            (uu___200_16630.pure_subterms_within_computations);
                          simplify = (uu___200_16630.simplify);
                          erase_universes = (uu___200_16630.erase_universes);
                          allow_unbound_universes =
                            (uu___200_16630.allow_unbound_universes);
                          reify_ = (uu___200_16630.reify_);
                          compress_uvars = (uu___200_16630.compress_uvars);
                          no_full_norm = (uu___200_16630.no_full_norm);
                          check_no_uvars = (uu___200_16630.check_no_uvars);
                          unmeta = (uu___200_16630.unmeta);
                          unascribe = (uu___200_16630.unascribe);
                          in_full_norm_request =
                            (uu___200_16630.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___200_16630.weakly_reduce_scrutinee)
                        });
                     tcenv = (uu___199_16627.tcenv);
                     debug = (uu___199_16627.debug);
                     delta_level = (uu___199_16627.delta_level);
                     primitive_steps = (uu___199_16627.primitive_steps);
                     strong = (uu___199_16627.strong);
                     memoize_lazy = (uu___199_16627.memoize_lazy);
                     normalize_pure_lets =
                       (uu___199_16627.normalize_pure_lets)
                   })
                 in
              let metadata =
                match m with
                | FStar_Util.Inl m1 ->
                    FStar_Syntax_Syntax.Meta_monadic (m1, t1)
                | FStar_Util.Inr (m1,m') ->
                    FStar_Syntax_Syntax.Meta_monadic_lift (m1, m', t1)
                 in
              norm cfg1 env
                ((Meta (env, metadata, (head1.FStar_Syntax_Syntax.pos))) ::
                stack1) head1

and (do_reify_monadic :
  (unit -> FStar_Syntax_Syntax.term) ->
    cfg ->
      env ->
        stack_elt Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.monad_name ->
              FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun fallback  ->
    fun cfg  ->
      fun env  ->
        fun stack  ->
          fun head1  ->
            fun m  ->
              fun t  ->
                let head0 = head1  in
                let head2 = FStar_Syntax_Util.unascribe head1  in
                log cfg
                  (fun uu____16664  ->
                     let uu____16665 = FStar_Syntax_Print.tag_of_term head2
                        in
                     let uu____16666 =
                       FStar_Syntax_Print.term_to_string head2  in
                     FStar_Util.print2 "Reifying: (%s) %s\n" uu____16665
                       uu____16666);
                (let head3 = FStar_Syntax_Util.unmeta_safe head2  in
                 let uu____16668 =
                   let uu____16669 = FStar_Syntax_Subst.compress head3  in
                   uu____16669.FStar_Syntax_Syntax.n  in
                 match uu____16668 with
                 | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                     let ed =
                       let uu____16687 =
                         FStar_TypeChecker_Env.norm_eff_name cfg.tcenv m  in
                       FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                         uu____16687
                        in
                     let uu____16688 = ed.FStar_Syntax_Syntax.bind_repr  in
                     (match uu____16688 with
                      | (uu____16689,bind_repr) ->
                          (match lb.FStar_Syntax_Syntax.lbname with
                           | FStar_Util.Inr uu____16699 ->
                               failwith
                                 "Cannot reify a top-level let binding"
                           | FStar_Util.Inl x ->
                               let is_return e =
                                 let uu____16709 =
                                   let uu____16710 =
                                     FStar_Syntax_Subst.compress e  in
                                   uu____16710.FStar_Syntax_Syntax.n  in
                                 match uu____16709 with
                                 | FStar_Syntax_Syntax.Tm_meta
                                     (e1,FStar_Syntax_Syntax.Meta_monadic
                                      (uu____16716,uu____16717))
                                     ->
                                     let uu____16726 =
                                       let uu____16727 =
                                         FStar_Syntax_Subst.compress e1  in
                                       uu____16727.FStar_Syntax_Syntax.n  in
                                     (match uu____16726 with
                                      | FStar_Syntax_Syntax.Tm_meta
                                          (e2,FStar_Syntax_Syntax.Meta_monadic_lift
                                           (uu____16733,msrc,uu____16735))
                                          when
                                          FStar_Syntax_Util.is_pure_effect
                                            msrc
                                          ->
                                          let uu____16744 =
                                            FStar_Syntax_Subst.compress e2
                                             in
                                          FStar_Pervasives_Native.Some
                                            uu____16744
                                      | uu____16745 ->
                                          FStar_Pervasives_Native.None)
                                 | uu____16746 ->
                                     FStar_Pervasives_Native.None
                                  in
                               let uu____16747 =
                                 is_return lb.FStar_Syntax_Syntax.lbdef  in
                               (match uu____16747 with
                                | FStar_Pervasives_Native.Some e ->
                                    let lb1 =
                                      let uu___201_16752 = lb  in
                                      {
                                        FStar_Syntax_Syntax.lbname =
                                          (uu___201_16752.FStar_Syntax_Syntax.lbname);
                                        FStar_Syntax_Syntax.lbunivs =
                                          (uu___201_16752.FStar_Syntax_Syntax.lbunivs);
                                        FStar_Syntax_Syntax.lbtyp =
                                          (uu___201_16752.FStar_Syntax_Syntax.lbtyp);
                                        FStar_Syntax_Syntax.lbeff =
                                          FStar_Parser_Const.effect_PURE_lid;
                                        FStar_Syntax_Syntax.lbdef = e;
                                        FStar_Syntax_Syntax.lbattrs =
                                          (uu___201_16752.FStar_Syntax_Syntax.lbattrs);
                                        FStar_Syntax_Syntax.lbpos =
                                          (uu___201_16752.FStar_Syntax_Syntax.lbpos)
                                      }  in
                                    let uu____16753 = FStar_List.tl stack  in
                                    let uu____16754 =
                                      let uu____16755 =
                                        let uu____16762 =
                                          let uu____16763 =
                                            let uu____16776 =
                                              FStar_Syntax_Util.mk_reify body
                                               in
                                            ((false, [lb1]), uu____16776)  in
                                          FStar_Syntax_Syntax.Tm_let
                                            uu____16763
                                           in
                                        FStar_Syntax_Syntax.mk uu____16762
                                         in
                                      uu____16755
                                        FStar_Pervasives_Native.None
                                        head3.FStar_Syntax_Syntax.pos
                                       in
                                    norm cfg env uu____16753 uu____16754
                                | FStar_Pervasives_Native.None  ->
                                    let uu____16792 =
                                      let uu____16793 = is_return body  in
                                      match uu____16793 with
                                      | FStar_Pervasives_Native.Some
                                          {
                                            FStar_Syntax_Syntax.n =
                                              FStar_Syntax_Syntax.Tm_bvar y;
                                            FStar_Syntax_Syntax.pos =
                                              uu____16797;
                                            FStar_Syntax_Syntax.vars =
                                              uu____16798;_}
                                          -> FStar_Syntax_Syntax.bv_eq x y
                                      | uu____16801 -> false  in
                                    if uu____16792
                                    then
                                      norm cfg env stack
                                        lb.FStar_Syntax_Syntax.lbdef
                                    else
                                      (let rng =
                                         head3.FStar_Syntax_Syntax.pos  in
                                       let head4 =
                                         FStar_All.pipe_left
                                           FStar_Syntax_Util.mk_reify
                                           lb.FStar_Syntax_Syntax.lbdef
                                          in
                                       let body1 =
                                         FStar_All.pipe_left
                                           FStar_Syntax_Util.mk_reify body
                                          in
                                       let body_rc =
                                         {
                                           FStar_Syntax_Syntax.residual_effect
                                             = m;
                                           FStar_Syntax_Syntax.residual_typ =
                                             (FStar_Pervasives_Native.Some t);
                                           FStar_Syntax_Syntax.residual_flags
                                             = []
                                         }  in
                                       let body2 =
                                         let uu____16822 =
                                           let uu____16829 =
                                             let uu____16830 =
                                               let uu____16847 =
                                                 let uu____16854 =
                                                   FStar_Syntax_Syntax.mk_binder
                                                     x
                                                    in
                                                 [uu____16854]  in
                                               (uu____16847, body1,
                                                 (FStar_Pervasives_Native.Some
                                                    body_rc))
                                                in
                                             FStar_Syntax_Syntax.Tm_abs
                                               uu____16830
                                              in
                                           FStar_Syntax_Syntax.mk uu____16829
                                            in
                                         uu____16822
                                           FStar_Pervasives_Native.None
                                           body1.FStar_Syntax_Syntax.pos
                                          in
                                       let close1 = closure_as_term cfg env
                                          in
                                       let bind_inst =
                                         let uu____16888 =
                                           let uu____16889 =
                                             FStar_Syntax_Subst.compress
                                               bind_repr
                                              in
                                           uu____16889.FStar_Syntax_Syntax.n
                                            in
                                         match uu____16888 with
                                         | FStar_Syntax_Syntax.Tm_uinst
                                             (bind1,uu____16895::uu____16896::[])
                                             ->
                                             let uu____16901 =
                                               let uu____16908 =
                                                 let uu____16909 =
                                                   let uu____16916 =
                                                     let uu____16917 =
                                                       let uu____16918 =
                                                         close1
                                                           lb.FStar_Syntax_Syntax.lbtyp
                                                          in
                                                       (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                         cfg.tcenv
                                                         uu____16918
                                                        in
                                                     let uu____16919 =
                                                       let uu____16922 =
                                                         let uu____16923 =
                                                           close1 t  in
                                                         (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                           cfg.tcenv
                                                           uu____16923
                                                          in
                                                       [uu____16922]  in
                                                     uu____16917 ::
                                                       uu____16919
                                                      in
                                                   (bind1, uu____16916)  in
                                                 FStar_Syntax_Syntax.Tm_uinst
                                                   uu____16909
                                                  in
                                               FStar_Syntax_Syntax.mk
                                                 uu____16908
                                                in
                                             uu____16901
                                               FStar_Pervasives_Native.None
                                               rng
                                         | uu____16929 ->
                                             failwith
                                               "NIY : Reification of indexed effects"
                                          in
                                       let maybe_range_arg =
                                         let uu____16941 =
                                           FStar_Util.for_some
                                             (FStar_Syntax_Util.attr_eq
                                                FStar_Syntax_Util.dm4f_bind_range_attr)
                                             ed.FStar_Syntax_Syntax.eff_attrs
                                            in
                                         if uu____16941
                                         then
                                           let uu____16950 =
                                             let uu____16957 =
                                               FStar_Syntax_Embeddings.embed
                                                 FStar_Syntax_Embeddings.e_range
                                                 lb.FStar_Syntax_Syntax.lbpos
                                                 lb.FStar_Syntax_Syntax.lbpos
                                                in
                                             FStar_Syntax_Syntax.as_arg
                                               uu____16957
                                              in
                                           let uu____16958 =
                                             let uu____16967 =
                                               let uu____16974 =
                                                 FStar_Syntax_Embeddings.embed
                                                   FStar_Syntax_Embeddings.e_range
                                                   body2.FStar_Syntax_Syntax.pos
                                                   body2.FStar_Syntax_Syntax.pos
                                                  in
                                               FStar_Syntax_Syntax.as_arg
                                                 uu____16974
                                                in
                                             [uu____16967]  in
                                           uu____16950 :: uu____16958
                                         else []  in
                                       let reified =
                                         let uu____17003 =
                                           let uu____17010 =
                                             let uu____17011 =
                                               let uu____17026 =
                                                 let uu____17035 =
                                                   let uu____17044 =
                                                     FStar_Syntax_Syntax.as_arg
                                                       lb.FStar_Syntax_Syntax.lbtyp
                                                      in
                                                   let uu____17051 =
                                                     let uu____17060 =
                                                       FStar_Syntax_Syntax.as_arg
                                                         t
                                                        in
                                                     [uu____17060]  in
                                                   uu____17044 :: uu____17051
                                                    in
                                                 let uu____17085 =
                                                   let uu____17094 =
                                                     let uu____17103 =
                                                       FStar_Syntax_Syntax.as_arg
                                                         FStar_Syntax_Syntax.tun
                                                        in
                                                     let uu____17110 =
                                                       let uu____17119 =
                                                         FStar_Syntax_Syntax.as_arg
                                                           head4
                                                          in
                                                       let uu____17126 =
                                                         let uu____17135 =
                                                           FStar_Syntax_Syntax.as_arg
                                                             FStar_Syntax_Syntax.tun
                                                            in
                                                         let uu____17142 =
                                                           let uu____17151 =
                                                             FStar_Syntax_Syntax.as_arg
                                                               body2
                                                              in
                                                           [uu____17151]  in
                                                         uu____17135 ::
                                                           uu____17142
                                                          in
                                                       uu____17119 ::
                                                         uu____17126
                                                        in
                                                     uu____17103 ::
                                                       uu____17110
                                                      in
                                                   FStar_List.append
                                                     maybe_range_arg
                                                     uu____17094
                                                    in
                                                 FStar_List.append
                                                   uu____17035 uu____17085
                                                  in
                                               (bind_inst, uu____17026)  in
                                             FStar_Syntax_Syntax.Tm_app
                                               uu____17011
                                              in
                                           FStar_Syntax_Syntax.mk uu____17010
                                            in
                                         uu____17003
                                           FStar_Pervasives_Native.None rng
                                          in
                                       log cfg
                                         (fun uu____17217  ->
                                            let uu____17218 =
                                              FStar_Syntax_Print.term_to_string
                                                head0
                                               in
                                            let uu____17219 =
                                              FStar_Syntax_Print.term_to_string
                                                reified
                                               in
                                            FStar_Util.print2
                                              "Reified (1) <%s> to %s\n"
                                              uu____17218 uu____17219);
                                       (let uu____17220 = FStar_List.tl stack
                                           in
                                        norm cfg env uu____17220 reified)))))
                 | FStar_Syntax_Syntax.Tm_app (head_app,args) ->
                     let ed =
                       let uu____17244 =
                         FStar_TypeChecker_Env.norm_eff_name cfg.tcenv m  in
                       FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                         uu____17244
                        in
                     let uu____17245 = ed.FStar_Syntax_Syntax.bind_repr  in
                     (match uu____17245 with
                      | (uu____17246,bind_repr) ->
                          let maybe_unfold_action head4 =
                            let maybe_extract_fv t1 =
                              let t2 =
                                let uu____17283 =
                                  let uu____17284 =
                                    FStar_Syntax_Subst.compress t1  in
                                  uu____17284.FStar_Syntax_Syntax.n  in
                                match uu____17283 with
                                | FStar_Syntax_Syntax.Tm_uinst
                                    (t2,uu____17288) -> t2
                                | uu____17293 -> head4  in
                              let uu____17294 =
                                let uu____17295 =
                                  FStar_Syntax_Subst.compress t2  in
                                uu____17295.FStar_Syntax_Syntax.n  in
                              match uu____17294 with
                              | FStar_Syntax_Syntax.Tm_fvar x ->
                                  FStar_Pervasives_Native.Some x
                              | uu____17301 -> FStar_Pervasives_Native.None
                               in
                            let uu____17302 = maybe_extract_fv head4  in
                            match uu____17302 with
                            | FStar_Pervasives_Native.Some x when
                                let uu____17312 =
                                  FStar_Syntax_Syntax.lid_of_fv x  in
                                FStar_TypeChecker_Env.is_action cfg.tcenv
                                  uu____17312
                                ->
                                let head5 = norm cfg env [] head4  in
                                let action_unfolded =
                                  let uu____17317 = maybe_extract_fv head5
                                     in
                                  match uu____17317 with
                                  | FStar_Pervasives_Native.Some uu____17322
                                      -> FStar_Pervasives_Native.Some true
                                  | uu____17323 ->
                                      FStar_Pervasives_Native.Some false
                                   in
                                (head5, action_unfolded)
                            | uu____17328 ->
                                (head4, FStar_Pervasives_Native.None)
                             in
                          ((let is_arg_impure uu____17343 =
                              match uu____17343 with
                              | (e,q) ->
                                  let uu____17350 =
                                    let uu____17351 =
                                      FStar_Syntax_Subst.compress e  in
                                    uu____17351.FStar_Syntax_Syntax.n  in
                                  (match uu____17350 with
                                   | FStar_Syntax_Syntax.Tm_meta
                                       (e0,FStar_Syntax_Syntax.Meta_monadic_lift
                                        (m1,m2,t'))
                                       ->
                                       let uu____17366 =
                                         FStar_Syntax_Util.is_pure_effect m1
                                          in
                                       Prims.op_Negation uu____17366
                                   | uu____17367 -> false)
                               in
                            let uu____17368 =
                              let uu____17369 =
                                let uu____17378 =
                                  FStar_Syntax_Syntax.as_arg head_app  in
                                uu____17378 :: args  in
                              FStar_Util.for_some is_arg_impure uu____17369
                               in
                            if uu____17368
                            then
                              let uu____17397 =
                                let uu____17398 =
                                  FStar_Syntax_Print.term_to_string head3  in
                                FStar_Util.format1
                                  "Incompatibility between typechecker and normalizer; this monadic application contains impure terms %s\n"
                                  uu____17398
                                 in
                              failwith uu____17397
                            else ());
                           (let uu____17400 = maybe_unfold_action head_app
                               in
                            match uu____17400 with
                            | (head_app1,found_action) ->
                                let mk1 tm =
                                  FStar_Syntax_Syntax.mk tm
                                    FStar_Pervasives_Native.None
                                    head3.FStar_Syntax_Syntax.pos
                                   in
                                let body =
                                  mk1
                                    (FStar_Syntax_Syntax.Tm_app
                                       (head_app1, args))
                                   in
                                let body1 =
                                  match found_action with
                                  | FStar_Pervasives_Native.None  ->
                                      FStar_Syntax_Util.mk_reify body
                                  | FStar_Pervasives_Native.Some (false ) ->
                                      mk1
                                        (FStar_Syntax_Syntax.Tm_meta
                                           (body,
                                             (FStar_Syntax_Syntax.Meta_monadic
                                                (m, t))))
                                  | FStar_Pervasives_Native.Some (true ) ->
                                      body
                                   in
                                (log cfg
                                   (fun uu____17443  ->
                                      let uu____17444 =
                                        FStar_Syntax_Print.term_to_string
                                          head0
                                         in
                                      let uu____17445 =
                                        FStar_Syntax_Print.term_to_string
                                          body1
                                         in
                                      FStar_Util.print2
                                        "Reified (2) <%s> to %s\n"
                                        uu____17444 uu____17445);
                                 (let uu____17446 = FStar_List.tl stack  in
                                  norm cfg env uu____17446 body1)))))
                 | FStar_Syntax_Syntax.Tm_meta
                     (e,FStar_Syntax_Syntax.Meta_monadic uu____17448) ->
                     do_reify_monadic fallback cfg env stack e m t
                 | FStar_Syntax_Syntax.Tm_meta
                     (e,FStar_Syntax_Syntax.Meta_monadic_lift (msrc,mtgt,t'))
                     ->
                     let lifted =
                       let uu____17472 = closure_as_term cfg env t'  in
                       reify_lift cfg e msrc mtgt uu____17472  in
                     (log cfg
                        (fun uu____17476  ->
                           let uu____17477 =
                             FStar_Syntax_Print.term_to_string lifted  in
                           FStar_Util.print1 "Reified lift to (2): %s\n"
                             uu____17477);
                      (let uu____17478 = FStar_List.tl stack  in
                       norm cfg env uu____17478 lifted))
                 | FStar_Syntax_Syntax.Tm_match (e,branches) ->
                     let branches1 =
                       FStar_All.pipe_right branches
                         (FStar_List.map
                            (fun uu____17599  ->
                               match uu____17599 with
                               | (pat,wopt,tm) ->
                                   let uu____17647 =
                                     FStar_Syntax_Util.mk_reify tm  in
                                   (pat, wopt, uu____17647)))
                        in
                     let tm =
                       mk (FStar_Syntax_Syntax.Tm_match (e, branches1))
                         head3.FStar_Syntax_Syntax.pos
                        in
                     let uu____17679 = FStar_List.tl stack  in
                     norm cfg env uu____17679 tm
                 | uu____17680 -> fallback ())

and (reify_lift :
  cfg ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.monad_name ->
        FStar_Syntax_Syntax.monad_name ->
          FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun e  ->
      fun msrc  ->
        fun mtgt  ->
          fun t  ->
            let env = cfg.tcenv  in
            log cfg
              (fun uu____17694  ->
                 let uu____17695 = FStar_Ident.string_of_lid msrc  in
                 let uu____17696 = FStar_Ident.string_of_lid mtgt  in
                 let uu____17697 = FStar_Syntax_Print.term_to_string e  in
                 FStar_Util.print3 "Reifying lift %s -> %s: %s\n" uu____17695
                   uu____17696 uu____17697);
            (let uu____17698 =
               (FStar_Syntax_Util.is_pure_effect msrc) ||
                 (FStar_Syntax_Util.is_div_effect msrc)
                in
             if uu____17698
             then
               let ed =
                 let uu____17700 =
                   FStar_TypeChecker_Env.norm_eff_name cfg.tcenv mtgt  in
                 FStar_TypeChecker_Env.get_effect_decl env uu____17700  in
               let uu____17701 = ed.FStar_Syntax_Syntax.return_repr  in
               match uu____17701 with
               | (uu____17702,return_repr) ->
                   let return_inst =
                     let uu____17715 =
                       let uu____17716 =
                         FStar_Syntax_Subst.compress return_repr  in
                       uu____17716.FStar_Syntax_Syntax.n  in
                     match uu____17715 with
                     | FStar_Syntax_Syntax.Tm_uinst
                         (return_tm,uu____17722::[]) ->
                         let uu____17727 =
                           let uu____17734 =
                             let uu____17735 =
                               let uu____17742 =
                                 let uu____17743 =
                                   env.FStar_TypeChecker_Env.universe_of env
                                     t
                                    in
                                 [uu____17743]  in
                               (return_tm, uu____17742)  in
                             FStar_Syntax_Syntax.Tm_uinst uu____17735  in
                           FStar_Syntax_Syntax.mk uu____17734  in
                         uu____17727 FStar_Pervasives_Native.None
                           e.FStar_Syntax_Syntax.pos
                     | uu____17749 ->
                         failwith "NIY : Reification of indexed effects"
                      in
                   let uu____17752 =
                     let uu____17759 =
                       let uu____17760 =
                         let uu____17775 =
                           let uu____17784 = FStar_Syntax_Syntax.as_arg t  in
                           let uu____17791 =
                             let uu____17800 = FStar_Syntax_Syntax.as_arg e
                                in
                             [uu____17800]  in
                           uu____17784 :: uu____17791  in
                         (return_inst, uu____17775)  in
                       FStar_Syntax_Syntax.Tm_app uu____17760  in
                     FStar_Syntax_Syntax.mk uu____17759  in
                   uu____17752 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
             else
               (let uu____17839 =
                  FStar_TypeChecker_Env.monad_leq env msrc mtgt  in
                match uu____17839 with
                | FStar_Pervasives_Native.None  ->
                    let uu____17842 =
                      let uu____17843 = FStar_Ident.text_of_lid msrc  in
                      let uu____17844 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a lift between unrelated effects (%s and %s)"
                        uu____17843 uu____17844
                       in
                    failwith uu____17842
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____17845;
                      FStar_TypeChecker_Env.mtarget = uu____17846;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____17847;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.None ;_};_}
                    ->
                    let uu____17869 =
                      let uu____17870 = FStar_Ident.text_of_lid msrc  in
                      let uu____17871 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a non-reifiable lift (from %s to %s)"
                        uu____17870 uu____17871
                       in
                    failwith uu____17869
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____17872;
                      FStar_TypeChecker_Env.mtarget = uu____17873;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____17874;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.Some lift;_};_}
                    ->
                    let uu____17909 =
                      env.FStar_TypeChecker_Env.universe_of env t  in
                    let uu____17910 = FStar_Syntax_Util.mk_reify e  in
                    lift uu____17909 t FStar_Syntax_Syntax.tun uu____17910))

and (norm_pattern_args :
  cfg ->
    env ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
        FStar_Pervasives_Native.tuple2 Prims.list Prims.list ->
        (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
          FStar_Pervasives_Native.tuple2 Prims.list Prims.list)
  =
  fun cfg  ->
    fun env  ->
      fun args  ->
        FStar_All.pipe_right args
          (FStar_List.map
             (FStar_List.map
                (fun uu____17966  ->
                   match uu____17966 with
                   | (a,imp) ->
                       let uu____17977 = norm cfg env [] a  in
                       (uu____17977, imp))))

and (norm_comp :
  cfg -> env -> FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) =
  fun cfg  ->
    fun env  ->
      fun comp  ->
        log cfg
          (fun uu____17985  ->
             let uu____17986 = FStar_Syntax_Print.comp_to_string comp  in
             let uu____17987 =
               FStar_Util.string_of_int (FStar_List.length env)  in
             FStar_Util.print2 ">>> %s\nNormComp with with %s env elements"
               uu____17986 uu____17987);
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Total (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
                   let uu____18011 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _0_18  -> FStar_Pervasives_Native.Some _0_18)
                     uu____18011
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___202_18014 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Total (t1, uopt1));
               FStar_Syntax_Syntax.pos =
                 (uu___202_18014.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___202_18014.FStar_Syntax_Syntax.vars)
             }
         | FStar_Syntax_Syntax.GTotal (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
                   let uu____18036 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _0_19  -> FStar_Pervasives_Native.Some _0_19)
                     uu____18036
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___203_18039 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.GTotal (t1, uopt1));
               FStar_Syntax_Syntax.pos =
                 (uu___203_18039.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___203_18039.FStar_Syntax_Syntax.vars)
             }
         | FStar_Syntax_Syntax.Comp ct ->
             let norm_args =
               FStar_List.mapi
                 (fun idx  ->
                    fun uu____18076  ->
                      match uu____18076 with
                      | (a,i) ->
                          let uu____18087 = norm cfg env [] a  in
                          (uu____18087, i))
                in
             let effect_args = norm_args ct.FStar_Syntax_Syntax.effect_args
                in
             let flags1 =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
                 (FStar_List.map
                    (fun uu___116_18105  ->
                       match uu___116_18105 with
                       | FStar_Syntax_Syntax.DECREASES t ->
                           let uu____18109 = norm cfg env [] t  in
                           FStar_Syntax_Syntax.DECREASES uu____18109
                       | f -> f))
                in
             let comp_univs =
               FStar_List.map (norm_universe cfg env)
                 ct.FStar_Syntax_Syntax.comp_univs
                in
             let result_typ =
               norm cfg env [] ct.FStar_Syntax_Syntax.result_typ  in
             let uu___204_18117 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Comp
                    (let uu___205_18120 = ct  in
                     {
                       FStar_Syntax_Syntax.comp_univs = comp_univs;
                       FStar_Syntax_Syntax.effect_name =
                         (uu___205_18120.FStar_Syntax_Syntax.effect_name);
                       FStar_Syntax_Syntax.result_typ = result_typ;
                       FStar_Syntax_Syntax.effect_args = effect_args;
                       FStar_Syntax_Syntax.flags = flags1
                     }));
               FStar_Syntax_Syntax.pos =
                 (uu___204_18117.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___204_18117.FStar_Syntax_Syntax.vars)
             })

and (norm_binder :
  cfg -> env -> FStar_Syntax_Syntax.binder -> FStar_Syntax_Syntax.binder) =
  fun cfg  ->
    fun env  ->
      fun uu____18123  ->
        match uu____18123 with
        | (x,imp) ->
            let uu____18126 =
              let uu___206_18127 = x  in
              let uu____18128 = norm cfg env [] x.FStar_Syntax_Syntax.sort
                 in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___206_18127.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___206_18127.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = uu____18128
              }  in
            (uu____18126, imp)

and (norm_binders :
  cfg -> env -> FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders) =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____18134 =
          FStar_List.fold_left
            (fun uu____18168  ->
               fun b  ->
                 match uu____18168 with
                 | (nbs',env1) ->
                     let b1 = norm_binder cfg env1 b  in
                     ((b1 :: nbs'), (dummy :: env1))) ([], env) bs
           in
        match uu____18134 with | (nbs,uu____18248) -> FStar_List.rev nbs

and (norm_lcomp_opt :
  cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags1 =
              filter_out_lcomp_cflags rc.FStar_Syntax_Syntax.residual_flags
               in
            let uu____18280 =
              let uu___207_18281 = rc  in
              let uu____18282 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (norm cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___207_18281.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____18282;
                FStar_Syntax_Syntax.residual_flags =
                  (uu___207_18281.FStar_Syntax_Syntax.residual_flags)
              }  in
            FStar_Pervasives_Native.Some uu____18280
        | uu____18291 -> lopt

and (maybe_simplify :
  cfg ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option,
      closure) FStar_Pervasives_Native.tuple2 Prims.list ->
      stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm' = maybe_simplify_aux cfg env stack tm  in
          if (cfg.debug).b380
          then
            (let uu____18312 = FStar_Syntax_Print.term_to_string tm  in
             let uu____18313 = FStar_Syntax_Print.term_to_string tm'  in
             FStar_Util.print3 "%sSimplified\n\t%s to\n\t%s\n"
               (if (cfg.steps).simplify then "" else "NOT ") uu____18312
               uu____18313)
          else ();
          tm'

and (maybe_simplify_aux :
  cfg ->
    ((FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
       FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option,
      closure) FStar_Pervasives_Native.tuple2 Prims.list ->
      stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm1 = reduce_primops cfg env stack tm  in
          let uu____18335 =
            FStar_All.pipe_left Prims.op_Negation (cfg.steps).simplify  in
          if uu____18335
          then tm1
          else
            (let w t =
               let uu___208_18349 = t  in
               {
                 FStar_Syntax_Syntax.n =
                   (uu___208_18349.FStar_Syntax_Syntax.n);
                 FStar_Syntax_Syntax.pos = (tm1.FStar_Syntax_Syntax.pos);
                 FStar_Syntax_Syntax.vars =
                   (uu___208_18349.FStar_Syntax_Syntax.vars)
               }  in
             let simp_t t =
               let uu____18360 =
                 let uu____18361 = FStar_Syntax_Util.unmeta t  in
                 uu____18361.FStar_Syntax_Syntax.n  in
               match uu____18360 with
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.true_lid
                   -> FStar_Pervasives_Native.Some true
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.false_lid
                   -> FStar_Pervasives_Native.Some false
               | uu____18368 -> FStar_Pervasives_Native.None  in
             let rec args_are_binders args bs =
               match (args, bs) with
               | ((t,uu____18417)::args1,(bv,uu____18420)::bs1) ->
                   let uu____18454 =
                     let uu____18455 = FStar_Syntax_Subst.compress t  in
                     uu____18455.FStar_Syntax_Syntax.n  in
                   (match uu____18454 with
                    | FStar_Syntax_Syntax.Tm_name bv' ->
                        (FStar_Syntax_Syntax.bv_eq bv bv') &&
                          (args_are_binders args1 bs1)
                    | uu____18459 -> false)
               | ([],[]) -> true
               | (uu____18480,uu____18481) -> false  in
             let is_applied bs t =
               if (cfg.debug).wpe
               then
                 (let uu____18522 = FStar_Syntax_Print.term_to_string t  in
                  let uu____18523 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2 "WPE> is_applied %s -- %s\n" uu____18522
                    uu____18523)
               else ();
               (let uu____18525 = FStar_Syntax_Util.head_and_args' t  in
                match uu____18525 with
                | (hd1,args) ->
                    let uu____18558 =
                      let uu____18559 = FStar_Syntax_Subst.compress hd1  in
                      uu____18559.FStar_Syntax_Syntax.n  in
                    (match uu____18558 with
                     | FStar_Syntax_Syntax.Tm_name bv when
                         args_are_binders args bs ->
                         (if (cfg.debug).wpe
                          then
                            (let uu____18566 =
                               FStar_Syntax_Print.term_to_string t  in
                             let uu____18567 =
                               FStar_Syntax_Print.bv_to_string bv  in
                             let uu____18568 =
                               FStar_Syntax_Print.term_to_string hd1  in
                             FStar_Util.print3
                               "WPE> got it\n>>>>top = %s\n>>>>b = %s\n>>>>hd = %s\n"
                               uu____18566 uu____18567 uu____18568)
                          else ();
                          FStar_Pervasives_Native.Some bv)
                     | uu____18570 -> FStar_Pervasives_Native.None))
                in
             let is_applied_maybe_squashed bs t =
               if (cfg.debug).wpe
               then
                 (let uu____18587 = FStar_Syntax_Print.term_to_string t  in
                  let uu____18588 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2
                    "WPE> is_applied_maybe_squashed %s -- %s\n" uu____18587
                    uu____18588)
               else ();
               (let uu____18590 = FStar_Syntax_Util.is_squash t  in
                match uu____18590 with
                | FStar_Pervasives_Native.Some (uu____18601,t') ->
                    is_applied bs t'
                | uu____18613 ->
                    let uu____18622 = FStar_Syntax_Util.is_auto_squash t  in
                    (match uu____18622 with
                     | FStar_Pervasives_Native.Some (uu____18633,t') ->
                         is_applied bs t'
                     | uu____18645 -> is_applied bs t))
                in
             let is_quantified_const bv phi =
               let uu____18669 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____18669 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
                   (lid,(p,uu____18676)::(q,uu____18678)::[])) when
                   FStar_Ident.lid_equals lid FStar_Parser_Const.imp_lid ->
                   (if (cfg.debug).wpe
                    then
                      (let uu____18706 = FStar_Syntax_Print.term_to_string p
                          in
                       let uu____18707 = FStar_Syntax_Print.term_to_string q
                          in
                       FStar_Util.print2 "WPE> p = (%s); q = (%s)\n"
                         uu____18706 uu____18707)
                    else ();
                    (let uu____18709 =
                       FStar_Syntax_Util.destruct_typ_as_formula p  in
                     match uu____18709 with
                     | FStar_Pervasives_Native.None  ->
                         let uu____18714 =
                           let uu____18715 = FStar_Syntax_Subst.compress p
                              in
                           uu____18715.FStar_Syntax_Syntax.n  in
                         (match uu____18714 with
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if (cfg.debug).wpe
                               then FStar_Util.print_string "WPE> Case 1\n"
                               else ();
                               (let uu____18723 =
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_true)] q
                                   in
                                FStar_Pervasives_Native.Some uu____18723))
                          | uu____18726 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some
                         (FStar_Syntax_Util.BaseConn
                         (lid1,(p1,uu____18729)::[])) when
                         FStar_Ident.lid_equals lid1
                           FStar_Parser_Const.not_lid
                         ->
                         let uu____18746 =
                           let uu____18747 = FStar_Syntax_Subst.compress p1
                              in
                           uu____18747.FStar_Syntax_Syntax.n  in
                         (match uu____18746 with
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if (cfg.debug).wpe
                               then FStar_Util.print_string "WPE> Case 2\n"
                               else ();
                               (let uu____18755 =
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_false)] q
                                   in
                                FStar_Pervasives_Native.Some uu____18755))
                          | uu____18758 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                         (bs,pats,phi1)) ->
                         let uu____18762 =
                           FStar_Syntax_Util.destruct_typ_as_formula phi1  in
                         (match uu____18762 with
                          | FStar_Pervasives_Native.None  ->
                              let uu____18767 =
                                is_applied_maybe_squashed bs phi1  in
                              (match uu____18767 with
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if (cfg.debug).wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 3\n"
                                    else ();
                                    (let ftrue =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_true
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
                                     let uu____18778 =
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ftrue)]
                                         q
                                        in
                                     FStar_Pervasives_Native.Some uu____18778))
                               | uu____18781 -> FStar_Pervasives_Native.None)
                          | FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.BaseConn
                              (lid1,(p1,uu____18786)::[])) when
                              FStar_Ident.lid_equals lid1
                                FStar_Parser_Const.not_lid
                              ->
                              let uu____18803 =
                                is_applied_maybe_squashed bs p1  in
                              (match uu____18803 with
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if (cfg.debug).wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 4\n"
                                    else ();
                                    (let ffalse =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_false
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
                                     let uu____18814 =
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ffalse)]
                                         q
                                        in
                                     FStar_Pervasives_Native.Some uu____18814))
                               | uu____18817 -> FStar_Pervasives_Native.None)
                          | uu____18820 -> FStar_Pervasives_Native.None)
                     | uu____18823 -> FStar_Pervasives_Native.None))
               | uu____18826 -> FStar_Pervasives_Native.None  in
             let is_forall_const phi =
               let uu____18839 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____18839 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                   ((bv,uu____18845)::[],uu____18846,phi')) ->
                   (if (cfg.debug).wpe
                    then
                      (let uu____18857 = FStar_Syntax_Print.bv_to_string bv
                          in
                       let uu____18858 =
                         FStar_Syntax_Print.term_to_string phi'  in
                       FStar_Util.print2 "WPE> QAll [%s] %s\n" uu____18857
                         uu____18858)
                    else ();
                    is_quantified_const bv phi')
               | uu____18860 -> FStar_Pervasives_Native.None  in
             let is_const_match phi =
               let uu____18873 =
                 let uu____18874 = FStar_Syntax_Subst.compress phi  in
                 uu____18874.FStar_Syntax_Syntax.n  in
               match uu____18873 with
               | FStar_Syntax_Syntax.Tm_match (uu____18879,br::brs) ->
                   let uu____18946 = br  in
                   (match uu____18946 with
                    | (uu____18963,uu____18964,e) ->
                        let r =
                          let uu____18985 = simp_t e  in
                          match uu____18985 with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Pervasives_Native.None
                          | FStar_Pervasives_Native.Some b ->
                              let uu____18991 =
                                FStar_List.for_all
                                  (fun uu____19009  ->
                                     match uu____19009 with
                                     | (uu____19022,uu____19023,e') ->
                                         let uu____19037 = simp_t e'  in
                                         uu____19037 =
                                           (FStar_Pervasives_Native.Some b))
                                  brs
                                 in
                              if uu____18991
                              then FStar_Pervasives_Native.Some b
                              else FStar_Pervasives_Native.None
                           in
                        r)
               | uu____19045 -> FStar_Pervasives_Native.None  in
             let maybe_auto_squash t =
               let uu____19054 = FStar_Syntax_Util.is_sub_singleton t  in
               if uu____19054
               then t
               else
                 FStar_Syntax_Util.mk_auto_squash FStar_Syntax_Syntax.U_zero
                   t
                in
             let squashed_head_un_auto_squash_args t =
               let maybe_un_auto_squash_arg uu____19085 =
                 match uu____19085 with
                 | (t1,q) ->
                     let uu____19098 = FStar_Syntax_Util.is_auto_squash t1
                        in
                     (match uu____19098 with
                      | FStar_Pervasives_Native.Some
                          (FStar_Syntax_Syntax.U_zero ,t2) -> (t2, q)
                      | uu____19126 -> (t1, q))
                  in
               let uu____19137 = FStar_Syntax_Util.head_and_args t  in
               match uu____19137 with
               | (head1,args) ->
                   let args1 = FStar_List.map maybe_un_auto_squash_arg args
                      in
                   FStar_Syntax_Syntax.mk_Tm_app head1 args1
                     FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
                in
             let rec clearly_inhabited ty =
               let uu____19203 =
                 let uu____19204 = FStar_Syntax_Util.unmeta ty  in
                 uu____19204.FStar_Syntax_Syntax.n  in
               match uu____19203 with
               | FStar_Syntax_Syntax.Tm_uinst (t,uu____19208) ->
                   clearly_inhabited t
               | FStar_Syntax_Syntax.Tm_arrow (uu____19213,c) ->
                   clearly_inhabited (FStar_Syntax_Util.comp_result c)
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   let l = FStar_Syntax_Syntax.lid_of_fv fv  in
                   (((FStar_Ident.lid_equals l FStar_Parser_Const.int_lid) ||
                       (FStar_Ident.lid_equals l FStar_Parser_Const.bool_lid))
                      ||
                      (FStar_Ident.lid_equals l FStar_Parser_Const.string_lid))
                     || (FStar_Ident.lid_equals l FStar_Parser_Const.exn_lid)
               | uu____19233 -> false  in
             let simplify1 arg =
               let uu____19258 = simp_t (FStar_Pervasives_Native.fst arg)  in
               (uu____19258, arg)  in
             let uu____19267 = is_forall_const tm1  in
             match uu____19267 with
             | FStar_Pervasives_Native.Some tm' ->
                 (if (cfg.debug).wpe
                  then
                    (let uu____19272 = FStar_Syntax_Print.term_to_string tm1
                        in
                     let uu____19273 = FStar_Syntax_Print.term_to_string tm'
                        in
                     FStar_Util.print2 "WPE> %s ~> %s\n" uu____19272
                       uu____19273)
                  else ();
                  (let uu____19275 = norm cfg env [] tm'  in
                   maybe_simplify_aux cfg env stack uu____19275))
             | FStar_Pervasives_Native.None  ->
                 let uu____19276 =
                   let uu____19277 = FStar_Syntax_Subst.compress tm1  in
                   uu____19277.FStar_Syntax_Syntax.n  in
                 (match uu____19276 with
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst
                           ({
                              FStar_Syntax_Syntax.n =
                                FStar_Syntax_Syntax.Tm_fvar fv;
                              FStar_Syntax_Syntax.pos = uu____19281;
                              FStar_Syntax_Syntax.vars = uu____19282;_},uu____19283);
                         FStar_Syntax_Syntax.pos = uu____19284;
                         FStar_Syntax_Syntax.vars = uu____19285;_},args)
                      ->
                      let uu____19311 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____19311
                      then
                        let uu____19312 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____19312 with
                         | (FStar_Pervasives_Native.Some (true ),uu____19357)::
                             (uu____19358,(arg,uu____19360))::[] ->
                             maybe_auto_squash arg
                         | (uu____19409,(arg,uu____19411))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____19412)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____19461)::uu____19462::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____19513::(FStar_Pervasives_Native.Some (false
                                         ),uu____19514)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____19565 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____19579 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____19579
                         then
                           let uu____19580 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____19580 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____19625)::uu____19626::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____19677::(FStar_Pervasives_Native.Some (true
                                           ),uu____19678)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____19729)::(uu____19730,(arg,uu____19732))::[]
                               -> maybe_auto_squash arg
                           | (uu____19781,(arg,uu____19783))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____19784)::[]
                               -> maybe_auto_squash arg
                           | uu____19833 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____19847 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____19847
                            then
                              let uu____19848 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____19848 with
                              | uu____19893::(FStar_Pervasives_Native.Some
                                              (true ),uu____19894)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____19945)::uu____19946::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____19997)::(uu____19998,(arg,uu____20000))::[]
                                  -> maybe_auto_squash arg
                              | (uu____20049,(p,uu____20051))::(uu____20052,
                                                                (q,uu____20054))::[]
                                  ->
                                  let uu____20101 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____20101
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____20103 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____20117 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____20117
                               then
                                 let uu____20118 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____20118 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____20163)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____20164)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____20215)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____20216)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____20267)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____20268)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____20319)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____20320)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____20371,(arg,uu____20373))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____20374)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____20423)::(uu____20424,(arg,uu____20426))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____20475,(arg,uu____20477))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____20478)::[]
                                     ->
                                     let uu____20527 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____20527
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____20528)::(uu____20529,(arg,uu____20531))::[]
                                     ->
                                     let uu____20580 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____20580
                                 | (uu____20581,(p,uu____20583))::(uu____20584,
                                                                   (q,uu____20586))::[]
                                     ->
                                     let uu____20633 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____20633
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____20635 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____20649 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____20649
                                  then
                                    let uu____20650 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____20650 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____20695)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____20726)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____20757 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____20771 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____20771
                                     then
                                       match args with
                                       | (t,uu____20773)::[] ->
                                           let uu____20790 =
                                             let uu____20791 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____20791.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____20790 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____20794::[],body,uu____20796)
                                                ->
                                                let uu____20823 = simp_t body
                                                   in
                                                (match uu____20823 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | uu____20826 -> tm1)
                                            | uu____20829 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____20831))::(t,uu____20833)::[]
                                           ->
                                           let uu____20860 =
                                             let uu____20861 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____20861.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____20860 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____20864::[],body,uu____20866)
                                                ->
                                                let uu____20893 = simp_t body
                                                   in
                                                (match uu____20893 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
                                                 | uu____20896 -> tm1)
                                            | uu____20899 -> tm1)
                                       | uu____20900 -> tm1
                                     else
                                       (let uu____20910 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____20910
                                        then
                                          match args with
                                          | (t,uu____20912)::[] ->
                                              let uu____20929 =
                                                let uu____20930 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____20930.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____20929 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____20933::[],body,uu____20935)
                                                   ->
                                                   let uu____20962 =
                                                     simp_t body  in
                                                   (match uu____20962 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | uu____20965 -> tm1)
                                               | uu____20968 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____20970))::(t,uu____20972)::[]
                                              ->
                                              let uu____20999 =
                                                let uu____21000 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____21000.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____20999 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____21003::[],body,uu____21005)
                                                   ->
                                                   let uu____21032 =
                                                     simp_t body  in
                                                   (match uu____21032 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
                                                    | uu____21035 -> tm1)
                                               | uu____21038 -> tm1)
                                          | uu____21039 -> tm1
                                        else
                                          (let uu____21049 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____21049
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____21050;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____21051;_},uu____21052)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____21069;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____21070;_},uu____21071)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____21088 -> tm1
                                           else
                                             (let uu____21098 =
                                                FStar_Syntax_Util.is_auto_squash
                                                  tm1
                                                 in
                                              match uu____21098 with
                                              | FStar_Pervasives_Native.Some
                                                  (FStar_Syntax_Syntax.U_zero
                                                   ,t)
                                                  when
                                                  FStar_Syntax_Util.is_sub_singleton
                                                    t
                                                  -> t
                                              | uu____21118 ->
                                                  reduce_equality cfg env
                                                    stack tm1))))))))
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                           fv;
                         FStar_Syntax_Syntax.pos = uu____21128;
                         FStar_Syntax_Syntax.vars = uu____21129;_},args)
                      ->
                      let uu____21151 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____21151
                      then
                        let uu____21152 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____21152 with
                         | (FStar_Pervasives_Native.Some (true ),uu____21197)::
                             (uu____21198,(arg,uu____21200))::[] ->
                             maybe_auto_squash arg
                         | (uu____21249,(arg,uu____21251))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____21252)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____21301)::uu____21302::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____21353::(FStar_Pervasives_Native.Some (false
                                         ),uu____21354)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____21405 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____21419 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____21419
                         then
                           let uu____21420 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____21420 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____21465)::uu____21466::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____21517::(FStar_Pervasives_Native.Some (true
                                           ),uu____21518)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____21569)::(uu____21570,(arg,uu____21572))::[]
                               -> maybe_auto_squash arg
                           | (uu____21621,(arg,uu____21623))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____21624)::[]
                               -> maybe_auto_squash arg
                           | uu____21673 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____21687 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____21687
                            then
                              let uu____21688 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____21688 with
                              | uu____21733::(FStar_Pervasives_Native.Some
                                              (true ),uu____21734)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____21785)::uu____21786::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____21837)::(uu____21838,(arg,uu____21840))::[]
                                  -> maybe_auto_squash arg
                              | (uu____21889,(p,uu____21891))::(uu____21892,
                                                                (q,uu____21894))::[]
                                  ->
                                  let uu____21941 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____21941
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____21943 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____21957 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____21957
                               then
                                 let uu____21958 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____21958 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____22003)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____22004)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____22055)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____22056)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____22107)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____22108)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____22159)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____22160)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____22211,(arg,uu____22213))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____22214)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____22263)::(uu____22264,(arg,uu____22266))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____22315,(arg,uu____22317))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____22318)::[]
                                     ->
                                     let uu____22367 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____22367
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____22368)::(uu____22369,(arg,uu____22371))::[]
                                     ->
                                     let uu____22420 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____22420
                                 | (uu____22421,(p,uu____22423))::(uu____22424,
                                                                   (q,uu____22426))::[]
                                     ->
                                     let uu____22473 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____22473
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____22475 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____22489 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____22489
                                  then
                                    let uu____22490 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____22490 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____22535)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____22566)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____22597 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____22611 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____22611
                                     then
                                       match args with
                                       | (t,uu____22613)::[] ->
                                           let uu____22630 =
                                             let uu____22631 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22631.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22630 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22634::[],body,uu____22636)
                                                ->
                                                let uu____22663 = simp_t body
                                                   in
                                                (match uu____22663 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | uu____22666 -> tm1)
                                            | uu____22669 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____22671))::(t,uu____22673)::[]
                                           ->
                                           let uu____22700 =
                                             let uu____22701 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22701.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22700 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22704::[],body,uu____22706)
                                                ->
                                                let uu____22733 = simp_t body
                                                   in
                                                (match uu____22733 with
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
                                                 | uu____22736 -> tm1)
                                            | uu____22739 -> tm1)
                                       | uu____22740 -> tm1
                                     else
                                       (let uu____22750 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____22750
                                        then
                                          match args with
                                          | (t,uu____22752)::[] ->
                                              let uu____22769 =
                                                let uu____22770 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22770.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22769 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22773::[],body,uu____22775)
                                                   ->
                                                   let uu____22802 =
                                                     simp_t body  in
                                                   (match uu____22802 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | uu____22805 -> tm1)
                                               | uu____22808 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____22810))::(t,uu____22812)::[]
                                              ->
                                              let uu____22839 =
                                                let uu____22840 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22840.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22839 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22843::[],body,uu____22845)
                                                   ->
                                                   let uu____22872 =
                                                     simp_t body  in
                                                   (match uu____22872 with
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
                                                    | uu____22875 -> tm1)
                                               | uu____22878 -> tm1)
                                          | uu____22879 -> tm1
                                        else
                                          (let uu____22889 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____22889
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____22890;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22891;_},uu____22892)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____22909;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22910;_},uu____22911)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____22928 -> tm1
                                           else
                                             (let uu____22938 =
                                                FStar_Syntax_Util.is_auto_squash
                                                  tm1
                                                 in
                                              match uu____22938 with
                                              | FStar_Pervasives_Native.Some
                                                  (FStar_Syntax_Syntax.U_zero
                                                   ,t)
                                                  when
                                                  FStar_Syntax_Util.is_sub_singleton
                                                    t
                                                  -> t
                                              | uu____22958 ->
                                                  reduce_equality cfg env
                                                    stack tm1))))))))
                  | FStar_Syntax_Syntax.Tm_refine (bv,t) ->
                      let uu____22973 = simp_t t  in
                      (match uu____22973 with
                       | FStar_Pervasives_Native.Some (true ) ->
                           bv.FStar_Syntax_Syntax.sort
                       | FStar_Pervasives_Native.Some (false ) -> tm1
                       | FStar_Pervasives_Native.None  -> tm1)
                  | FStar_Syntax_Syntax.Tm_match uu____22976 ->
                      let uu____22999 = is_const_match tm1  in
                      (match uu____22999 with
                       | FStar_Pervasives_Native.Some (true ) ->
                           w FStar_Syntax_Util.t_true
                       | FStar_Pervasives_Native.Some (false ) ->
                           w FStar_Syntax_Util.t_false
                       | FStar_Pervasives_Native.None  -> tm1)
                  | uu____23002 -> tm1))

and (rebuild :
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          log cfg
            (fun uu____23012  ->
               (let uu____23014 = FStar_Syntax_Print.tag_of_term t  in
                let uu____23015 = FStar_Syntax_Print.term_to_string t  in
                let uu____23016 =
                  FStar_Util.string_of_int (FStar_List.length env)  in
                let uu____23023 =
                  let uu____23024 =
                    let uu____23027 = firstn (Prims.parse_int "4") stack  in
                    FStar_All.pipe_left FStar_Pervasives_Native.fst
                      uu____23027
                     in
                  stack_to_string uu____23024  in
                FStar_Util.print4
                  ">>> %s\nRebuild %s with %s env elements and top of the stack %s \n"
                  uu____23014 uu____23015 uu____23016 uu____23023);
               (let uu____23050 =
                  FStar_TypeChecker_Env.debug cfg.tcenv
                    (FStar_Options.Other "NormRebuild")
                   in
                if uu____23050
                then
                  let uu____23051 = FStar_Syntax_Util.unbound_variables t  in
                  match uu____23051 with
                  | [] -> ()
                  | bvs ->
                      ((let uu____23058 = FStar_Syntax_Print.tag_of_term t
                           in
                        let uu____23059 = FStar_Syntax_Print.term_to_string t
                           in
                        let uu____23060 =
                          let uu____23061 =
                            FStar_All.pipe_right bvs
                              (FStar_List.map FStar_Syntax_Print.bv_to_string)
                             in
                          FStar_All.pipe_right uu____23061
                            (FStar_String.concat ", ")
                           in
                        FStar_Util.print3
                          "!!! Rebuild (%s) %s, free vars=%s\n" uu____23058
                          uu____23059 uu____23060);
                       failwith "DIE!")
                else ()));
          (let t1 = maybe_simplify cfg env stack t  in
           match stack with
           | [] -> t1
           | (Debug (tm,time_then))::stack1 ->
               (if (cfg.debug).print_normalized
                then
                  (let time_now = FStar_Util.now ()  in
                   let uu____23079 =
                     let uu____23080 =
                       let uu____23081 =
                         FStar_Util.time_diff time_then time_now  in
                       FStar_Pervasives_Native.snd uu____23081  in
                     FStar_Util.string_of_int uu____23080  in
                   let uu____23086 = FStar_Syntax_Print.term_to_string tm  in
                   let uu____23087 = FStar_Syntax_Print.term_to_string t1  in
                   FStar_Util.print3 "Normalized (%s ms) %s\n\tto %s\n"
                     uu____23079 uu____23086 uu____23087)
                else ();
                rebuild cfg env stack1 t1)
           | (Cfg cfg1)::stack1 -> rebuild cfg1 env stack1 t1
           | (Meta (uu____23093,m,r))::stack1 ->
               let t2 = mk (FStar_Syntax_Syntax.Tm_meta (t1, m)) r  in
               rebuild cfg env stack1 t2
           | (MemoLazy r)::stack1 ->
               (set_memo cfg r (env, t1);
                log cfg
                  (fun uu____23144  ->
                     let uu____23145 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 "\tSet memo %s\n" uu____23145);
                rebuild cfg env stack1 t1)
           | (Let (env',bs,lb,r))::stack1 ->
               let body = FStar_Syntax_Subst.close bs t1  in
               let t2 =
                 FStar_Syntax_Syntax.mk
                   (FStar_Syntax_Syntax.Tm_let ((false, [lb]), body))
                   FStar_Pervasives_Native.None r
                  in
               rebuild cfg env' stack1 t2
           | (Abs (env',bs,env'',lopt,r))::stack1 ->
               let bs1 = norm_binders cfg env' bs  in
               let lopt1 = norm_lcomp_opt cfg env'' lopt  in
               let uu____23183 =
                 let uu___209_23184 = FStar_Syntax_Util.abs bs1 t1 lopt1  in
                 {
                   FStar_Syntax_Syntax.n =
                     (uu___209_23184.FStar_Syntax_Syntax.n);
                   FStar_Syntax_Syntax.pos = r;
                   FStar_Syntax_Syntax.vars =
                     (uu___209_23184.FStar_Syntax_Syntax.vars)
                 }  in
               rebuild cfg env stack1 uu____23183
           | (Arg (Univ uu____23187,uu____23188,uu____23189))::uu____23190 ->
               failwith "Impossible"
           | (Arg (Dummy ,uu____23193,uu____23194))::uu____23195 ->
               failwith "Impossible"
           | (UnivArgs (us,r))::stack1 ->
               let t2 = FStar_Syntax_Syntax.mk_Tm_uinst t1 us  in
               rebuild cfg env stack1 t2
           | (Arg (Clos (env_arg,tm,uu____23210,uu____23211),aq,r))::stack1
               when
               let uu____23261 = head_of t1  in
               FStar_Syntax_Util.is_fstar_tactics_by_tactic uu____23261 ->
               let t2 =
                 let uu____23265 =
                   let uu____23270 =
                     let uu____23271 = closure_as_term cfg env_arg tm  in
                     (uu____23271, aq)  in
                   FStar_Syntax_Syntax.extend_app t1 uu____23270  in
                 uu____23265 FStar_Pervasives_Native.None r  in
               rebuild cfg env stack1 t2
           | (Arg (Clos (env_arg,tm,m,uu____23281),aq,r))::stack1 ->
               (log cfg
                  (fun uu____23334  ->
                     let uu____23335 = FStar_Syntax_Print.term_to_string tm
                        in
                     FStar_Util.print1 "Rebuilding with arg %s\n" uu____23335);
                if Prims.op_Negation (cfg.steps).iota
                then
                  (if (cfg.steps).hnf
                   then
                     let arg = closure_as_term cfg env_arg tm  in
                     let t2 =
                       FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                         FStar_Pervasives_Native.None r
                        in
                     rebuild cfg env_arg stack1 t2
                   else
                     (let stack2 = (App (env, t1, aq, r)) :: stack1  in
                      norm cfg env_arg stack2 tm))
                else
                  (let uu____23347 = FStar_ST.op_Bang m  in
                   match uu____23347 with
                   | FStar_Pervasives_Native.None  ->
                       if (cfg.steps).hnf
                       then
                         let arg = closure_as_term cfg env_arg tm  in
                         let t2 =
                           FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                             FStar_Pervasives_Native.None r
                            in
                         rebuild cfg env_arg stack1 t2
                       else
                         (let stack2 = (MemoLazy m) :: (App (env, t1, aq, r))
                            :: stack1  in
                          norm cfg env_arg stack2 tm)
                   | FStar_Pervasives_Native.Some (uu____23490,a) ->
                       let t2 =
                         FStar_Syntax_Syntax.extend_app t1 (a, aq)
                           FStar_Pervasives_Native.None r
                          in
                       rebuild cfg env_arg stack1 t2))
           | (App (env1,head1,aq,r))::stack' when should_reify cfg stack ->
               let t0 = t1  in
               let fallback msg uu____23543 =
                 log cfg
                   (fun uu____23547  ->
                      let uu____23548 = FStar_Syntax_Print.term_to_string t1
                         in
                      FStar_Util.print2 "Not reifying%s: %s\n" msg
                        uu____23548);
                 (let t2 =
                    FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                      FStar_Pervasives_Native.None r
                     in
                  rebuild cfg env1 stack' t2)
                  in
               let uu____23554 =
                 let uu____23555 = FStar_Syntax_Subst.compress t1  in
                 uu____23555.FStar_Syntax_Syntax.n  in
               (match uu____23554 with
                | FStar_Syntax_Syntax.Tm_meta
                    (t2,FStar_Syntax_Syntax.Meta_monadic (m,ty)) ->
                    do_reify_monadic (fallback " (1)") cfg env1 stack t2 m ty
                | FStar_Syntax_Syntax.Tm_meta
                    (t2,FStar_Syntax_Syntax.Meta_monadic_lift (msrc,mtgt,ty))
                    ->
                    let lifted =
                      let uu____23582 = closure_as_term cfg env1 ty  in
                      reify_lift cfg t2 msrc mtgt uu____23582  in
                    (log cfg
                       (fun uu____23586  ->
                          let uu____23587 =
                            FStar_Syntax_Print.term_to_string lifted  in
                          FStar_Util.print1 "Reified lift to (1): %s\n"
                            uu____23587);
                     (let uu____23588 = FStar_List.tl stack  in
                      norm cfg env1 uu____23588 lifted))
                | FStar_Syntax_Syntax.Tm_app
                    ({
                       FStar_Syntax_Syntax.n =
                         FStar_Syntax_Syntax.Tm_constant
                         (FStar_Const.Const_reflect uu____23589);
                       FStar_Syntax_Syntax.pos = uu____23590;
                       FStar_Syntax_Syntax.vars = uu____23591;_},(e,uu____23593)::[])
                    -> norm cfg env1 stack' e
                | FStar_Syntax_Syntax.Tm_app uu____23622 when
                    (cfg.steps).primops ->
                    let uu____23637 = FStar_Syntax_Util.head_and_args t1  in
                    (match uu____23637 with
                     | (hd1,args) ->
                         let uu____23674 =
                           let uu____23675 = FStar_Syntax_Util.un_uinst hd1
                              in
                           uu____23675.FStar_Syntax_Syntax.n  in
                         (match uu____23674 with
                          | FStar_Syntax_Syntax.Tm_fvar fv ->
                              let uu____23679 = find_prim_step cfg fv  in
                              (match uu____23679 with
                               | FStar_Pervasives_Native.Some
                                   { name = uu____23682; arity = uu____23683;
                                     auto_reflect =
                                       FStar_Pervasives_Native.Some n1;
                                     strong_reduction_ok = uu____23685;
                                     requires_binder_substitution =
                                       uu____23686;
                                     interpretation = uu____23687;_}
                                   when (FStar_List.length args) = n1 ->
                                   norm cfg env1 stack' t1
                               | uu____23702 -> fallback " (3)" ())
                          | uu____23705 -> fallback " (4)" ()))
                | uu____23706 -> fallback " (2)" ())
           | (App (env1,head1,aq,r))::stack1 ->
               let t2 =
                 FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                   FStar_Pervasives_Native.None r
                  in
               rebuild cfg env1 stack1 t2
           | (Match (env',branches,cfg1,r))::stack1 ->
               (log cfg1
                  (fun uu____23729  ->
                     let uu____23730 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1
                       "Rebuilding with match, scrutinee is %s ...\n"
                       uu____23730);
                (let scrutinee_env = env  in
                 let env1 = env'  in
                 let scrutinee = t1  in
                 let norm_and_rebuild_match uu____23739 =
                   log cfg1
                     (fun uu____23744  ->
                        let uu____23745 =
                          FStar_Syntax_Print.term_to_string scrutinee  in
                        let uu____23746 =
                          let uu____23747 =
                            FStar_All.pipe_right branches
                              (FStar_List.map
                                 (fun uu____23774  ->
                                    match uu____23774 with
                                    | (p,uu____23784,uu____23785) ->
                                        FStar_Syntax_Print.pat_to_string p))
                             in
                          FStar_All.pipe_right uu____23747
                            (FStar_String.concat "\n\t")
                           in
                        FStar_Util.print2
                          "match is irreducible: scrutinee=%s\nbranches=%s\n"
                          uu____23745 uu____23746);
                   (let whnf = (cfg1.steps).weak || (cfg1.steps).hnf  in
                    let cfg_exclude_zeta =
                      let new_delta =
                        FStar_All.pipe_right cfg1.delta_level
                          (FStar_List.filter
                             (fun uu___117_23802  ->
                                match uu___117_23802 with
                                | FStar_TypeChecker_Env.Inlining  -> true
                                | FStar_TypeChecker_Env.Eager_unfolding_only 
                                    -> true
                                | uu____23803 -> false))
                         in
                      let steps =
                        let uu___210_23805 = cfg1.steps  in
                        {
                          beta = (uu___210_23805.beta);
                          iota = (uu___210_23805.iota);
                          zeta = false;
                          weak = (uu___210_23805.weak);
                          hnf = (uu___210_23805.hnf);
                          primops = (uu___210_23805.primops);
                          do_not_unfold_pure_lets =
                            (uu___210_23805.do_not_unfold_pure_lets);
                          unfold_until = FStar_Pervasives_Native.None;
                          unfold_only = FStar_Pervasives_Native.None;
                          unfold_fully = (uu___210_23805.unfold_fully);
                          unfold_attr = FStar_Pervasives_Native.None;
                          unfold_tac = false;
                          pure_subterms_within_computations =
                            (uu___210_23805.pure_subterms_within_computations);
                          simplify = (uu___210_23805.simplify);
                          erase_universes = (uu___210_23805.erase_universes);
                          allow_unbound_universes =
                            (uu___210_23805.allow_unbound_universes);
                          reify_ = (uu___210_23805.reify_);
                          compress_uvars = (uu___210_23805.compress_uvars);
                          no_full_norm = (uu___210_23805.no_full_norm);
                          check_no_uvars = (uu___210_23805.check_no_uvars);
                          unmeta = (uu___210_23805.unmeta);
                          unascribe = (uu___210_23805.unascribe);
                          in_full_norm_request =
                            (uu___210_23805.in_full_norm_request);
                          weakly_reduce_scrutinee =
                            (uu___210_23805.weakly_reduce_scrutinee)
                        }  in
                      let uu___211_23810 = cfg1  in
                      {
                        steps;
                        tcenv = (uu___211_23810.tcenv);
                        debug = (uu___211_23810.debug);
                        delta_level = new_delta;
                        primitive_steps = (uu___211_23810.primitive_steps);
                        strong = true;
                        memoize_lazy = (uu___211_23810.memoize_lazy);
                        normalize_pure_lets =
                          (uu___211_23810.normalize_pure_lets)
                      }  in
                    let norm_or_whnf env2 t2 =
                      if whnf
                      then closure_as_term cfg_exclude_zeta env2 t2
                      else norm cfg_exclude_zeta env2 [] t2  in
                    let rec norm_pat env2 p =
                      match p.FStar_Syntax_Syntax.v with
                      | FStar_Syntax_Syntax.Pat_constant uu____23882 ->
                          (p, env2)
                      | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                          let uu____23911 =
                            FStar_All.pipe_right pats
                              (FStar_List.fold_left
                                 (fun uu____23995  ->
                                    fun uu____23996  ->
                                      match (uu____23995, uu____23996) with
                                      | ((pats1,env3),(p1,b)) ->
                                          let uu____24135 = norm_pat env3 p1
                                             in
                                          (match uu____24135 with
                                           | (p2,env4) ->
                                               (((p2, b) :: pats1), env4)))
                                 ([], env2))
                             in
                          (match uu____23911 with
                           | (pats1,env3) ->
                               ((let uu___212_24297 = p  in
                                 {
                                   FStar_Syntax_Syntax.v =
                                     (FStar_Syntax_Syntax.Pat_cons
                                        (fv, (FStar_List.rev pats1)));
                                   FStar_Syntax_Syntax.p =
                                     (uu___212_24297.FStar_Syntax_Syntax.p)
                                 }), env3))
                      | FStar_Syntax_Syntax.Pat_var x ->
                          let x1 =
                            let uu___213_24316 = x  in
                            let uu____24317 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___213_24316.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___213_24316.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____24317
                            }  in
                          ((let uu___214_24331 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_var x1);
                              FStar_Syntax_Syntax.p =
                                (uu___214_24331.FStar_Syntax_Syntax.p)
                            }), (dummy :: env2))
                      | FStar_Syntax_Syntax.Pat_wild x ->
                          let x1 =
                            let uu___215_24342 = x  in
                            let uu____24343 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___215_24342.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___215_24342.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____24343
                            }  in
                          ((let uu___216_24357 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_wild x1);
                              FStar_Syntax_Syntax.p =
                                (uu___216_24357.FStar_Syntax_Syntax.p)
                            }), (dummy :: env2))
                      | FStar_Syntax_Syntax.Pat_dot_term (x,t2) ->
                          let x1 =
                            let uu___217_24373 = x  in
                            let uu____24374 =
                              norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                               in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___217_24373.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___217_24373.FStar_Syntax_Syntax.index);
                              FStar_Syntax_Syntax.sort = uu____24374
                            }  in
                          let t3 = norm_or_whnf env2 t2  in
                          ((let uu___218_24389 = p  in
                            {
                              FStar_Syntax_Syntax.v =
                                (FStar_Syntax_Syntax.Pat_dot_term (x1, t3));
                              FStar_Syntax_Syntax.p =
                                (uu___218_24389.FStar_Syntax_Syntax.p)
                            }), env2)
                       in
                    let branches1 =
                      match env1 with
                      | [] when whnf -> branches
                      | uu____24433 ->
                          FStar_All.pipe_right branches
                            (FStar_List.map
                               (fun branch1  ->
                                  let uu____24449 =
                                    FStar_Syntax_Subst.open_branch branch1
                                     in
                                  match uu____24449 with
                                  | (p,wopt,e) ->
                                      let uu____24469 = norm_pat env1 p  in
                                      (match uu____24469 with
                                       | (p1,env2) ->
                                           let wopt1 =
                                             match wopt with
                                             | FStar_Pervasives_Native.None 
                                                 ->
                                                 FStar_Pervasives_Native.None
                                             | FStar_Pervasives_Native.Some w
                                                 ->
                                                 let uu____24524 =
                                                   norm_or_whnf env2 w  in
                                                 FStar_Pervasives_Native.Some
                                                   uu____24524
                                              in
                                           let e1 = norm_or_whnf env2 e  in
                                           FStar_Syntax_Util.branch
                                             (p1, wopt1, e1))))
                       in
                    let scrutinee1 =
                      let uu____24537 =
                        ((((cfg1.steps).iota &&
                             (Prims.op_Negation (cfg1.steps).weak))
                            &&
                            (Prims.op_Negation (cfg1.steps).compress_uvars))
                           && (cfg1.steps).weakly_reduce_scrutinee)
                          && (maybe_weakly_reduced scrutinee)
                         in
                      if uu____24537
                      then
                        norm
                          (let uu___219_24542 = cfg1  in
                           {
                             steps =
                               (let uu___220_24545 = cfg1.steps  in
                                {
                                  beta = (uu___220_24545.beta);
                                  iota = (uu___220_24545.iota);
                                  zeta = (uu___220_24545.zeta);
                                  weak = (uu___220_24545.weak);
                                  hnf = (uu___220_24545.hnf);
                                  primops = (uu___220_24545.primops);
                                  do_not_unfold_pure_lets =
                                    (uu___220_24545.do_not_unfold_pure_lets);
                                  unfold_until =
                                    (uu___220_24545.unfold_until);
                                  unfold_only = (uu___220_24545.unfold_only);
                                  unfold_fully =
                                    (uu___220_24545.unfold_fully);
                                  unfold_attr = (uu___220_24545.unfold_attr);
                                  unfold_tac = (uu___220_24545.unfold_tac);
                                  pure_subterms_within_computations =
                                    (uu___220_24545.pure_subterms_within_computations);
                                  simplify = (uu___220_24545.simplify);
                                  erase_universes =
                                    (uu___220_24545.erase_universes);
                                  allow_unbound_universes =
                                    (uu___220_24545.allow_unbound_universes);
                                  reify_ = (uu___220_24545.reify_);
                                  compress_uvars =
                                    (uu___220_24545.compress_uvars);
                                  no_full_norm =
                                    (uu___220_24545.no_full_norm);
                                  check_no_uvars =
                                    (uu___220_24545.check_no_uvars);
                                  unmeta = (uu___220_24545.unmeta);
                                  unascribe = (uu___220_24545.unascribe);
                                  in_full_norm_request =
                                    (uu___220_24545.in_full_norm_request);
                                  weakly_reduce_scrutinee = false
                                });
                             tcenv = (uu___219_24542.tcenv);
                             debug = (uu___219_24542.debug);
                             delta_level = (uu___219_24542.delta_level);
                             primitive_steps =
                               (uu___219_24542.primitive_steps);
                             strong = (uu___219_24542.strong);
                             memoize_lazy = (uu___219_24542.memoize_lazy);
                             normalize_pure_lets =
                               (uu___219_24542.normalize_pure_lets)
                           }) scrutinee_env [] scrutinee
                      else scrutinee  in
                    let uu____24547 =
                      mk
                        (FStar_Syntax_Syntax.Tm_match (scrutinee1, branches1))
                        r
                       in
                    rebuild cfg1 env1 stack1 uu____24547)
                    in
                 let rec is_cons head1 =
                   let uu____24572 =
                     let uu____24573 = FStar_Syntax_Subst.compress head1  in
                     uu____24573.FStar_Syntax_Syntax.n  in
                   match uu____24572 with
                   | FStar_Syntax_Syntax.Tm_uinst (h,uu____24577) ->
                       is_cons h
                   | FStar_Syntax_Syntax.Tm_constant uu____24582 -> true
                   | FStar_Syntax_Syntax.Tm_fvar
                       { FStar_Syntax_Syntax.fv_name = uu____24583;
                         FStar_Syntax_Syntax.fv_delta = uu____24584;
                         FStar_Syntax_Syntax.fv_qual =
                           FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Data_ctor );_}
                       -> true
                   | FStar_Syntax_Syntax.Tm_fvar
                       { FStar_Syntax_Syntax.fv_name = uu____24585;
                         FStar_Syntax_Syntax.fv_delta = uu____24586;
                         FStar_Syntax_Syntax.fv_qual =
                           FStar_Pervasives_Native.Some
                           (FStar_Syntax_Syntax.Record_ctor uu____24587);_}
                       -> true
                   | uu____24594 -> false  in
                 let guard_when_clause wopt b rest =
                   match wopt with
                   | FStar_Pervasives_Native.None  -> b
                   | FStar_Pervasives_Native.Some w ->
                       let then_branch = b  in
                       let else_branch =
                         mk (FStar_Syntax_Syntax.Tm_match (scrutinee, rest))
                           r
                          in
                       FStar_Syntax_Util.if_then_else w then_branch
                         else_branch
                    in
                 let rec matches_pat scrutinee_orig p =
                   let scrutinee1 = FStar_Syntax_Util.unmeta scrutinee_orig
                      in
                   let uu____24757 =
                     FStar_Syntax_Util.head_and_args scrutinee1  in
                   match uu____24757 with
                   | (head1,args) ->
                       (match p.FStar_Syntax_Syntax.v with
                        | FStar_Syntax_Syntax.Pat_var bv ->
                            FStar_Util.Inl [(bv, scrutinee_orig)]
                        | FStar_Syntax_Syntax.Pat_wild bv ->
                            FStar_Util.Inl [(bv, scrutinee_orig)]
                        | FStar_Syntax_Syntax.Pat_dot_term uu____24844 ->
                            FStar_Util.Inl []
                        | FStar_Syntax_Syntax.Pat_constant s ->
                            (match scrutinee1.FStar_Syntax_Syntax.n with
                             | FStar_Syntax_Syntax.Tm_constant s' when
                                 FStar_Const.eq_const s s' ->
                                 FStar_Util.Inl []
                             | uu____24883 ->
                                 let uu____24884 =
                                   let uu____24885 = is_cons head1  in
                                   Prims.op_Negation uu____24885  in
                                 FStar_Util.Inr uu____24884)
                        | FStar_Syntax_Syntax.Pat_cons (fv,arg_pats) ->
                            let uu____24910 =
                              let uu____24911 =
                                FStar_Syntax_Util.un_uinst head1  in
                              uu____24911.FStar_Syntax_Syntax.n  in
                            (match uu____24910 with
                             | FStar_Syntax_Syntax.Tm_fvar fv' when
                                 FStar_Syntax_Syntax.fv_eq fv fv' ->
                                 matches_args [] args arg_pats
                             | uu____24929 ->
                                 let uu____24930 =
                                   let uu____24931 = is_cons head1  in
                                   Prims.op_Negation uu____24931  in
                                 FStar_Util.Inr uu____24930))
                 
                 and matches_args out a p =
                   match (a, p) with
                   | ([],[]) -> FStar_Util.Inl out
                   | ((t2,uu____25008)::rest_a,(p1,uu____25011)::rest_p) ->
                       let uu____25055 = matches_pat t2 p1  in
                       (match uu____25055 with
                        | FStar_Util.Inl s ->
                            matches_args (FStar_List.append out s) rest_a
                              rest_p
                        | m -> m)
                   | uu____25104 -> FStar_Util.Inr false
                  in
                 let rec matches scrutinee1 p =
                   match p with
                   | [] -> norm_and_rebuild_match ()
                   | (p1,wopt,b)::rest ->
                       let uu____25222 = matches_pat scrutinee1 p1  in
                       (match uu____25222 with
                        | FStar_Util.Inr (false ) -> matches scrutinee1 rest
                        | FStar_Util.Inr (true ) -> norm_and_rebuild_match ()
                        | FStar_Util.Inl s ->
                            (log cfg1
                               (fun uu____25262  ->
                                  let uu____25263 =
                                    FStar_Syntax_Print.pat_to_string p1  in
                                  let uu____25264 =
                                    let uu____25265 =
                                      FStar_List.map
                                        (fun uu____25275  ->
                                           match uu____25275 with
                                           | (uu____25280,t2) ->
                                               FStar_Syntax_Print.term_to_string
                                                 t2) s
                                       in
                                    FStar_All.pipe_right uu____25265
                                      (FStar_String.concat "; ")
                                     in
                                  FStar_Util.print2
                                    "Matches pattern %s with subst = %s\n"
                                    uu____25263 uu____25264);
                             (let env0 = env1  in
                              let env2 =
                                FStar_List.fold_left
                                  (fun env2  ->
                                     fun uu____25312  ->
                                       match uu____25312 with
                                       | (bv,t2) ->
                                           let uu____25335 =
                                             let uu____25342 =
                                               let uu____25345 =
                                                 FStar_Syntax_Syntax.mk_binder
                                                   bv
                                                  in
                                               FStar_Pervasives_Native.Some
                                                 uu____25345
                                                in
                                             let uu____25346 =
                                               let uu____25347 =
                                                 let uu____25378 =
                                                   FStar_Util.mk_ref
                                                     (FStar_Pervasives_Native.Some
                                                        ([], t2))
                                                    in
                                                 ([], t2, uu____25378, false)
                                                  in
                                               Clos uu____25347  in
                                             (uu____25342, uu____25346)  in
                                           uu____25335 :: env2) env1 s
                                 in
                              let uu____25491 = guard_when_clause wopt b rest
                                 in
                              norm cfg1 env2 stack1 uu____25491)))
                    in
                 if (cfg1.steps).iota
                 then matches scrutinee branches
                 else norm_and_rebuild_match ())))

let (plugins :
  (primitive_step -> unit,unit -> primitive_step Prims.list)
    FStar_Pervasives_Native.tuple2)
  =
  let plugins = FStar_Util.mk_ref []  in
  let register p =
    let uu____25518 =
      let uu____25521 = FStar_ST.op_Bang plugins  in p :: uu____25521  in
    FStar_ST.op_Colon_Equals plugins uu____25518  in
  let retrieve uu____25629 = FStar_ST.op_Bang plugins  in
  (register, retrieve) 
let (register_plugin : primitive_step -> unit) =
  fun p  -> FStar_Pervasives_Native.fst plugins p 
let (retrieve_plugins : unit -> primitive_step Prims.list) =
  fun uu____25706  -> FStar_Pervasives_Native.snd plugins () 
let (config' :
  primitive_step Prims.list ->
    step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  =
  fun psteps  ->
    fun s  ->
      fun e  ->
        let d =
          FStar_All.pipe_right s
            (FStar_List.collect
               (fun uu___118_25747  ->
                  match uu___118_25747 with
                  | UnfoldUntil k -> [FStar_TypeChecker_Env.Unfold k]
                  | Eager_unfolding  ->
                      [FStar_TypeChecker_Env.Eager_unfolding_only]
                  | Inlining  -> [FStar_TypeChecker_Env.Inlining]
                  | UnfoldTac  -> [FStar_TypeChecker_Env.UnfoldTac]
                  | uu____25751 -> []))
           in
        let d1 =
          match d with
          | [] -> [FStar_TypeChecker_Env.NoDelta]
          | uu____25757 -> d  in
        let uu____25760 = to_fsteps s  in
        let uu____25761 =
          let uu____25762 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Norm")  in
          let uu____25763 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "Primops")  in
          let uu____25764 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "380")  in
          let uu____25765 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "WPE")  in
          let uu____25766 =
            FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormDelayed")
             in
          let uu____25767 =
            FStar_TypeChecker_Env.debug e
              (FStar_Options.Other "print_normalized_terms")
             in
          {
            gen = uu____25762;
            primop = uu____25763;
            b380 = uu____25764;
            wpe = uu____25765;
            norm_delayed = uu____25766;
            print_normalized = uu____25767
          }  in
        let uu____25768 =
          let uu____25771 =
            let uu____25774 = retrieve_plugins ()  in
            FStar_List.append uu____25774 psteps  in
          add_steps built_in_primitive_steps uu____25771  in
        let uu____25777 =
          (FStar_Options.normalize_pure_terms_for_extraction ()) ||
            (let uu____25779 =
               FStar_All.pipe_right s
                 (FStar_List.contains PureSubtermsWithinComputations)
                in
             Prims.op_Negation uu____25779)
           in
        {
          steps = uu____25760;
          tcenv = e;
          debug = uu____25761;
          delta_level = d1;
          primitive_steps = uu____25768;
          strong = false;
          memoize_lazy = true;
          normalize_pure_lets = uu____25777
        }
  
let (config : step Prims.list -> FStar_TypeChecker_Env.env -> cfg) =
  fun s  -> fun e  -> config' [] s e 
let (normalize_with_primitive_steps :
  primitive_step Prims.list ->
    step Prims.list ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun ps  ->
    fun s  -> fun e  -> fun t  -> let c = config' ps s e  in norm c [] [] t
  
let (normalize :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun s  -> fun e  -> fun t  -> normalize_with_primitive_steps [] s e t 
let (normalize_comp :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun s  ->
    fun e  ->
      fun t  -> let uu____25861 = config s e  in norm_comp uu____25861 [] t
  
let (normalize_universe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u  ->
      let uu____25878 = config [] env  in norm_universe uu____25878 [] u
  
let (ghost_to_pure :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  ->
      let cfg =
        config
          [UnfoldUntil FStar_Syntax_Syntax.delta_constant;
          AllowUnboundUniverses;
          EraseUniverses] env
         in
      let non_info t =
        let uu____25902 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25902  in
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____25909 -> c
      | FStar_Syntax_Syntax.GTotal (t,uopt) when non_info t ->
          let uu___221_25928 = c  in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Total (t, uopt));
            FStar_Syntax_Syntax.pos =
              (uu___221_25928.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___221_25928.FStar_Syntax_Syntax.vars)
          }
      | FStar_Syntax_Syntax.Comp ct ->
          let l =
            FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
              ct.FStar_Syntax_Syntax.effect_name
             in
          let uu____25935 =
            (FStar_Syntax_Util.is_ghost_effect l) &&
              (non_info ct.FStar_Syntax_Syntax.result_typ)
             in
          if uu____25935
          then
            let ct1 =
              let uu____25937 =
                downgrade_ghost_effect_name
                  ct.FStar_Syntax_Syntax.effect_name
                 in
              match uu____25937 with
              | FStar_Pervasives_Native.Some pure_eff ->
                  let flags1 =
                    let uu____25944 =
                      FStar_Ident.lid_equals pure_eff
                        FStar_Parser_Const.effect_Tot_lid
                       in
                    if uu____25944
                    then FStar_Syntax_Syntax.TOTAL ::
                      (ct.FStar_Syntax_Syntax.flags)
                    else ct.FStar_Syntax_Syntax.flags  in
                  let uu___222_25948 = ct  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___222_25948.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name = pure_eff;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___222_25948.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___222_25948.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags = flags1
                  }
              | FStar_Pervasives_Native.None  ->
                  let ct1 =
                    FStar_TypeChecker_Env.unfold_effect_abbrev cfg.tcenv c
                     in
                  let uu___223_25950 = ct1  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___223_25950.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name =
                      FStar_Parser_Const.effect_PURE_lid;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___223_25950.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___223_25950.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags =
                      (uu___223_25950.FStar_Syntax_Syntax.flags)
                  }
               in
            let uu___224_25951 = c  in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
              FStar_Syntax_Syntax.pos =
                (uu___224_25951.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___224_25951.FStar_Syntax_Syntax.vars)
            }
          else c
      | uu____25953 -> c
  
let (ghost_to_pure_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun lc  ->
      let cfg =
        config
          [Eager_unfolding;
          UnfoldUntil FStar_Syntax_Syntax.delta_constant;
          EraseUniverses;
          AllowUnboundUniverses] env
         in
      let non_info t =
        let uu____25971 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25971  in
      let uu____25978 =
        (FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
          && (non_info lc.FStar_Syntax_Syntax.res_typ)
         in
      if uu____25978
      then
        let uu____25979 =
          downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name  in
        match uu____25979 with
        | FStar_Pervasives_Native.Some pure_eff ->
            FStar_Syntax_Syntax.mk_lcomp pure_eff
              lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
              (fun uu____25985  ->
                 let uu____25986 = FStar_Syntax_Syntax.lcomp_comp lc  in
                 ghost_to_pure env uu____25986)
        | FStar_Pervasives_Native.None  -> lc
      else lc
  
let (term_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  fun env  ->
    fun t  ->
      let t1 =
        try normalize [AllowUnboundUniverses] env t
        with
        | e ->
            ((let uu____26007 =
                let uu____26012 =
                  let uu____26013 = FStar_Util.message_of_exn e  in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____26013
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____26012)  in
              FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____26007);
             t)
         in
      FStar_Syntax_Print.term_to_string' env.FStar_TypeChecker_Env.dsenv t1
  
let (comp_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.comp -> Prims.string) =
  fun env  ->
    fun c  ->
      let c1 =
        try
          let uu____26028 = config [AllowUnboundUniverses] env  in
          norm_comp uu____26028 [] c
        with
        | e ->
            ((let uu____26041 =
                let uu____26046 =
                  let uu____26047 = FStar_Util.message_of_exn e  in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____26047
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____26046)  in
              FStar_Errors.log_issue c.FStar_Syntax_Syntax.pos uu____26041);
             c)
         in
      FStar_Syntax_Print.comp_to_string' env.FStar_TypeChecker_Env.dsenv c1
  
let (normalize_refinement :
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun steps  ->
    fun env  ->
      fun t0  ->
        let t = normalize (FStar_List.append steps [Beta]) env t0  in
        let rec aux t1 =
          let t2 = FStar_Syntax_Subst.compress t1  in
          match t2.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
              let t01 = aux x.FStar_Syntax_Syntax.sort  in
              (match t01.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_refine (y,phi1) ->
                   let uu____26092 =
                     let uu____26093 =
                       let uu____26100 = FStar_Syntax_Util.mk_conj phi1 phi
                          in
                       (y, uu____26100)  in
                     FStar_Syntax_Syntax.Tm_refine uu____26093  in
                   mk uu____26092 t01.FStar_Syntax_Syntax.pos
               | uu____26105 -> t2)
          | uu____26106 -> t2  in
        aux t
  
let (unfold_whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      normalize
        [Primops;
        Weak;
        HNF;
        UnfoldUntil FStar_Syntax_Syntax.delta_constant;
        Beta] env t
  
let (reduce_or_remove_uvar_solutions :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun remove  ->
    fun env  ->
      fun t  ->
        normalize
          (FStar_List.append (if remove then [CheckNoUvars] else [])
             [Beta;
             DoNotUnfoldPureLets;
             CompressUvars;
             Exclude Zeta;
             Exclude Iota;
             NoFullNorm]) env t
  
let (reduce_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions false env t 
let (remove_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions true env t 
let (eta_expand_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun t_e  ->
        let uu____26170 = FStar_Syntax_Util.arrow_formals_comp t_e  in
        match uu____26170 with
        | (formals,c) ->
            (match formals with
             | [] -> e
             | uu____26199 ->
                 let uu____26206 = FStar_Syntax_Util.abs_formals e  in
                 (match uu____26206 with
                  | (actuals,uu____26216,uu____26217) ->
                      if
                        (FStar_List.length actuals) =
                          (FStar_List.length formals)
                      then e
                      else
                        (let uu____26231 =
                           FStar_All.pipe_right formals
                             FStar_Syntax_Util.args_of_binders
                            in
                         match uu____26231 with
                         | (binders,args) ->
                             let uu____26242 =
                               FStar_Syntax_Syntax.mk_Tm_app e args
                                 FStar_Pervasives_Native.None
                                 e.FStar_Syntax_Syntax.pos
                                in
                             FStar_Syntax_Util.abs binders uu____26242
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.residual_comp_of_comp c)))))
  
let (eta_expand :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_name x ->
          eta_expand_with_type env t x.FStar_Syntax_Syntax.sort
      | uu____26256 ->
          let uu____26257 = FStar_Syntax_Util.head_and_args t  in
          (match uu____26257 with
           | (head1,args) ->
               let uu____26294 =
                 let uu____26295 = FStar_Syntax_Subst.compress head1  in
                 uu____26295.FStar_Syntax_Syntax.n  in
               (match uu____26294 with
                | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
                    let uu____26320 =
                      let uu____26333 =
                        FStar_Syntax_Subst.subst' s
                          u.FStar_Syntax_Syntax.ctx_uvar_typ
                         in
                      FStar_Syntax_Util.arrow_formals uu____26333  in
                    (match uu____26320 with
                     | (formals,_tres) ->
                         if
                           (FStar_List.length formals) =
                             (FStar_List.length args)
                         then t
                         else
                           (let uu____26363 =
                              env.FStar_TypeChecker_Env.type_of
                                (let uu___229_26371 = env  in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___229_26371.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___229_26371.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___229_26371.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___229_26371.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_sig =
                                     (uu___229_26371.FStar_TypeChecker_Env.gamma_sig);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___229_26371.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___229_26371.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ =
                                     FStar_Pervasives_Native.None;
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___229_26371.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___229_26371.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___229_26371.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___229_26371.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___229_26371.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___229_26371.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___229_26371.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___229_26371.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq =
                                     (uu___229_26371.FStar_TypeChecker_Env.use_eq);
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___229_26371.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___229_26371.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax = true;
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___229_26371.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.failhard =
                                     (uu___229_26371.FStar_TypeChecker_Env.failhard);
                                   FStar_TypeChecker_Env.nosynth =
                                     (uu___229_26371.FStar_TypeChecker_Env.nosynth);
                                   FStar_TypeChecker_Env.uvar_subtyping =
                                     (uu___229_26371.FStar_TypeChecker_Env.uvar_subtyping);
                                   FStar_TypeChecker_Env.tc_term =
                                     (uu___229_26371.FStar_TypeChecker_Env.tc_term);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___229_26371.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___229_26371.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.check_type_of =
                                     (uu___229_26371.FStar_TypeChecker_Env.check_type_of);
                                   FStar_TypeChecker_Env.use_bv_sorts = true;
                                   FStar_TypeChecker_Env.qtbl_name_and_index
                                     =
                                     (uu___229_26371.FStar_TypeChecker_Env.qtbl_name_and_index);
                                   FStar_TypeChecker_Env.normalized_eff_names
                                     =
                                     (uu___229_26371.FStar_TypeChecker_Env.normalized_eff_names);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___229_26371.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth_hook =
                                     (uu___229_26371.FStar_TypeChecker_Env.synth_hook);
                                   FStar_TypeChecker_Env.splice =
                                     (uu___229_26371.FStar_TypeChecker_Env.splice);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___229_26371.FStar_TypeChecker_Env.is_native_tactic);
                                   FStar_TypeChecker_Env.identifier_info =
                                     (uu___229_26371.FStar_TypeChecker_Env.identifier_info);
                                   FStar_TypeChecker_Env.tc_hooks =
                                     (uu___229_26371.FStar_TypeChecker_Env.tc_hooks);
                                   FStar_TypeChecker_Env.dsenv =
                                     (uu___229_26371.FStar_TypeChecker_Env.dsenv);
                                   FStar_TypeChecker_Env.dep_graph =
                                     (uu___229_26371.FStar_TypeChecker_Env.dep_graph)
                                 }) t
                               in
                            match uu____26363 with
                            | (uu____26372,ty,uu____26374) ->
                                eta_expand_with_type env t ty))
                | uu____26375 ->
                    let uu____26376 =
                      env.FStar_TypeChecker_Env.type_of
                        (let uu___230_26384 = env  in
                         {
                           FStar_TypeChecker_Env.solver =
                             (uu___230_26384.FStar_TypeChecker_Env.solver);
                           FStar_TypeChecker_Env.range =
                             (uu___230_26384.FStar_TypeChecker_Env.range);
                           FStar_TypeChecker_Env.curmodule =
                             (uu___230_26384.FStar_TypeChecker_Env.curmodule);
                           FStar_TypeChecker_Env.gamma =
                             (uu___230_26384.FStar_TypeChecker_Env.gamma);
                           FStar_TypeChecker_Env.gamma_sig =
                             (uu___230_26384.FStar_TypeChecker_Env.gamma_sig);
                           FStar_TypeChecker_Env.gamma_cache =
                             (uu___230_26384.FStar_TypeChecker_Env.gamma_cache);
                           FStar_TypeChecker_Env.modules =
                             (uu___230_26384.FStar_TypeChecker_Env.modules);
                           FStar_TypeChecker_Env.expected_typ =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Env.sigtab =
                             (uu___230_26384.FStar_TypeChecker_Env.sigtab);
                           FStar_TypeChecker_Env.is_pattern =
                             (uu___230_26384.FStar_TypeChecker_Env.is_pattern);
                           FStar_TypeChecker_Env.instantiate_imp =
                             (uu___230_26384.FStar_TypeChecker_Env.instantiate_imp);
                           FStar_TypeChecker_Env.effects =
                             (uu___230_26384.FStar_TypeChecker_Env.effects);
                           FStar_TypeChecker_Env.generalize =
                             (uu___230_26384.FStar_TypeChecker_Env.generalize);
                           FStar_TypeChecker_Env.letrecs =
                             (uu___230_26384.FStar_TypeChecker_Env.letrecs);
                           FStar_TypeChecker_Env.top_level =
                             (uu___230_26384.FStar_TypeChecker_Env.top_level);
                           FStar_TypeChecker_Env.check_uvars =
                             (uu___230_26384.FStar_TypeChecker_Env.check_uvars);
                           FStar_TypeChecker_Env.use_eq =
                             (uu___230_26384.FStar_TypeChecker_Env.use_eq);
                           FStar_TypeChecker_Env.is_iface =
                             (uu___230_26384.FStar_TypeChecker_Env.is_iface);
                           FStar_TypeChecker_Env.admit =
                             (uu___230_26384.FStar_TypeChecker_Env.admit);
                           FStar_TypeChecker_Env.lax = true;
                           FStar_TypeChecker_Env.lax_universes =
                             (uu___230_26384.FStar_TypeChecker_Env.lax_universes);
                           FStar_TypeChecker_Env.failhard =
                             (uu___230_26384.FStar_TypeChecker_Env.failhard);
                           FStar_TypeChecker_Env.nosynth =
                             (uu___230_26384.FStar_TypeChecker_Env.nosynth);
                           FStar_TypeChecker_Env.uvar_subtyping =
                             (uu___230_26384.FStar_TypeChecker_Env.uvar_subtyping);
                           FStar_TypeChecker_Env.tc_term =
                             (uu___230_26384.FStar_TypeChecker_Env.tc_term);
                           FStar_TypeChecker_Env.type_of =
                             (uu___230_26384.FStar_TypeChecker_Env.type_of);
                           FStar_TypeChecker_Env.universe_of =
                             (uu___230_26384.FStar_TypeChecker_Env.universe_of);
                           FStar_TypeChecker_Env.check_type_of =
                             (uu___230_26384.FStar_TypeChecker_Env.check_type_of);
                           FStar_TypeChecker_Env.use_bv_sorts = true;
                           FStar_TypeChecker_Env.qtbl_name_and_index =
                             (uu___230_26384.FStar_TypeChecker_Env.qtbl_name_and_index);
                           FStar_TypeChecker_Env.normalized_eff_names =
                             (uu___230_26384.FStar_TypeChecker_Env.normalized_eff_names);
                           FStar_TypeChecker_Env.proof_ns =
                             (uu___230_26384.FStar_TypeChecker_Env.proof_ns);
                           FStar_TypeChecker_Env.synth_hook =
                             (uu___230_26384.FStar_TypeChecker_Env.synth_hook);
                           FStar_TypeChecker_Env.splice =
                             (uu___230_26384.FStar_TypeChecker_Env.splice);
                           FStar_TypeChecker_Env.is_native_tactic =
                             (uu___230_26384.FStar_TypeChecker_Env.is_native_tactic);
                           FStar_TypeChecker_Env.identifier_info =
                             (uu___230_26384.FStar_TypeChecker_Env.identifier_info);
                           FStar_TypeChecker_Env.tc_hooks =
                             (uu___230_26384.FStar_TypeChecker_Env.tc_hooks);
                           FStar_TypeChecker_Env.dsenv =
                             (uu___230_26384.FStar_TypeChecker_Env.dsenv);
                           FStar_TypeChecker_Env.dep_graph =
                             (uu___230_26384.FStar_TypeChecker_Env.dep_graph)
                         }) t
                       in
                    (match uu____26376 with
                     | (uu____26385,ty,uu____26387) ->
                         eta_expand_with_type env t ty)))
  
let rec (elim_delayed_subst_term :
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        t.FStar_Syntax_Syntax.pos
       in
    let t1 = FStar_Syntax_Subst.compress t  in
    let elim_bv x =
      let uu___231_26460 = x  in
      let uu____26461 = elim_delayed_subst_term x.FStar_Syntax_Syntax.sort
         in
      {
        FStar_Syntax_Syntax.ppname =
          (uu___231_26460.FStar_Syntax_Syntax.ppname);
        FStar_Syntax_Syntax.index =
          (uu___231_26460.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = uu____26461
      }  in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____26464 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_bvar uu____26489 -> t1
    | FStar_Syntax_Syntax.Tm_name uu____26490 -> t1
    | FStar_Syntax_Syntax.Tm_fvar uu____26491 -> t1
    | FStar_Syntax_Syntax.Tm_uinst uu____26492 -> t1
    | FStar_Syntax_Syntax.Tm_constant uu____26499 -> t1
    | FStar_Syntax_Syntax.Tm_type uu____26500 -> t1
    | FStar_Syntax_Syntax.Tm_lazy uu____26501 -> t1
    | FStar_Syntax_Syntax.Tm_unknown  -> t1
    | FStar_Syntax_Syntax.Tm_abs (bs,t2,rc_opt) ->
        let elim_rc rc =
          let uu___232_26531 = rc  in
          let uu____26532 =
            FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
              elim_delayed_subst_term
             in
          let uu____26541 =
            elim_delayed_subst_cflags rc.FStar_Syntax_Syntax.residual_flags
             in
          {
            FStar_Syntax_Syntax.residual_effect =
              (uu___232_26531.FStar_Syntax_Syntax.residual_effect);
            FStar_Syntax_Syntax.residual_typ = uu____26532;
            FStar_Syntax_Syntax.residual_flags = uu____26541
          }  in
        let uu____26544 =
          let uu____26545 =
            let uu____26562 = elim_delayed_subst_binders bs  in
            let uu____26569 = elim_delayed_subst_term t2  in
            let uu____26572 = FStar_Util.map_opt rc_opt elim_rc  in
            (uu____26562, uu____26569, uu____26572)  in
          FStar_Syntax_Syntax.Tm_abs uu____26545  in
        mk1 uu____26544
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        let uu____26603 =
          let uu____26604 =
            let uu____26617 = elim_delayed_subst_binders bs  in
            let uu____26624 = elim_delayed_subst_comp c  in
            (uu____26617, uu____26624)  in
          FStar_Syntax_Syntax.Tm_arrow uu____26604  in
        mk1 uu____26603
    | FStar_Syntax_Syntax.Tm_refine (bv,phi) ->
        let uu____26641 =
          let uu____26642 =
            let uu____26649 = elim_bv bv  in
            let uu____26650 = elim_delayed_subst_term phi  in
            (uu____26649, uu____26650)  in
          FStar_Syntax_Syntax.Tm_refine uu____26642  in
        mk1 uu____26641
    | FStar_Syntax_Syntax.Tm_app (t2,args) ->
        let uu____26677 =
          let uu____26678 =
            let uu____26693 = elim_delayed_subst_term t2  in
            let uu____26696 = elim_delayed_subst_args args  in
            (uu____26693, uu____26696)  in
          FStar_Syntax_Syntax.Tm_app uu____26678  in
        mk1 uu____26677
    | FStar_Syntax_Syntax.Tm_match (t2,branches) ->
        let rec elim_pat p =
          match p.FStar_Syntax_Syntax.v with
          | FStar_Syntax_Syntax.Pat_var x ->
              let uu___233_26764 = p  in
              let uu____26765 =
                let uu____26766 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_var uu____26766  in
              {
                FStar_Syntax_Syntax.v = uu____26765;
                FStar_Syntax_Syntax.p =
                  (uu___233_26764.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_wild x ->
              let uu___234_26768 = p  in
              let uu____26769 =
                let uu____26770 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_wild uu____26770  in
              {
                FStar_Syntax_Syntax.v = uu____26769;
                FStar_Syntax_Syntax.p =
                  (uu___234_26768.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_dot_term (x,t0) ->
              let uu___235_26777 = p  in
              let uu____26778 =
                let uu____26779 =
                  let uu____26786 = elim_bv x  in
                  let uu____26787 = elim_delayed_subst_term t0  in
                  (uu____26786, uu____26787)  in
                FStar_Syntax_Syntax.Pat_dot_term uu____26779  in
              {
                FStar_Syntax_Syntax.v = uu____26778;
                FStar_Syntax_Syntax.p =
                  (uu___235_26777.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
              let uu___236_26810 = p  in
              let uu____26811 =
                let uu____26812 =
                  let uu____26825 =
                    FStar_List.map
                      (fun uu____26848  ->
                         match uu____26848 with
                         | (x,b) ->
                             let uu____26861 = elim_pat x  in
                             (uu____26861, b)) pats
                     in
                  (fv, uu____26825)  in
                FStar_Syntax_Syntax.Pat_cons uu____26812  in
              {
                FStar_Syntax_Syntax.v = uu____26811;
                FStar_Syntax_Syntax.p =
                  (uu___236_26810.FStar_Syntax_Syntax.p)
              }
          | uu____26874 -> p  in
        let elim_branch uu____26898 =
          match uu____26898 with
          | (pat,wopt,t3) ->
              let uu____26924 = elim_pat pat  in
              let uu____26927 =
                FStar_Util.map_opt wopt elim_delayed_subst_term  in
              let uu____26930 = elim_delayed_subst_term t3  in
              (uu____26924, uu____26927, uu____26930)
           in
        let uu____26935 =
          let uu____26936 =
            let uu____26959 = elim_delayed_subst_term t2  in
            let uu____26962 = FStar_List.map elim_branch branches  in
            (uu____26959, uu____26962)  in
          FStar_Syntax_Syntax.Tm_match uu____26936  in
        mk1 uu____26935
    | FStar_Syntax_Syntax.Tm_ascribed (t2,a,lopt) ->
        let elim_ascription uu____27093 =
          match uu____27093 with
          | (tc,topt) ->
              let uu____27128 =
                match tc with
                | FStar_Util.Inl t3 ->
                    let uu____27138 = elim_delayed_subst_term t3  in
                    FStar_Util.Inl uu____27138
                | FStar_Util.Inr c ->
                    let uu____27140 = elim_delayed_subst_comp c  in
                    FStar_Util.Inr uu____27140
                 in
              let uu____27141 =
                FStar_Util.map_opt topt elim_delayed_subst_term  in
              (uu____27128, uu____27141)
           in
        let uu____27150 =
          let uu____27151 =
            let uu____27178 = elim_delayed_subst_term t2  in
            let uu____27181 = elim_ascription a  in
            (uu____27178, uu____27181, lopt)  in
          FStar_Syntax_Syntax.Tm_ascribed uu____27151  in
        mk1 uu____27150
    | FStar_Syntax_Syntax.Tm_let (lbs,t2) ->
        let elim_lb lb =
          let uu___237_27242 = lb  in
          let uu____27243 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbtyp  in
          let uu____27246 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbdef  in
          {
            FStar_Syntax_Syntax.lbname =
              (uu___237_27242.FStar_Syntax_Syntax.lbname);
            FStar_Syntax_Syntax.lbunivs =
              (uu___237_27242.FStar_Syntax_Syntax.lbunivs);
            FStar_Syntax_Syntax.lbtyp = uu____27243;
            FStar_Syntax_Syntax.lbeff =
              (uu___237_27242.FStar_Syntax_Syntax.lbeff);
            FStar_Syntax_Syntax.lbdef = uu____27246;
            FStar_Syntax_Syntax.lbattrs =
              (uu___237_27242.FStar_Syntax_Syntax.lbattrs);
            FStar_Syntax_Syntax.lbpos =
              (uu___237_27242.FStar_Syntax_Syntax.lbpos)
          }  in
        let uu____27249 =
          let uu____27250 =
            let uu____27263 =
              let uu____27270 =
                FStar_List.map elim_lb (FStar_Pervasives_Native.snd lbs)  in
              ((FStar_Pervasives_Native.fst lbs), uu____27270)  in
            let uu____27279 = elim_delayed_subst_term t2  in
            (uu____27263, uu____27279)  in
          FStar_Syntax_Syntax.Tm_let uu____27250  in
        mk1 uu____27249
    | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
        mk1 (FStar_Syntax_Syntax.Tm_uvar (u, s))
    | FStar_Syntax_Syntax.Tm_quoted (tm,qi) ->
        let qi1 =
          FStar_Syntax_Syntax.on_antiquoted elim_delayed_subst_term qi  in
        let uu____27329 =
          let uu____27330 =
            let uu____27337 = elim_delayed_subst_term tm  in
            (uu____27337, qi1)  in
          FStar_Syntax_Syntax.Tm_quoted uu____27330  in
        mk1 uu____27329
    | FStar_Syntax_Syntax.Tm_meta (t2,md) ->
        let uu____27348 =
          let uu____27349 =
            let uu____27356 = elim_delayed_subst_term t2  in
            let uu____27359 = elim_delayed_subst_meta md  in
            (uu____27356, uu____27359)  in
          FStar_Syntax_Syntax.Tm_meta uu____27349  in
        mk1 uu____27348

and (elim_delayed_subst_cflags :
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list)
  =
  fun flags1  ->
    FStar_List.map
      (fun uu___119_27368  ->
         match uu___119_27368 with
         | FStar_Syntax_Syntax.DECREASES t ->
             let uu____27372 = elim_delayed_subst_term t  in
             FStar_Syntax_Syntax.DECREASES uu____27372
         | f -> f) flags1

and (elim_delayed_subst_comp :
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) =
  fun c  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        c.FStar_Syntax_Syntax.pos
       in
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (t,uopt) ->
        let uu____27395 =
          let uu____27396 =
            let uu____27405 = elim_delayed_subst_term t  in
            (uu____27405, uopt)  in
          FStar_Syntax_Syntax.Total uu____27396  in
        mk1 uu____27395
    | FStar_Syntax_Syntax.GTotal (t,uopt) ->
        let uu____27422 =
          let uu____27423 =
            let uu____27432 = elim_delayed_subst_term t  in
            (uu____27432, uopt)  in
          FStar_Syntax_Syntax.GTotal uu____27423  in
        mk1 uu____27422
    | FStar_Syntax_Syntax.Comp ct ->
        let ct1 =
          let uu___238_27441 = ct  in
          let uu____27442 =
            elim_delayed_subst_term ct.FStar_Syntax_Syntax.result_typ  in
          let uu____27445 =
            elim_delayed_subst_args ct.FStar_Syntax_Syntax.effect_args  in
          let uu____27454 =
            elim_delayed_subst_cflags ct.FStar_Syntax_Syntax.flags  in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___238_27441.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___238_27441.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ = uu____27442;
            FStar_Syntax_Syntax.effect_args = uu____27445;
            FStar_Syntax_Syntax.flags = uu____27454
          }  in
        mk1 (FStar_Syntax_Syntax.Comp ct1)

and (elim_delayed_subst_meta :
  FStar_Syntax_Syntax.metadata -> FStar_Syntax_Syntax.metadata) =
  fun uu___120_27457  ->
    match uu___120_27457 with
    | FStar_Syntax_Syntax.Meta_pattern args ->
        let uu____27469 = FStar_List.map elim_delayed_subst_args args  in
        FStar_Syntax_Syntax.Meta_pattern uu____27469
    | FStar_Syntax_Syntax.Meta_monadic (m,t) ->
        let uu____27502 =
          let uu____27509 = elim_delayed_subst_term t  in (m, uu____27509)
           in
        FStar_Syntax_Syntax.Meta_monadic uu____27502
    | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,t) ->
        let uu____27521 =
          let uu____27530 = elim_delayed_subst_term t  in
          (m1, m2, uu____27530)  in
        FStar_Syntax_Syntax.Meta_monadic_lift uu____27521
    | m -> m

and (elim_delayed_subst_args :
  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun args  ->
    FStar_List.map
      (fun uu____27557  ->
         match uu____27557 with
         | (t,q) ->
             let uu____27568 = elim_delayed_subst_term t  in (uu____27568, q))
      args

and (elim_delayed_subst_binders :
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
    FStar_Pervasives_Native.tuple2 Prims.list ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
      FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun bs  ->
    FStar_List.map
      (fun uu____27588  ->
         match uu____27588 with
         | (x,q) ->
             let uu____27599 =
               let uu___239_27600 = x  in
               let uu____27601 =
                 elim_delayed_subst_term x.FStar_Syntax_Syntax.sort  in
               {
                 FStar_Syntax_Syntax.ppname =
                   (uu___239_27600.FStar_Syntax_Syntax.ppname);
                 FStar_Syntax_Syntax.index =
                   (uu___239_27600.FStar_Syntax_Syntax.index);
                 FStar_Syntax_Syntax.sort = uu____27601
               }  in
             (uu____27599, q)) bs

let (elim_uvars_aux_tc :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.comp) FStar_Util.either
          ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,(FStar_Syntax_Syntax.term'
                                                          FStar_Syntax_Syntax.syntax,
                                                         FStar_Syntax_Syntax.comp'
                                                           FStar_Syntax_Syntax.syntax)
                                                         FStar_Util.either)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun tc  ->
          let t =
            match (binders, tc) with
            | ([],FStar_Util.Inl t) -> t
            | ([],FStar_Util.Inr c) ->
                failwith "Impossible: empty bindes with a comp"
            | (uu____27693,FStar_Util.Inr c) ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_arrow (binders, c))
                  FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos
            | (uu____27719,FStar_Util.Inl t) ->
                let uu____27737 =
                  let uu____27744 =
                    let uu____27745 =
                      let uu____27758 = FStar_Syntax_Syntax.mk_Total t  in
                      (binders, uu____27758)  in
                    FStar_Syntax_Syntax.Tm_arrow uu____27745  in
                  FStar_Syntax_Syntax.mk uu____27744  in
                uu____27737 FStar_Pervasives_Native.None
                  t.FStar_Syntax_Syntax.pos
             in
          let uu____27772 = FStar_Syntax_Subst.open_univ_vars univ_names t
             in
          match uu____27772 with
          | (univ_names1,t1) ->
              let t2 = remove_uvar_solutions env t1  in
              let t3 = FStar_Syntax_Subst.close_univ_vars univ_names1 t2  in
              let t4 = elim_delayed_subst_term t3  in
              let uu____27802 =
                match binders with
                | [] -> ([], (FStar_Util.Inl t4))
                | uu____27865 ->
                    let uu____27866 =
                      let uu____27875 =
                        let uu____27876 = FStar_Syntax_Subst.compress t4  in
                        uu____27876.FStar_Syntax_Syntax.n  in
                      (uu____27875, tc)  in
                    (match uu____27866 with
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inr uu____27903) ->
                         (binders1, (FStar_Util.Inr c))
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inl uu____27944) ->
                         (binders1,
                           (FStar_Util.Inl (FStar_Syntax_Util.comp_result c)))
                     | (uu____27983,FStar_Util.Inl uu____27984) ->
                         ([], (FStar_Util.Inl t4))
                     | uu____28007 -> failwith "Impossible")
                 in
              (match uu____27802 with
               | (binders1,tc1) -> (univ_names1, binders1, tc1))
  
let (elim_uvars_aux_t :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,FStar_Syntax_Syntax.term'
                                                         FStar_Syntax_Syntax.syntax)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun t  ->
          let uu____28132 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inl t)  in
          match uu____28132 with
          | (univ_names1,binders1,tc) ->
              let uu____28198 = FStar_Util.left tc  in
              (univ_names1, binders1, uu____28198)
  
let (elim_uvars_aux_c :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.univ_names,(FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.aqual)
                                            FStar_Pervasives_Native.tuple2
                                            Prims.list,FStar_Syntax_Syntax.comp'
                                                         FStar_Syntax_Syntax.syntax)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun c  ->
          let uu____28247 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inr c)  in
          match uu____28247 with
          | (univ_names1,binders1,tc) ->
              let uu____28313 = FStar_Util.right tc  in
              (univ_names1, binders1, uu____28313)
  
let rec (elim_uvars :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.sigelt)
  =
  fun env  ->
    fun s  ->
      match s.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_inductive_typ
          (lid,univ_names,binders,typ,lids,lids') ->
          let uu____28352 = elim_uvars_aux_t env univ_names binders typ  in
          (match uu____28352 with
           | (univ_names1,binders1,typ1) ->
               let uu___240_28386 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_inductive_typ
                      (lid, univ_names1, binders1, typ1, lids, lids'));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___240_28386.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___240_28386.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___240_28386.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___240_28386.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_bundle (sigs,lids) ->
          let uu___241_28401 = s  in
          let uu____28402 =
            let uu____28403 =
              let uu____28412 = FStar_List.map (elim_uvars env) sigs  in
              (uu____28412, lids)  in
            FStar_Syntax_Syntax.Sig_bundle uu____28403  in
          {
            FStar_Syntax_Syntax.sigel = uu____28402;
            FStar_Syntax_Syntax.sigrng =
              (uu___241_28401.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___241_28401.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___241_28401.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___241_28401.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_datacon (lid,univ_names,typ,lident,i,lids) ->
          let uu____28429 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28429 with
           | (univ_names1,uu____28449,typ1) ->
               let uu___242_28467 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_datacon
                      (lid, univ_names1, typ1, lident, i, lids));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___242_28467.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___242_28467.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___242_28467.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___242_28467.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,univ_names,typ) ->
          let uu____28473 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28473 with
           | (univ_names1,uu____28493,typ1) ->
               let uu___243_28511 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_declare_typ
                      (lid, univ_names1, typ1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___243_28511.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___243_28511.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___243_28511.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___243_28511.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_let ((b,lbs),lids) ->
          let lbs1 =
            FStar_All.pipe_right lbs
              (FStar_List.map
                 (fun lb  ->
                    let uu____28539 =
                      FStar_Syntax_Subst.univ_var_opening
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    match uu____28539 with
                    | (opening,lbunivs) ->
                        let elim t =
                          let uu____28564 =
                            let uu____28565 =
                              let uu____28566 =
                                FStar_Syntax_Subst.subst opening t  in
                              remove_uvar_solutions env uu____28566  in
                            FStar_Syntax_Subst.close_univ_vars lbunivs
                              uu____28565
                             in
                          elim_delayed_subst_term uu____28564  in
                        let lbtyp = elim lb.FStar_Syntax_Syntax.lbtyp  in
                        let lbdef = elim lb.FStar_Syntax_Syntax.lbdef  in
                        let uu___244_28569 = lb  in
                        {
                          FStar_Syntax_Syntax.lbname =
                            (uu___244_28569.FStar_Syntax_Syntax.lbname);
                          FStar_Syntax_Syntax.lbunivs = lbunivs;
                          FStar_Syntax_Syntax.lbtyp = lbtyp;
                          FStar_Syntax_Syntax.lbeff =
                            (uu___244_28569.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef = lbdef;
                          FStar_Syntax_Syntax.lbattrs =
                            (uu___244_28569.FStar_Syntax_Syntax.lbattrs);
                          FStar_Syntax_Syntax.lbpos =
                            (uu___244_28569.FStar_Syntax_Syntax.lbpos)
                        }))
             in
          let uu___245_28570 = s  in
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_let ((b, lbs1), lids));
            FStar_Syntax_Syntax.sigrng =
              (uu___245_28570.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___245_28570.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___245_28570.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___245_28570.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_main t ->
          let uu___246_28576 = s  in
          let uu____28577 =
            let uu____28578 = remove_uvar_solutions env t  in
            FStar_Syntax_Syntax.Sig_main uu____28578  in
          {
            FStar_Syntax_Syntax.sigel = uu____28577;
            FStar_Syntax_Syntax.sigrng =
              (uu___246_28576.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___246_28576.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___246_28576.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___246_28576.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_assume (l,us,t) ->
          let uu____28582 = elim_uvars_aux_t env us [] t  in
          (match uu____28582 with
           | (us1,uu____28602,t1) ->
               let uu___247_28620 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_assume (l, us1, t1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___247_28620.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___247_28620.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___247_28620.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___247_28620.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____28621 ->
          failwith "Impossible: should have been desugared already"
      | FStar_Syntax_Syntax.Sig_new_effect ed ->
          let uu____28623 =
            elim_uvars_aux_t env ed.FStar_Syntax_Syntax.univs
              ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature
             in
          (match uu____28623 with
           | (univs1,binders,signature) ->
               let uu____28657 =
                 let uu____28666 = FStar_Syntax_Subst.univ_var_opening univs1
                    in
                 match uu____28666 with
                 | (univs_opening,univs2) ->
                     let uu____28693 =
                       FStar_Syntax_Subst.univ_var_closing univs2  in
                     (univs_opening, uu____28693)
                  in
               (match uu____28657 with
                | (univs_opening,univs_closing) ->
                    let uu____28710 =
                      let binders1 = FStar_Syntax_Subst.open_binders binders
                         in
                      let uu____28716 =
                        FStar_Syntax_Subst.opening_of_binders binders1  in
                      let uu____28717 =
                        FStar_Syntax_Subst.closing_of_binders binders1  in
                      (uu____28716, uu____28717)  in
                    (match uu____28710 with
                     | (b_opening,b_closing) ->
                         let n1 = FStar_List.length univs1  in
                         let n_binders = FStar_List.length binders  in
                         let elim_tscheme uu____28741 =
                           match uu____28741 with
                           | (us,t) ->
                               let n_us = FStar_List.length us  in
                               let uu____28759 =
                                 FStar_Syntax_Subst.open_univ_vars us t  in
                               (match uu____28759 with
                                | (us1,t1) ->
                                    let uu____28770 =
                                      let uu____28779 =
                                        FStar_All.pipe_right b_opening
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
                                      let uu____28788 =
                                        FStar_All.pipe_right b_closing
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
                                      (uu____28779, uu____28788)  in
                                    (match uu____28770 with
                                     | (b_opening1,b_closing1) ->
                                         let uu____28815 =
                                           let uu____28824 =
                                             FStar_All.pipe_right
                                               univs_opening
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
                                           let uu____28833 =
                                             FStar_All.pipe_right
                                               univs_closing
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
                                           (uu____28824, uu____28833)  in
                                         (match uu____28815 with
                                          | (univs_opening1,univs_closing1)
                                              ->
                                              let t2 =
                                                let uu____28861 =
                                                  FStar_Syntax_Subst.subst
                                                    b_opening1 t1
                                                   in
                                                FStar_Syntax_Subst.subst
                                                  univs_opening1 uu____28861
                                                 in
                                              let uu____28862 =
                                                elim_uvars_aux_t env [] [] t2
                                                 in
                                              (match uu____28862 with
                                               | (uu____28885,uu____28886,t3)
                                                   ->
                                                   let t4 =
                                                     let uu____28905 =
                                                       let uu____28906 =
                                                         FStar_Syntax_Subst.close_univ_vars
                                                           us1 t3
                                                          in
                                                       FStar_Syntax_Subst.subst
                                                         b_closing1
                                                         uu____28906
                                                        in
                                                     FStar_Syntax_Subst.subst
                                                       univs_closing1
                                                       uu____28905
                                                      in
                                                   (us1, t4)))))
                            in
                         let elim_term t =
                           let uu____28915 =
                             elim_uvars_aux_t env univs1 binders t  in
                           match uu____28915 with
                           | (uu____28932,uu____28933,t1) -> t1  in
                         let elim_action a =
                           let action_typ_templ =
                             let body =
                               FStar_Syntax_Syntax.mk
                                 (FStar_Syntax_Syntax.Tm_ascribed
                                    ((a.FStar_Syntax_Syntax.action_defn),
                                      ((FStar_Util.Inl
                                          (a.FStar_Syntax_Syntax.action_typ)),
                                        FStar_Pervasives_Native.None),
                                      FStar_Pervasives_Native.None))
                                 FStar_Pervasives_Native.None
                                 (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                                in
                             match a.FStar_Syntax_Syntax.action_params with
                             | [] -> body
                             | uu____29007 ->
                                 FStar_Syntax_Syntax.mk
                                   (FStar_Syntax_Syntax.Tm_abs
                                      ((a.FStar_Syntax_Syntax.action_params),
                                        body, FStar_Pervasives_Native.None))
                                   FStar_Pervasives_Native.None
                                   (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                              in
                           let destruct_action_body body =
                             let uu____29032 =
                               let uu____29033 =
                                 FStar_Syntax_Subst.compress body  in
                               uu____29033.FStar_Syntax_Syntax.n  in
                             match uu____29032 with
                             | FStar_Syntax_Syntax.Tm_ascribed
                                 (defn,(FStar_Util.Inl
                                        typ,FStar_Pervasives_Native.None ),FStar_Pervasives_Native.None
                                  )
                                 -> (defn, typ)
                             | uu____29092 -> failwith "Impossible"  in
                           let destruct_action_typ_templ t =
                             let uu____29123 =
                               let uu____29124 =
                                 FStar_Syntax_Subst.compress t  in
                               uu____29124.FStar_Syntax_Syntax.n  in
                             match uu____29123 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (pars,body,uu____29145) ->
                                 let uu____29166 = destruct_action_body body
                                    in
                                 (match uu____29166 with
                                  | (defn,typ) -> (pars, defn, typ))
                             | uu____29211 ->
                                 let uu____29212 = destruct_action_body t  in
                                 (match uu____29212 with
                                  | (defn,typ) -> ([], defn, typ))
                              in
                           let uu____29261 =
                             elim_tscheme
                               ((a.FStar_Syntax_Syntax.action_univs),
                                 action_typ_templ)
                              in
                           match uu____29261 with
                           | (action_univs,t) ->
                               let uu____29270 = destruct_action_typ_templ t
                                  in
                               (match uu____29270 with
                                | (action_params,action_defn,action_typ) ->
                                    let a' =
                                      let uu___248_29311 = a  in
                                      {
                                        FStar_Syntax_Syntax.action_name =
                                          (uu___248_29311.FStar_Syntax_Syntax.action_name);
                                        FStar_Syntax_Syntax.action_unqualified_name
                                          =
                                          (uu___248_29311.FStar_Syntax_Syntax.action_unqualified_name);
                                        FStar_Syntax_Syntax.action_univs =
                                          action_univs;
                                        FStar_Syntax_Syntax.action_params =
                                          action_params;
                                        FStar_Syntax_Syntax.action_defn =
                                          action_defn;
                                        FStar_Syntax_Syntax.action_typ =
                                          action_typ
                                      }  in
                                    a')
                            in
                         let ed1 =
                           let uu___249_29313 = ed  in
                           let uu____29314 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ret_wp  in
                           let uu____29315 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_wp  in
                           let uu____29316 =
                             elim_tscheme ed.FStar_Syntax_Syntax.if_then_else
                              in
                           let uu____29317 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ite_wp  in
                           let uu____29318 =
                             elim_tscheme ed.FStar_Syntax_Syntax.stronger  in
                           let uu____29319 =
                             elim_tscheme ed.FStar_Syntax_Syntax.close_wp  in
                           let uu____29320 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assert_p  in
                           let uu____29321 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assume_p  in
                           let uu____29322 =
                             elim_tscheme ed.FStar_Syntax_Syntax.null_wp  in
                           let uu____29323 =
                             elim_tscheme ed.FStar_Syntax_Syntax.trivial  in
                           let uu____29324 =
                             elim_term ed.FStar_Syntax_Syntax.repr  in
                           let uu____29325 =
                             elim_tscheme ed.FStar_Syntax_Syntax.return_repr
                              in
                           let uu____29326 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_repr
                              in
                           let uu____29327 =
                             FStar_List.map elim_action
                               ed.FStar_Syntax_Syntax.actions
                              in
                           {
                             FStar_Syntax_Syntax.cattributes =
                               (uu___249_29313.FStar_Syntax_Syntax.cattributes);
                             FStar_Syntax_Syntax.mname =
                               (uu___249_29313.FStar_Syntax_Syntax.mname);
                             FStar_Syntax_Syntax.univs = univs1;
                             FStar_Syntax_Syntax.binders = binders;
                             FStar_Syntax_Syntax.signature = signature;
                             FStar_Syntax_Syntax.ret_wp = uu____29314;
                             FStar_Syntax_Syntax.bind_wp = uu____29315;
                             FStar_Syntax_Syntax.if_then_else = uu____29316;
                             FStar_Syntax_Syntax.ite_wp = uu____29317;
                             FStar_Syntax_Syntax.stronger = uu____29318;
                             FStar_Syntax_Syntax.close_wp = uu____29319;
                             FStar_Syntax_Syntax.assert_p = uu____29320;
                             FStar_Syntax_Syntax.assume_p = uu____29321;
                             FStar_Syntax_Syntax.null_wp = uu____29322;
                             FStar_Syntax_Syntax.trivial = uu____29323;
                             FStar_Syntax_Syntax.repr = uu____29324;
                             FStar_Syntax_Syntax.return_repr = uu____29325;
                             FStar_Syntax_Syntax.bind_repr = uu____29326;
                             FStar_Syntax_Syntax.actions = uu____29327;
                             FStar_Syntax_Syntax.eff_attrs =
                               (uu___249_29313.FStar_Syntax_Syntax.eff_attrs)
                           }  in
                         let uu___250_29330 = s  in
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_new_effect ed1);
                           FStar_Syntax_Syntax.sigrng =
                             (uu___250_29330.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___250_29330.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___250_29330.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___250_29330.FStar_Syntax_Syntax.sigattrs)
                         })))
      | FStar_Syntax_Syntax.Sig_sub_effect sub_eff ->
          let elim_tscheme_opt uu___121_29351 =
            match uu___121_29351 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (us,t) ->
                let uu____29382 = elim_uvars_aux_t env us [] t  in
                (match uu____29382 with
                 | (us1,uu____29410,t1) ->
                     FStar_Pervasives_Native.Some (us1, t1))
             in
          let sub_eff1 =
            let uu___251_29437 = sub_eff  in
            let uu____29438 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift_wp  in
            let uu____29441 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift  in
            {
              FStar_Syntax_Syntax.source =
                (uu___251_29437.FStar_Syntax_Syntax.source);
              FStar_Syntax_Syntax.target =
                (uu___251_29437.FStar_Syntax_Syntax.target);
              FStar_Syntax_Syntax.lift_wp = uu____29438;
              FStar_Syntax_Syntax.lift = uu____29441
            }  in
          let uu___252_29444 = s  in
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_sub_effect sub_eff1);
            FStar_Syntax_Syntax.sigrng =
              (uu___252_29444.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___252_29444.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___252_29444.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___252_29444.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_effect_abbrev
          (lid,univ_names,binders,comp,flags1) ->
          let uu____29454 = elim_uvars_aux_c env univ_names binders comp  in
          (match uu____29454 with
           | (univ_names1,binders1,comp1) ->
               let uu___253_29488 = s  in
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_effect_abbrev
                      (lid, univ_names1, binders1, comp1, flags1));
                 FStar_Syntax_Syntax.sigrng =
                   (uu___253_29488.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___253_29488.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___253_29488.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___253_29488.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_pragma uu____29491 -> s
      | FStar_Syntax_Syntax.Sig_splice uu____29492 -> s
  
let (erase_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  -> normalize [EraseUniverses; AllowUnboundUniverses] env t
  