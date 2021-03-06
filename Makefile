CFLAGS = -g -O2 -flto -Wall -Wextra -Wconversion -Wno-sign-conversion -Wno-unused-parameter -std=c99

norebo: Runtime/norebo.c Runtime/risc-cpu.c Runtime/risc-cpu.h
	$(CC) -o $@ Runtime/norebo.c Runtime/risc-cpu.c $(CFLAGS)

imagerv: norebo
	make clean; make
	./build-image.py -r OberonRV/Oberon

clean:
	rm -f norebo
	rm -rf build imagebuild
