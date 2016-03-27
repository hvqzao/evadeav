.PHONY: all 32 64 requirements clean

all:	32

payload-xored.h:	payload.h
	python xor.py

32:	evadeav.c payload-xored.h
	@echo "Compiling for i686 (default). For x86_64, use make 64"
	i686-w64-mingw32-gcc evadeav.c -o evadeav.exe

64:	evadeav.c payload-xored.h
	@echo "Compiling for x86_64."
	x86_64-w64-mingw32-gcc evadeav.c -o evadeav.exe

requirements:
	sudo aptitude install gcc-mingw-w64-i686 gcc-mingw-w64-x86-64

clean:
	for i in evadeav.exe payload-xored.h ; do rm $$i >/dev/null 2>&1 || true ; done
