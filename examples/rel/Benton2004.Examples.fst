module Benton2004.Examples
open Benton2004

#reset-options "--z3rlimit 128"

let fig3_d1
  (x: var)
  (phi: sttype)
: Lemma
  (requires (
    x `st_fresh_in` phi
  ))
  (ensures (
    x `st_fresh_in` phi /\
    exec_equiv
      (st_cons phi x (ns_singl 3))
      (st_cons phi x (ns_singl 7))
      (ifthenelse (eop op_Equality (evar x) (const 3)) (assign x (const 7)) skip)
      (assign x (const 7))
  ))
= d_op_singl (op_Equality #int) 3 3 (evar x) (evar x) (const 3) (const 3) (st_cons phi x (ns_singl 3))
  // the rest is automatically inferred through patterns

let fig3_d2
  (x: var)
  (phi: sttype)
  (z: var)
: Lemma
  (requires (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z
  ))
  (ensures (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z /\
    exec_equiv
      (st_cons (st_cons phi x (ns_singl 7)) z ns_t)
      (st_cons (st_cons phi x ns_t) z (ns_singl 8))
      (assign z (eop op_Addition (evar x) (const 1)))
      (assign z (const 8))
  ))
= d_op_singl op_Addition 7 1 (evar x) (evar x) (const 1) (const 1) (st_cons phi x (ns_singl 7));
  assert (
    exec_equiv
      (st_cons (st_cons phi x (ns_singl 7)) z ns_t)
      (st_cons (st_cons phi x (ns_singl 7)) z (ns_singl 8))
      (assign z (eop op_Addition (evar x) (const 1)))
      (assign z (const 8))  
  )

let fig3_d3
  (x: var)
  (phi: sttype)
  (z: var)
: Lemma
  (requires (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z
  ))
  (ensures (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z /\
    exec_equiv
      (st_cons (st_cons phi x (ns_singl 3)) z ns_t)
      (st_cons (st_cons phi x ns_t) z (ns_singl 8))
      (seq (assign x (const 7)) (assign z (const 8)))
      (assign z (const 8))
  ))
= d_das x (const 7) (st_cons phi z ns_t) (ns_singl 3);
  d_assign (st_cons phi x ns_t) z ns_t (ns_singl 8) (const 8) (const 8)

let fig3
  (x: var)
  (phi: sttype)
  (z: var)
: Lemma
  (requires (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z
  ))
  (ensures (
    x `st_fresh_in` phi /\
    z `st_fresh_in` phi /\
    x <> z /\
    exec_equiv
      (st_cons (st_cons phi x (ns_singl 3)) z ns_t)
      (st_cons (st_cons phi x ns_t) z (ns_singl 8))
      (seq (ifthenelse (eop op_Equality (evar x) (const 3)) (assign x (const 7)) skip) (assign z (eop op_Addition (evar x) (const 1))))
      (assign z (const 8))
  ))
= fig3_d1 x (st_cons phi z ns_t);
  d_csub // this step is IMPLICIT, BENTON DID NOT MENTION IT IN THE PROOF TREE
    (st_cons (st_cons phi z ns_t) x (ns_singl 3))
    (st_cons (st_cons phi z ns_t) x (ns_singl 7))
    (st_cons (st_cons phi x (ns_singl 3)) z ns_t)
    (st_cons (st_cons phi x (ns_singl 7)) z ns_t)
    (ifthenelse (eop op_Equality (evar x) (const 3)) (assign x (const 7)) skip)
    (assign x (const 7));
  fig3_d2 x phi z;
  fig3_d3 x phi z
