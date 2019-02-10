CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
PATHG=../graphics

galsim: galsim.o point.o graphics.o
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)

galsim.o: galsim.c point.h point.c
	gcc $(CFLAGS) -c galsim.c

point.o: point.c point.h
	gcc -c point.c

graphics.o: $(PATHG)/graphics.c $(PATHG)/graphics.h
	gcc $(CFLAGS) $(INCLUDES) -c $(PATHG)/graphics.c

clean:
	rm -f ./galsim *.o
