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


A dune log


```
Running[1]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -I .app.eobjs/byte-I .app.eobjs/native -I /media/work2/.opam/llvm16/lib/dune-site -intf-suffix .ml-gen -no-alias-deps -opaque -o .app.eobjs/native/dune_site__Dune_site_data.cmx -c -impl .app.eobjs/dune_site__Dune_site_data.ml-gen)
Running[2]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -I .app.eobjs/byte-I .app.eobjs/native -I /media/work2/.opam/llvm16/lib/dune-site/plugins -intf-suffix .ml-gen -no-alias-deps -opaque -o .app.eobjs/native/dune_site_plugins__Dune_site_plugins_data.cmx -c -impl .app.eobjs/dune_site_plugins__Dune_site_plugins_data.ml-gen)
Running[3]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamldep.opt -modules -impl app.ml) > _build/default/.app.eobjs/dune__exe__App.impl.d
Running[4]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -bin-annot -I .registration.objs/byte -no-alias-deps -opaque -o .registration.objs/byte/registration.cmo -c -impl registration.ml)
Running[5]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamldep.opt -modules -impl Sites.ml) > _build/default/.app.eobjs/dune__exe__Sites.impl.d
Running[6]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -I .registration.objs/byte -I .registration.objs/native -intf-suffix .ml -no-alias-deps -opaque -o .registration.objs/native/registration.cmx -c -impl registration.ml)
Running[7]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -bin-annot -I plugin/.plugin1_impl.objs/byte -I /media/work2/.opam/llvm16/lib/llvm -I .registration.objs/byte -no-alias-deps -opaque -o plugin/.plugin1_impl.objs/byte/plugin1_impl.cmo -c -impl plugin/plugin1_impl.ml)
Running[8]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -a -o registration.cmxa .registration.objs/native/registration.cmx)
Running[9]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -w @1..3@5..28@30..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -bin-annot -I .app.eobjs/byte -no-alias-deps -opaque -o .app.eobjs/byte/dune__exe.cmo -c -impl .app.eobjs/dune__exe.ml-gen)
Running[10]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamldep.opt -modules -intf app.mli) > _build/default/.app.eobjs/dune__exe__App.intf.d
Running[11]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -linkall -I plugin/.plugin1_impl.objs/byte -I plugin/.plugin1_impl.objs/native -I /media/work2/.opam/llvm16/lib/llvm -I .registration.objs/byte -I .registration.objs/native -intf-suffix .ml -no-alias-deps-opaque -o plugin/.plugin1_impl.objs/native/plugin1_impl.cmx -c -impl plugin/plugin1_impl.ml)
Running[12]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -a -o plugin/plugin1_impl.cma plugin/.plugin1_impl.objs/byte/plugin1_impl.cmo)
Running[13]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -w @1..3@5..28@30..39@43@46..47@49..57@61..62@67@69-40 -strict-sequence -strict-formats -short-paths -keep-locs -w -49 -nopervasives -nostdlib -g -I .app.eobjs/byte -I .app.eobjs/native -intf-suffix .ml-gen -no-alias-deps -opaque -o .app.eobjs/native/dune__exe.cmx -c -impl .app.eobjs/dune__exe.ml-gen)
Running[14]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -bin-annot -I .app.eobjs/byte -I /media/work2/.opam/llvm16/lib/dune-private-libs/dune-section -I /media/work2/.opam/llvm16/lib/dune-private-libs/meta_parser -I /media/work2/.opam/llvm16/lib/dune-site -I /media/work2/.opam/llvm16/lib/dune-site/dynlink -I /media/work2/.opam/llvm16/lib/dune-site/plugins-I /media/work2/.opam/llvm16/lib/dune-site/private -I .registration.objs/byte -no-alias-deps -opaque -open Dune__exe -o .app.eobjs/byte/dune__exe__Sites.cmo -c -impl Sites.ml)
Running[15]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -bin-annot -I .app.eobjs/byte -I /media/work2/.opam/llvm16/lib/dune-private-libs/dune-section -I /media/work2/.opam/llvm16/lib/dune-private-libs/meta_parser -I /media/work2/.opam/llvm16/lib/dune-site -I /media/work2/.opam/llvm16/lib/dune-site/dynlink -I /media/work2/.opam/llvm16/lib/dune-site/plugins-I /media/work2/.opam/llvm16/lib/dune-site/private -I .registration.objs/byte -no-alias-deps -opaque -open Dune__exe -o .app.eobjs/byte/dune__exe__App.cmi -c -intf app.mli)
Running[16]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -linkall -a -oplugin/plugin1_impl.cmxa plugin/.plugin1_impl.objs/native/plugin1_impl.cmx)
Running[17]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -I .app.eobjs/byte -I .app.eobjs/native -I /media/work2/.opam/llvm16/lib/dune-private-libs/dune-section -I /media/work2/.opam/llvm16/lib/dune-private-libs/meta_parser -I /media/work2/.opam/llvm16/lib/dune-site -I /media/work2/.opam/llvm16/lib/dune-site/dynlink -I /media/work2/.opam/llvm16/lib/dune-site/plugins -I /media/work2/.opam/llvm16/lib/dune-site/private -I .registration.objs/byte -I .registration.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Dune__exe -o .app.eobjs/native/dune__exe__Sites.cmx -c -impl Sites.ml)
Running[18]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -I .app.eobjs/byte -I .app.eobjs/native -I /media/work2/.opam/llvm16/lib/dune-private-libs/dune-section -I /media/work2/.opam/llvm16/lib/dune-private-libs/meta_parser -I /media/work2/.opam/llvm16/lib/dune-site -I /media/work2/.opam/llvm16/lib/dune-site/dynlink -I /media/work2/.opam/llvm16/lib/dune-site/plugins -I /media/work2/.opam/llvm16/lib/dune-site/private -I .registration.objs/byte -I .registration.objs/native -intf-suffix .ml -no-alias-deps -opaque -open Dune__exe -o .app.eobjs/native/dune__exe__App.cmx -c -impl app.ml)

Running[19]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -linkall -shared -linkall -I plugin -o plugin/plugin1_impl.cmxs plugin/plugin1_impl.cmxa)

Running[20]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -o app.exe -linkall registration.cmxa /media/work2/.opam/llvm16/lib/dune-private-libs/dune-section/dune_section.cmxa /media/work2/.opam/llvm16/lib/dune-site/private/dune_site_private.cmxa .app.eobjs/native/dune_site__Dune_site_data.cmx /media/work2/.opam/llvm16/lib/dune-site/dune_site.cmxa /media/work2/.opam/llvm16/lib/dune-private-libs/meta_parser/dune_meta_parser.cmxa /media/work2/.opam/llvm16/lib/ocaml/dynlink.cmxa -I /media/work2/.opam/llvm16/lib/ocaml /media/work2/.opam/llvm16/lib/dune-site/dynlink/dune_site_dynlink_linker.cmxa .app.eobjs/native/dune_site_plugins__Dune_site_plugins_data.cmx /media/work2/.opam/llvm16/lib/dune-site/plugins/dune_site_plugins.cmxa .app.eobjs/native/dune__exe.cmx .app.eobjs/native/dune__exe__Sites.cmx .app.eobjs/native/dune__exe__App.cmx)
Running[21]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -shared -linkall -I . -o registration.cmxs registration.cmxa)
Running[22]: (cd _build/default && /media/work2/.opam/llvm16/bin/ocamlc.opt -g -a -o registration.cma .registration.objs/byte/registration.cmo)
File "run.t", line 1, characters 0-0:
diff --git a/_build/.sandbox/ec631c7ad4afb4475904efd369ac6935/default/run.t b/_build/.sandbox/ec631c7ad4afb4475904efd369ac6935/default/run.t.corrected
index 1978996..90f4af6 100644
--- a/_build/.sandbox/ec631c7ad4afb4475904efd369ac6935/default/run.t
+++ b/_build/.sandbox/ec631c7ad4afb4475904efd369ac6935/default/run.t.corrected
@@ -1,2 +1,4 @@
$ export DUNE_SITE_VERBOSE=1
-  $ ./app.exe
\ No newline at end of file
+  $ ./app.exe
+  Fatal error: exception Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll \"Failure(\\\"/media/oldwork/asp/dune-sites-demo/_build/install/default/lib/plugin1/plugin1_impl/plugin1_impl.cmxs: undefined symbol: llvm_create_context\\\")\")")
+  [2]
```


I'm trying to hack this my a manual command

```
(cd _build/default && /media/work2/.opam/llvm16/bin/ocamlopt.opt -g -linkall -shared -linkall -I plugin -o plugin/plugin1_impl.cmxs plugin/plugin1_impl.cmxa -I /media/work2/.opam/llvm16/lib/llvm /media/work2/.opam/llvm16/lib/llvm/shared/llvm.cmxa -verbose  )
```

But After that the main app misbehaves with another error `Uninitialized_global`

```
Fatal error: exception Dynlink.Error (Dynlink.Linking_error ("/media/oldwork/asp/dune-sites-demo/_build/install/default/lib/plugin1/plugin1_impl/plugin1_impl.cmxs", Dynlink.Uninitialized_global "Llvm"))
```

Don't know what to do with this yet...