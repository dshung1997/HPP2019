CFLAGS=-Wall # -O3 -funroll-all-loops
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/


TYPE=ellipse
N=03000
NSTEPS=100

# TYPE=circles
# N=4
# NSTEPS=200

DELTA=0.00001
GR=0


INPUTFILE=../input_data/$(TYPE)_N_$(N).gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=$(TYPE)_N_$(N)_after$(NSTEPS)steps.gal

# INPUTFILE=../input_data/ellipse_N_$(N).gal

# OUTPUTPATH=../ref_output_data
# OUTPUTFILE=ellipse_N_$(N)_after$(NSTEPS)steps.gal


galsim: galsim.c galsim.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o point.o graphics.o $(LDFLAGS)
	./galsim $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)
	# ./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)
	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)

galsim.o: galsim.c point.h point.c
	gcc -c galsim.c $(CFLAGS)


# -------------------------------------------------------------------------------------------------------------------------
galsim_old: galsim_old.c galsim_old.o point.h point.c point.o graphics.o graphics.h graphics.c
	gcc -o galsim_old galsim_old.o point.o graphics.o $(LDFLAGS)
	./galsim_old $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(GR)
	# ./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)

galsim_old.o: galsim_old.c point.h point.c
	gcc -c galsim_old.c $(CFLAGS)
# ------------------------------------------------------------------------------------------------------------------------- 


point.o: point.c point.h
	gcc -c point.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim galsim-array test a.out *.o *.gal
