(* load all the available plugins *)
let () = Sites.Plugins.Plugins.load_all ()
(* Execute the code registered by the plugins *)
let () = Queue.iter (fun f -> f ()) C_register.todo
