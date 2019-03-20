# CFLAGS=-Wall
# INCLUDES=-I/opt/X11/include
# LDFLAGS=-L/opt/X11/lib -lX11 -lm
# OPTFLAGS=-Ofast -fopenmp -funroll-loops -march=native # -funroll-loops
# DEBUG=-g 
# GMON=-pg

main: main.c main.o helper.h helper.c helper.o
	gcc $(DEBUG) $(GMON) -o main main.o helper.o
	# valgrind -v --tool=memcheck --leak-check=full --track-origins=yes --show-leak-kinds=all ./main 512
	

main.o: main.c helper.h helper.c
	gcc -c main.c $(CFLAGS) $(OPTFLAGS)

helper.o: helper.c helper.h
	gcc -c helper.c $(CFLAGS) $(OPTFLAGS)

compare512: compare
	gcc -o compare compare.c -lm $(CFLAGS) $(OPTFLAGS)
	./compare 512 result.mat output/output_512.mat

compare1024: compare
	gcc -o compare compare.c -lm $(CFLAGS) $(OPTFLAGS)
	./compare 1024 result.mat output/output_1024.mat

compare2048: compare
	gcc -o compare compare.c -lm $(CFLAGS) $(OPTFLAGS)
	./compare 2048 result.mat output/output_2048.mat

compare: compare.c
	gcc -o compare compare.c -lm $(CFLAGS) $(OPTFLAGS)

generator: generator.c
	gcc -o generator generator.c $(CFLAGS) $(OPTFLAGS)

clean:
	rm -f main a.out *.o gmon.out

cleanall:
	rm -f main compare generator a.out *.o gmon.out result.mat

# CFLAGS=-Wall
# INCLUDES=-I/opt/X11/include
# LDFLAGS=-L/opt/X11/lib -lX11 -lm
# OPTFLAGS=-Ofast -fopenmp -funroll-loops -march=native # -funroll-loops
# DEBUG=#-g -pg

# #------------------------------------------------------------------------------------------------------------------

# galsim: galsim.c galsim.o Quad.h Quad.c Quad.o graphics.o graphics.h graphics.c
# 	gcc $(DEBUG) -o galsim galsim.o Quad.o graphics.o $(LDFLAGS) $(CFLAGS) $(OPTFLAGS)

# galsim.o: galsim.c Quad.h Quad.c
# 	gcc -c galsim.c $(CFLAGS) $(OPTFLAGS)

# Quad.o: Quad.c Quad.h
# 	gcc -c Quad.c $(CFLAGS) $(OPTFLAGS)

# graphics.o: graphics.c graphics.h
# 	gcc $(INCLUDES) -c graphics.c $(CFLAGS) $(OPTFLAGS)

# clean:
# 	rm -f galsim galsim-array test a.out *.o *.gal gmon.out