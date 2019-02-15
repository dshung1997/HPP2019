CFLAGS-NONE= -w # -Wall # -O3 -funroll-all-loops
CFLAGS-FULL= -O3 -funroll-all-loops -w # -Wall

INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/

N=00100
NSTEPS=200

DELTA=0.00001
GR=0


INPUTFILE=../input_data/ellipse_N_$(N).gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=ellipse_N_$(N)_after$(NSTEPS)steps.gal




# -------------------------------------------------------------------------------------------------------------------------
galsim-old-none: galsim-old.c galsim-old-none.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim-old-none galsim-old-none.o point.o graphics.o $(LDFLAGS)
	./galsim-old-none $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)

galsim-old-none.o: galsim-old.c point.h point.c
	gcc -c -O galsim-old.c  $(CFLAGS-NONE)
	mv galsim-old.o galsim-old-none.o
# ------------------------------------------------------------------------------------------------------------------------- 


# -------------------------------------------------------------------------------------------------------------------------
galsim-old-full: galsim-old.c galsim-old-full.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim-old-full galsim-old-full.o point.o graphics.o $(LDFLAGS)
	./galsim-old-full $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)

galsim-old-full.o: galsim-old.c point.h point.c
	gcc -c -O galsim-old.c  $(CFLAGS-NONE)
	mv galsim-old.o galsim-old-full.o
# ------------------------------------------------------------------------------------------------------------------------- 


# -------------------------------------------------------------------------------------------------------------------------
galsim-new-none: galsim-new.c galsim-new-none.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim-new-none galsim-new-none.o point.o graphics.o $(LDFLAGS)
	./galsim-new-none $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)

galsim-new-none.o: galsim-new.c point.h point.c
	gcc -c -O galsim-new.c  $(CFLAGS-NONE)
	mv galsim-new.o galsim-new-none.o
# ------------------------------------------------------------------------------------------------------------------------- 


# -------------------------------------------------------------------------------------------------------------------------
galsim-new-full: galsim-new.c galsim-new-full.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim-new-full galsim-new-full.o point.o graphics.o $(LDFLAGS)
	./galsim-new-full $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)

galsim-new-full.o: galsim-new.c point.h point.c
	gcc -c -O galsim-new.c  $(CFLAGS-NONE)
	mv galsim-new.o galsim-new-full.o
# ------------------------------------------------------------------------------------------------------------------------- 



point.o: point.c point.h
	gcc -c point.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim galsim-array test a.out *.o *.gal
