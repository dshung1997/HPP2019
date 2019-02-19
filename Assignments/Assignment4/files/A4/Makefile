CFLAGS=-Wall # -O3 -funroll-all-loops
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/


N=00010
NSTEPS=200

DELTA=0.00001
THETA_MAX=0.86
GR=0


INPUTFILE=../input_data/ellipse_N_$(N).gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=ellipse_N_$(N)_after$(NSTEPS)steps.gal


galsim: galsim.c galsim.o Quad.h Quad.c Quad.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o Quad.o graphics.o $(LDFLAGS)
	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim $(N) $(INPUTFILE) $(NSTEPS) $(DELTA) $(THETA_MAX) $(GR)
	# ./compare $(N) $(OUTPUTFILE) $(OUTPUTPATH)/$(OUTPUTFILE)

galsim.o: galsim.c Quad.h Quad.c
	gcc -c galsim.c $(CFLAGS)

Quad.o: Quad.c Quad.h
	gcc -c Quad.c

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim galsim-array test a.out *.o *.gal
