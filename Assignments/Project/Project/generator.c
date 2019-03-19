#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[])
{
    srand(1);
    int n = atoi(argv[1]);

    double* a[n];
    double* b[n];
    double* c[n];

    for(int i = 0; i < n; i++)
    {
        a[i] = (double*) malloc(n * sizeof(double));
        b[i] = (double*) malloc(n * sizeof(double));
        c[i] = (double*) malloc(n * sizeof(double));
    }
    
    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            a[i][j] = (double)rand() / RAND_MAX*200.0-100.0;
            b[i][j] = (double)rand() / RAND_MAX*200.0-100.0;
            c[i][j] = 0;
        }
    }

    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            for(int k = 0; k < n; k++)
            {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }

    FILE* f1 = fopen("input/input_1024_1.mat", "wb");
    FILE* f2 = fopen("input/input_1024_2.mat", "wb");
    FILE* f3 = fopen("output/output_1024.mat", "wb");

    fwrite(&n, sizeof(int), 1, f1);
    fwrite(&n, sizeof(int), 1, f2);
    fwrite(&n, sizeof(int), 1, f3);

    for(int i = 0; i < n; i++)
    {
        fwrite(a[i], sizeof(double), n, f1);
        fwrite(b[i], sizeof(double), n, f2);
        fwrite(c[i], sizeof(double), n, f3);
    }

    for(int i = 0; i < n; i++)
    {
        free(a[i]);
        free(b[i]);
        free(c[i]);
    }

    fclose(f1);
    fclose(f2);
    fclose(f3);
    
    return 0;
}