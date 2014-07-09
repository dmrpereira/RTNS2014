(* Original Arm definition *)Definition mk_immed_mem_word (x: int) : int :=  Int.sign_ext 13 x.

(* New Thumb-2 definition *)Definition mk_immed_mem_word (x: int) : int :=  (* signed 9 bit, -256.. 255 *)  let n := Int.sign_ext 9 x in   (* check edge case -256 *) 
  let m :=  
    if (Int.eq n (Int.repr (-256))) then 
      (Int.repr 0) 
    else 
      n 
    in    if Int.lt x (Int.repr 0) then 
      m 
    else Int.zero_ext 12 x.