CFLAGS=-Wall -O3 -funroll-all-loops
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/


N=00900
NSTEPS=200

DELTA=0.00001
GR=0


INPUTFILE=../input_data/ellipse_N_$(N).gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=ellipse_N_$(N)_after$(NSTEPS)steps.gal


galsim: galsim.c galsim.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)
	./galsim $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)
	# ./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)


# -------------------------------------------------------------------------------------------------------------------------
galsim-array: galsim-array.c galsim-array.o graphics.o graphics.h graphics.c
	gcc -o galsim-array galsim-array.o graphics.o $(LDFLAGS)
	./galsim-array $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)
	# ./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)

galsim-array.o: galsim-array.c
	gcc -c galsim-array.c $(CFLAGS)
# ------------------------------------------------------------------------------------------------------------------------- 


point.o: point.c point.h
	gcc -c point.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim galsim-array test a.out *.o *.gal
