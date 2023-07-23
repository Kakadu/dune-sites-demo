all:
	dune clean
	dune build @install --verbose -j1
	dune exec ./app.exe

clean:
	dune clean
	$(MAKE) -C 1 clean
