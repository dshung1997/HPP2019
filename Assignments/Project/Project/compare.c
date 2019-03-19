#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char *argv[])
{
    if (argc != 4)
    {
        printf("Give 3 input args: size_of_matrix file1 file2\n");
        return -1;
    }

    int N = atoi(argv[1]);
    const char *fileName1 = argv[2];
    const char *fileName2 = argv[3];

    printf("N = %d\n", N);
    printf("fileName1 = '%s'\n", fileName1);
    printf("fileName2 = '%s'\n", fileName2);
    
    FILE* f1 = fopen(fileName1, "rb");
    FILE* f2 = fopen(fileName2, "rb");

    if(f1 == NULL)
    {
        printf("There's an error reading file %s.\n", fileName1);
        return 0;
    }

    if(f2 == NULL)
    {
        printf("There's an error reading file %s.\n", fileName2);
        return 0;
    }

    int n1 = 0;
    int n2 = 0;

    int read_n1 = fread(&n1, sizeof(int), (size_t)1, f1);
    int read_n2 = fread(&n2, sizeof(int), (size_t)1, f2);

    if(read_n1 != 1)
    {
        printf("There's an error reading the size of matrix in file %s.\n", fileName1);
        return 0;
    }

    if(read_n2 != 1)
    {
        printf("There's an error reading the size of matrix in file %s.\n", fileName2);
        return 0;
    }

    if(n1 != n2 || n1 != N || n2 != N)
    {
        printf("The size of matrix differs: N: %d | n1: %d | n2: %d\n", N, n1, n2);
        return 0;
    }

    double max_diff = -100.0;
    for(int i = 0; i < N*N; i++)
    {
        double t1, t2;
        int read_t1 = fread(&t1, sizeof(double), 1, f1);
        int read_t2 = fread(&t2, sizeof(double), 1, f2);

        

        if(read_t1 != 1)
        {
            printf("There's an error reading data in file %s.\n", fileName1);
            return 0;
        }

        if(read_t2 != 1)
        {
            printf("There's an error reading data in file %s.\n", fileName2);
            return 0;
        }

        if(i < 10)
        {
            printf("%lf - %lf\n", t1, t2);
        }

        double diff = fabs(t1-t2);

        max_diff = max_diff > diff ? max_diff : diff;
    }

    printf("Max diff: %lf\n", max_diff);

    fclose(f1);
    fclose(f2);
    
    return 0;
}