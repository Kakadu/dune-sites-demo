let load_test_plugin fname =
  let fname =  Dynlink.adapt_filename fname in
  try
    Dynlink.loadfile fname
  with
  | (Dynlink.Error err) as e ->
     print_endline ("ERROR loading plugin: " ^ (Dynlink.error_message err));
     raise e

let _ =
  load_test_plugin Sys.argv.(1)
