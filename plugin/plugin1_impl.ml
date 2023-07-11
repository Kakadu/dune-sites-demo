let () =
  print_endline "Registration of Plugin1";
  Queue.add (fun () -> print_endline "Plugin1 is doing something...") Registration.todo


let foo l r name b = Llvm.build_add l r name b
let e x = Unix._exit x 