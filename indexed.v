Definition indexed_memory_access    (mk_instr: ireg -> int -> instruction)    (mk_immed: int -> int)    (base: ireg) (n: int) (k: code) :=  let n1 := mk_immed n in  if Int.eq n n1 then 
    mk_instr base n :: k  else 
    addimm IR14 base (Int.sub n n1) 
    (mk_instr IR14 n1 :: k).