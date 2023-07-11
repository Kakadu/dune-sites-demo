```
$ make 
...
dune exec ./app.exe                
Fatal error: exception Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll \"Failure(\\\"/home/kakadu/asp/dune-sites-demo/_build/install/default/lib/plugin1/plugin1_impl/plugin1_impl.cmxs: undefined symbol: llvm_build_add\\\")\")")
make: *** [Makefile:4: all] Error 2
```

But when I link a stub from Unix module and not Llvm, it works fine? Is something wrong with LLVM ocaml package?

