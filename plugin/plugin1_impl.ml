let () =
  print_endline "Registration of Plugin1";
  Queue.add (fun () -> print_endline "Plugin1 is doing something...") Registration.todo

let e x = Unix._exit x
let () =
  let ctx = Llvm.create_context () in
  let i1 = Llvm.i1_type ctx in
  print_endline (Llvm.string_of_lltype i1)

