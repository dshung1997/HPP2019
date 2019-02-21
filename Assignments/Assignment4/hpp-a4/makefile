CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm -g
GRAPHICS=1
THETAMAX=0.256
OPTFLAGS=-O3
galsim: galsim.o graphics.o
	gcc $(CFLAGS) -o galsim galsim.o graphics.o $(LDFLAGS) $(OPTFLAGS)
galsim.o: galsim.c ./graphics/graphics.h
	gcc $(CFLAGS) $(INCLUDES) -c galsim.c $(OPTFLAGS)
graphics.o: ./graphics/graphics.c ./graphics/graphics.h
	gcc $(CFLAGS) $(INCLUDES) -c ./graphics/graphics.c $(OPTFLAGS)
test10: galsim
	time ./galsim 10 ./input_data/ellipse_N_00010.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 10 result.gal ./ref_output_data/ellipse_N_00010_after200steps.gal
test20: galsim
	time ./galsim 20 ./input_data/ellipse_N_00020.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test30: galsim
	time ./galsim 30 ./input_data/ellipse_N_00030.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test40: galsim
	time ./galsim 40 ./input_data/ellipse_N_00040.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test50: galsim
	time ./galsim 50 ./input_data/ellipse_N_00060.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test60: galsim
	time ./galsim 60 ./input_data/ellipse_N_00060.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test70: galsim
	time ./galsim 70 ./input_data/ellipse_N_00070.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test80: galsim
	time ./galsim 80 ./input_data/ellipse_N_00080.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test90: galsim
	time ./galsim 90 ./input_data/ellipse_N_00090.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test100: galsim
	time ./galsim 100 ./input_data/ellipse_N_00100.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 100 result.gal ./ref_output_data/ellipse_N_00100_after200steps.gal
test150: galsim
	time ./galsim 150 ./input_data/ellipse_N_00150.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test200: galsim
	time ./galsim 200 ./input_data/ellipse_N_00200.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test300: galsim
	time ./galsim 300 ./input_data/ellipse_N_00300.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test400: galsim
	time ./galsim 400 ./input_data/ellipse_N_00400.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test500: galsim
	time ./galsim 500 ./input_data/ellipse_N_00500.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 500 result.gal ./ref_output_data/ellipse_N_00500_after200steps.gal
test600: galsim
	time ./galsim 600 ./input_data/ellipse_N_00600.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test700: galsim
	time ./galsim 700 ./input_data/ellipse_N_00700.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test800: galsim
	time ./galsim 800 ./input_data/ellipse_N_00800.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test900: galsim
	time ./galsim 900 ./input_data/ellipse_N_00900.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test1000: galsim
	time ./galsim 1000 ./input_data/ellipse_N_01000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 1000 result.gal ./ref_output_data/ellipse_N_01000_after200steps.gal
test1500: galsim
	time ./galsim 1500 ./input_data/ellipse_N_01500.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test2000: galsim
	time ./galsim 2000 ./input_data/ellipse_N_02000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 2000 result.gal ./ref_output_data/ellipse_N_02000_after200steps.gal
test3000: galsim
	time ./galsim 3000 ./input_data/ellipse_N_03000.gal 100 0.00001 $(THETAMAX) $(GRAPHICS)
	gcc -o compare_gal compare_gal_files.c -lm
	./compare_gal 3000 result.gal ./ref_output_data/ellipse_N_03000_after100steps.gal
test4000: galsim
	time ./galsim 4000 ./input_data/ellipse_N_04000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test5000: galsim
	time ./galsim 5000 ./input_data/ellipse_N_05000.gal 100 0.00001 $(THETAMAX) $(GRAPHICS)
test6000: galsim
	time ./galsim 6000 ./input_data/ellipse_N_06000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test7000: galsim
	time ./galsim 7000 ./input_data/ellipse_N_07000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test8000: galsim
	time ./galsim 8000 ./input_data/ellipse_N_08000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test9000: galsim
	time ./galsim 9000 ./input_data/ellipse_N_09000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
test10000: galsim
	time ./galsim 10000 ./input_data/ellipse_N_10000.gal 200 0.00001 $(THETAMAX) $(GRAPHICS)
clean:
	rm -f galsim compare_gal *.o result.gal
