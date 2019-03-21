CFLAGS=-Wall -O3 -funroll-all-loops -march=native
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

galsim: galsim.c galsim.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS) $(CFLAGS) 

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)

point.o: point.c point.h
	gcc -c point.c $(CFLAGS)

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS)

clean:
	rm -f galsim *.o gmon.out result.gal

test2000: galsim
	./galsim 2000 ../input_data/ellipse_N_02000.gal 200 0.00001 0

test3000: galsim
	./galsim 3000 ../input_data/ellipse_N_03000.gal 100 0.00001 0