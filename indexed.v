Definition indexed_memory_access
    mk_instr base n :: k
    addimm IR14 base (Int.sub n n1) 
    (mk_instr IR14 n1 :: k).