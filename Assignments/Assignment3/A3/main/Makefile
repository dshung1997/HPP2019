CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
PATHG=../graphics

galsim: galsim.o galsim.c point.o graphics.o
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)

galsim.o: galsim.c point.h point.c
	gcc $(CFLAGS) -c galsim.c

point.o: point.c point.h
	gcc -c point.c

graphics.o: $(PATHG)/graphics.c $(PATHG)/graphics.h
	gcc $(CFLAGS) $(INCLUDES) -c $(PATHG)/graphics.c

compare: galsim ellipse_N_00010_after200steps.gal
	./../compare_gal_files/compare 10 ellipse_N_00010_after200steps.gal ../ref_output_data/ellipse_N_00010_after200steps.gal

test: test.o test.c point.o graphics.o
	gcc -o test test.o point.o graphics.o $(LDFLAGS)

test.o: test.c point.h point.c
	gcc $(CFLAGS) -c test.c

clean:
	rm -f ./galsim ./test ./a.out *.gal *.o
