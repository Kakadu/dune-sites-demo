OPT=ocamlopt.opt
#-ccopt -L`opam var lib`/stublibs \
#-ccopt -L`opam var lib`/ocaml/stublibs \

all:
	$(OPT) -shared -o obj_test.cmxs -linkall \
		-I `ocamlfind query llvm` \
		`ocamlfind query llvm`/shared/llvm.cmxa \
		`ocamlfind query unix`/unix.cmxa \
		obj_test.ml \
		-verbose
	$(OPT) -linkall `ocamlfind query dynlink`/dynlink.cmxa main.ml
	ls
	./a.out obj_test.cmxs

ocamlfind:
	ocamlfind opt -shared -o obj_test.cmxs obj_test.ml -package llvm,unix -linkall -linkpkg -verbose
	ocamlfind opt -package dynlink -linkpkg main.ml -linkall -verbose
	./a.out obj_test.cmxs

clean:
	$(RM) *.cm[ioxa] *.cmxs *.out *.o
