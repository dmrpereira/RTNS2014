(* Definition used both in Arm and Thumb-2 *)
Definition transl_shift_addr 
    (s: shift) (r: ireg) : shift_addr :=

(* Old Arm Definition *)
Definition transl_memory_access
      option (ireg -> shift_addr -> instruction))
    (k: code) :=


(* New Thumb-2 Definitions *)
Definition is_thumb_2 (x: int) : bool :=
  Int.lt x (Int.repr 4).

Definition transl_memory_access
        Pmov IR14 (transl_shift s r2) ::
        f r1 (SAlsl IR14 (Int.repr 0)) :: k) in
          (* fits the thumb-2 directly *)
    ...| None =>