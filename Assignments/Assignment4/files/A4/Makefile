CFLAGS=-Wall # -O3 -funroll-all-loops
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm

# ../input_data/


TYPE=ellipse
N=02000
NSTEPS=200

DELTA=0.00001
THETA_MAX=0.25
GR=0


INPUTFILE=../input_data/$(TYPE)_N_$(N).gal

OUTPUTPATH=../ref_output_data
OUTPUTFILE=$(TYPE)_N_$(N)_after$(NSTEPS)steps.gal


# INPUTFILE=../input_data/circles_N_$(N).gal

# OUTPUTPATH=../ref_output_data
# OUTPUTFILE=circles_N_$(N)_after$(NSTEPS)steps.gal


galsim: galsim.c galsim.o Quad.h Quad.c Quad.o graphics.o graphics.h graphics.c
	gcc -o galsim galsim.o Quad.o graphics.o $(LDFLAGS)

galsim.o: galsim.c Quad.h Quad.c
	gcc -c galsim.c $(CFLAGS)

Quad.o: Quad.c Quad.h
	gcc -c Quad.c

############3
test2000: galsim
	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./compare 02000 ellipse_N_02000_after200steps.gal ../ref_output_data/ellipse_N_02000_after200steps.gal

test10: galsim
	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 00010 ../input_data/ellipse_N_00010.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./galsim 00010 ../input_data/ellipse_N_00010.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./compare 00010 ellipse_N_00010_after200steps.gal ../ref_output_data/ellipse_N_00010_after200steps.gal

test100: galsim
	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 00100 ../input_data/ellipse_N_00100.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./galsim 00100 ../input_data/ellipse_N_00100.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./compare 00100 ellipse_N_00100_after200steps.gal ../ref_output_data/ellipse_N_00100_after200steps.gal

test4-3: galsim
	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 4 ../input_data/circles_N_4.gal 3 $(DELTA) $(THETA_MAX) $(GR)
	./galsim 4 ../input_data/circles_N_4.gal 3 $(DELTA) $(THETA_MAX) $(GR)
	./compare 4 circles_N_4_after3steps.gal ../ref_output_data/circles_N_4_after3steps.gal

test4-200: galsim
	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 4 ../input_data/circles_N_4.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./galsim 4 ../input_data/circles_N_4.gal 200 $(DELTA) $(THETA_MAX) $(GR)
	./compare 4 circles_N_4_after200steps.gal ../ref_output_data/circles_N_4_after200steps.gal








############3
graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) 

clean:
	rm -f galsim galsim-array test a.out *.o *.gal
