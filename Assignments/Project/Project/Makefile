main: main.c
	gcc -o main main.c

compare: compare.c
	gcc -o compare compare.c -lm -Wall

generator: generator.c
	gcc -o generator generator.c

clean:
	rm -f main compare generator a.out *.o


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