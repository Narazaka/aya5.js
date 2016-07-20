all:
	cd aya5_240 && $(MAKE) -f makefile.emscripten
	cp aya5_240/aya5.js aya5.js

clean:
	cd aya5_240 && $(MAKE) -f makefile.emscripten clean
