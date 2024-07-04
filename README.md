```
$ make
...
dune build @install
dune exec ./app.exe
Fatal error: exception Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll \"Failure(\\\"/home/kakadu/asp/dune-sites-demo/_build/install/default/lib/plugin1/plugin1_impl/plugin1_impl.cmxs: undefined symbol: llvm_build_add\\\")\")")
make: *** [Makefile:4: all] Error 2
```

But when I link a stub from Unix module and not Llvm, it works fine. Is something wrong with LLVM ocaml package?

P.S. I made the similar stuff in `findlib` directory without dune. It looks like dune is guilty part...

```
make: Entering directory '/media/oldwork/asp/dune-sites-demo/findlib'
ocamlfind opt -shared -o obj_test.cmxs obj_test.ml -package llvm,unix -linkall -linkpkg -verbose
Effective set of compiler predicates: pkg_llvm,pkg_unix,autolink,native
+ ocamlopt.opt -shared -o obj_test.cmxs -linkall -verbose -I /media/work2/.opam/llvm16/lib/llvm /media/work2/.opam/llvm16/lib/llvm/shared/llvm.cmxa /media/work2/.opam/llvm16/lib/ocaml/unix.cmxa obj_test.ml
+ as  -o 'obj_test.o' '/tmp/camlasm70e28a.s'
+ as  -o 'obj_test.cmxs.startup.o' '/tmp/camlstartup599fd9.s'
+ gcc -shared  -o 'obj_test.cmxs'  '-L/media/work2/.opam/llvm16/lib/llvm' '-L/media/work2/.opam/llvm16/lib/ocaml' -L/media/work2/.opam/llvm16/lib/llvm/shared/../.. \
    -Wl,-rpath,/media/work2/.opam/llvm16/lib/llvm/shared/../.. -Wl,-rpath,/usr/lib/llvm-14/lib \
    'obj_test.cmxs.startup.o' 'obj_test.o' '/media/work2/.opam/llvm16/lib/ocaml/unix.a' '/media/work2/.opam/llvm16/lib/llvm/shared/llvm.a' \
    '-lunix' '-lllvm' '-L/usr/lib/llvm-14/lib' '-lstdc++' '-lLLVM-14' '-lrt' '-ldl' '-lm''-lz' '-ltinfo'
ocamlfind opt -package dynlink -linkpkg main.ml -linkall -verbose
Effective set of compiler predicates: pkg_dynlink,autolink,native
+ ocamlopt.opt -linkall -verbose /media/work2/.opam/llvm16/lib/ocaml/dynlink.cmxa main.ml
+ as  -o 'main.o' '/tmp/camlasm79a830.s'
+ as  -o '/tmp/camlstartupe86a6a.o' '/tmp/camlstartupe6202d.s'
+ gcc -O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -fno-common-fexcess-precision=standard -fno-tree-vrp -ffunction-sections  \
    -Wl,-E  -o 'a.out'  '-L/media/work2/.opam/llvm16/lib/ocaml' -Wl,-E '/tmp/camlstartupe86a6a.o' \
    '/media/work2/.opam/llvm16/lib/ocaml/std_exit.o' 'main.o' \
    '/media/work2/.opam/llvm16/lib/ocaml/dynlink.a' '/media/work2/.opam/llvm16/lib/ocaml/stdlib.a' \
    '/media/work2/.opam/llvm16/lib/ocaml/libasmrun.a' -lm
./a.out obj_test.cmxs
i1
Obj_test plugin initialized
```
