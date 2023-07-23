class istack = object
    val mutable v = [0; 2]

    method pop =
      match v with
      | hd :: tl ->
          v <- tl;
          Some hd
      | [] -> None

    method push hd =
      v <- hd :: v
  end


let e x = Unix._exit x
let foo l r name b = Llvm.build_add l r name b
let () = print_endline "Obj_test plugin initialized"
