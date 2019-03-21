CFLAGS=-Wall -mavx -fopenmp
OPTFLAGS=-O3 -funroll-loops -march=native
DEBUG=-g 
# GMON=-pg

main: main.c main.o helper.h helper.c helper.o
	gcc $(DEBUG) $(GMON) -o main main.o helper.o $(CFLAGS) $(OPTFLAGS)
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
	rm -f main compare generator a.out *.o gmon.out result.mat