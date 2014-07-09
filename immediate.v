(* Original Arm definition *)

(* New Thumb-2 definition *)
  let m :=  
    if (Int.eq n (Int.repr (-256))) then 
      (Int.repr 0) 
    else 
      n 
    in
      m 
    else Int.zero_ext 12 x.