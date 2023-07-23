OPT=ocamlopt.opt

all:
	$(OPT) -shared -o obj_test.cmxs -linkall -I `ocamlfind query llvm` `ocamlfind query llvm`/shared/llvm.cmxa `ocamlfind query unix`/unix.cmxa obj_test.ml
	$(OPT) -linkall `ocamlfind query dynlink`/dynlink.cmxa main.ml
	./a.out obj_test.cmxs

ocamlfind:
	ocamlfind opt -shared -o obj_test.cmxs obj_test.ml -package llvm,unix -linkall -linkpkg -verbose
	ocamlfind opt -package dynlink -linkpkg main.ml -linkall -verbose
	./a.out obj_test.cmxs

clean:
	$(RM) *.cm[ioxa] *.cmxs *.out *.o
