let () =
  print_endline "registration in b.ml";
  Queue.add (fun () -> print_endline "B is doing something") C_register.todo
