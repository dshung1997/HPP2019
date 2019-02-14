CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
PATHG=../graphics

INPUTFILE=../input_data/circles_N_4.gal
OUTPUTFILE=circles_N_4_after200steps.gal
N=4
NSTEPS=200
GR=0


galsim: galsim.o galsim.c point.o graphics.o
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)
	./galsim $(N) $(INPUTFILE) $(NSTEPS) 0 $(GR) $(OUTPUTFILE)

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)



galsim-100: galsim-100.o galsim-100.c point.o graphics.o
	gcc -o galsim-100 galsim-100.o point.o graphics.o $(LDFLAGS)
	./galsim-100 $(N) $(INPUTFILE) $(NSTEPS) 0 $(GR) $(OUTPUTFILE)
	./../compare_gal_files/compare $(N) $(OUTPUTFILE) ../ref_output_data/$(OUTPUTFILE)

galsim-100.o: galsim-100.c point.h point.c
	gcc -c galsim-100.c $(CFLAGS)


point.o: point.c point.h
	gcc -c point.c

graphics.o: $(PATHG)/graphics.c $(PATHG)/graphics.h
	gcc $(INCLUDES) -c $(PATHG)/graphics.c $(CFLAGS) 

compare: galsim
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)
	./galsim $(N) $(INPUTFILE) $(NSTEPS) 0 $(GR) $(OUTPUTFILE)
	./../compare_gal_files/compare $(N) $(OUTPUTFILE) ../ref_output_data/$(OUTPUTFILE)

test: test.o test.c point.o graphics.o
	gcc -o test test.o point.o graphics.o $(LDFLAGS)

test.o: test.c point.h point.c
	gcc -c test.c $(CFLAGS)

clean:
	rm -f ./galsim ./test ./a.out *.gal *.o $(OUTPUTFILE) galsim-normal test-struct
