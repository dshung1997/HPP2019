CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/
INPUTFILE=../input_data/circles_N_4.gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=circles_N_4_after200steps.gal

N=4
NSTEPS=200
DELTA=0.00001
GR=0

galsim: galsim.c galsim.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)
	./galsim $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)
	./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)

point.o: point.c point.h
	gcc -c point.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim test a.out *.o $(OUTPUTFILE)
