class istack =
  object
    val mutable v = [ 0; 2 ]

    method pop =
      match v with
      | hd :: tl ->
          v <- tl;
          Some hd
      | [] -> None

    method push hd = v <- hd :: v
  end

(* let e x = Unix._exit x *)
let () =
  let ctx = Llvm.create_context () in
  let i1 = Llvm.i1_type ctx in
  print_endline (Llvm.string_of_lltype i1)

let () = print_endline "Obj_test plugin initialized"
