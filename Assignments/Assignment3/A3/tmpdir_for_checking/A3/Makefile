CFLAGS=-Wall -O3 -funroll-all-loops
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

galsim: galsim.c galsim.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)

point.o: point.c point.h
	gcc -c point.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim *.o