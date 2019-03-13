CFLAGS=-Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
OPTFLAGS=-Ofast -fopenmp -funroll-loops -march=native # -funroll-loops
DEBUG=#-g -pg

DELTA=0.00001
THETA_MAX=0.256
GR=0

#------------------------------------------------------------------------------------------------------------------

galsim: galsim.c galsim.o Quad.h Quad.c Quad.o graphics.o graphics.h graphics.c
	gcc $(DEBUG) -o galsim galsim.o Quad.o graphics.o $(LDFLAGS) $(CFLAGS) $(OPTFLAGS)

galsim.o: galsim.c Quad.h Quad.c
	gcc -c galsim.c $(CFLAGS) $(OPTFLAGS)

Quad.o: Quad.c Quad.h
	gcc -c Quad.c $(CFLAGS) $(OPTFLAGS)

graphics.o: graphics.c graphics.h
	gcc $(INCLUDES) -c graphics.c $(CFLAGS) $(OPTFLAGS)

clean:
	rm -f galsim galsim-array test a.out *.o *.gal gmon.out

#------------------------------------------------------------------------------------------------------------------

# test2000: galsim
# 	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) 0.256 $(GR) 4
# 	../compare_gal_files/./compare 02000 result.gal ../ref_output_data/ellipse_N_02000_after200steps.gal

# test3000: galsim
# 	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 03000 ../input_data/ellipse_N_03000.gal 100 $(DELTA) 0.584 $(GR) 4
# 	../compare_gal_files/./compare 03000 result.gal ../ref_output_data/ellipse_N_03000_after100steps.gal

# test5000: galsim
# 	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 02000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 05000 ../input_data/ellipse_N_05000.gal 100 $(DELTA) $(THETA_MAX) $(GR) 16

# test10: galsim
# 	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 00010 ../input_data/ellipse_N_00010.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 00010 ../input_data/ellipse_N_00010.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./compare 00010 result.gal ../ref_output_data/ellipse_N_00010_after200steps.gal

# test100: galsim
# 	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 00100 ../input_data/ellipse_N_00100.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 00100 ../input_data/ellipse_N_00100.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./compare 00100 result.gal ../ref_output_data/ellipse_N_00100_after200steps.gal

# test4-3: galsim
# 	# valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 4 ../input_data/circles_N_4.gal 3 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 4 ../input_data/circles_N_4.gal 3 $(DELTA) $(THETA_MAX) $(GR)
# 	# ./compare 4 result.gal ../ref_output_data/circles_N_4_after3steps.gal

# test4-200: galsim
# 	valgrind --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./galsim 4 ../input_data/circles_N_4.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./galsim 4 ../input_data/circles_N_4.gal 200 $(DELTA) $(THETA_MAX) $(GR)
# 	./compare 4 result.gal ../ref_output_data/circles_N_4_after200steps.gal

#------------------------------------------------------------------------------------------------------------------

# test100: galsim
# 	./galsim 100 ../input_data/ellipse_N_00100.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test1000: galsim
# 	./galsim 1000 ../input_data/ellipse_N_01000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test2000: galsim
# 	./galsim 2000 ../input_data/ellipse_N_02000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test3000: galsim
# 	./galsim 3000 ../input_data/ellipse_N_03000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test4000: galsim
# 	./galsim 4000 ../input_data/ellipse_N_04000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test5000: galsim
# 	./galsim 5000 ../input_data/ellipse_N_05000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test6000: galsim
# 	./galsim 6000 ../input_data/ellipse_N_06000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test7000: galsim
# 	./galsim 7000 ../input_data/ellipse_N_07000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test8000: galsim
# 	./galsim 8000 ../input_data/ellipse_N_08000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test9000: galsim
# 	./galsim 9000 ../input_data/ellipse_N_09000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8

# test10000: galsim
# 	./galsim 10000 ../input_data/ellipse_N_10000.gal 200 $(DELTA) $(THETA_MAX) $(GR) 8	