all:
	dune clean 
	dune build @install --verbose -j1 
	dune exec ./app.exe
