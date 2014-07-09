| Pbtbl_small(r, tbl) ->
  (* 8 bit jump table *)
  (* TBB [Rn, Rm], PC = PC + ZeroExtend( Memory( Rn + Rm, 1) << 1). *)
  (* Branch range 4-512. Rn can be PC *)
  let lbl = new_label() in
  fprintf oc "    tbb [pc, %a]   \n" ireg r; 
  fprintf oc ".L%d:\n" lbl; (* start of jump table *)
  List.iter
    (fun l -> fprintf oc "	.byte	(%a - .L%d) >> 1\n" print_label l lbl)
    tbl;
  fprintf oc "    .balign 2\n" 
  1 + List.length tbl