(* Definition used both in Arm and Thumb-2 *)
Definition transl_shift_addr 
    (s: shift) (r: ireg) : shift_addr :=  match s with  | Slsl n => SAlsl r (s_amount n)  | Slsr n => SAlsr r (s_amount n)  | Sasr n => SAasr r (s_amount n)  | Sror n => SAror r (s_amount n)  end.

(* Old Arm Definition *)
Definition transl_memory_access    (mk_instr_imm: ireg -> int -> instruction)    (mk_instr_gen: 
      option (ireg -> shift_addr -> instruction))    (mk_immed: int -> int)    (addr: addressing) (args: list mreg) 
    (k: code) :=  match addr, args with  ...  | Aindexed2shift s, a1 :: a2 :: nil =>    match mk_instr_gen with    | Some f =>      do r1 <- ireg_of a1; do r2 <- ireg_of a2;      OK (f r1 (transl_shift_addr s r2) :: k)    | None =>        Error (msg "Asmgen.Aindexed2shift")    end  ...  | _, _ =>    Error(msg "Asmgen.transl_memory_access")  end.


(* New Thumb-2 Definitions *)
Definition is_thumb_2 (x: int) : bool :=  Int.lt (Int.repr (-1)) x && 
  Int.lt x (Int.repr 4).

Definition transl_memory_access  ...  | Aindexed2shift s, a1 :: a2 :: nil =>    match mk_instr_gen with    | Some f =>      do r1 <- ireg_of a1; do r2 <- ireg_of a2;      let two := OK (
        Pmov IR14 (transl_shift s r2) ::
        f r1 (SAlsl IR14 (Int.repr 0)) :: k) in      match s with      | Slsl n =>         (* r1, base register for address				*)        (* r2, register to be shifted by s		*)        (* s,  shift operation    						*)        if (is_thumb_2 n.(s_amount)) then
          (* fits the thumb-2 directly *)          OK (f r1 (transl_shift_addr s r2) :: k)            else (* two instructions *)          two           | _ => (* two instructions *)          two        end
    ...| None =>      Error (msg "Asmgen.Aindexed2shift")    end  ...  
