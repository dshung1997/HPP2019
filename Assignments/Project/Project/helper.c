#include "helper.h"

void gen_input_files (char* s1, char* s2, int N)
{
    char n_str[10];
    sprintf(n_str, "%d", N);

    strcpy(s1, "input/input_");
    strcpy(s2, "input/input_");

    strcat(s1, n_str);
    strcat(s2, n_str);

    strcat(s1, "_1.mat");
    strcat(s2, "_2.mat");

    printf("%s\n%s\n", s1, s2);
}

void gen_output_file (char* s, int N)
{
    char n_str[10];
    sprintf(n_str, "%d", N);

    strcpy(s, "output/output_");
    strcpy(s, n_str);
    strcpy(s, ".mat");
}

int read_input_file (char* filename, int N, double*** matrix_pointer)
{
    FILE* f = fopen(filename, "rb");
    if(f == NULL)
    {
        printf("There's an error reading file: %s\n", filename);
        return 0;
    }

    int n = 0;
    int read_n = fread(&n, sizeof(int), 1, f);

    if(read_n != 1)
    {
        printf("There's an error reading the size of matrix in file: %s\n", filename);
        return 0;
    }

    if(n != N)
    {
        printf("The size of matrix differs: N: %d | n: %d\n", N, n);
        return 0;
    }

    double** m = NULL;

    m = (double**) malloc(N * sizeof(double *));

    for(int i = 0; i < N; i++)
    {
        m[i] = NULL;
        m[i] = (double*) malloc(N * sizeof(double));
    }

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            double temp = 0;
            int read_temp = fread(&temp, sizeof(double), 1, f);

            if(read_temp != 1)
            {
                printf("There's an error reading double number in file: %s\n", filename);
                
                for(int i = 0; i < N; i++)
                {                
                    free(m[i]);
                    m[i] = NULL;                
                }

                free(m);

                fclose(f);

                return 0;
            }

            m[i][j] = temp;
        }
    }

    fclose(f);

    *matrix_pointer = m;

    return 1;
}

void free_matrix (double** matrix_pointer, int N)
{
    for(int i = 0; i < N; i++)
    {
        free((matrix_pointer)[i]);
        (matrix_pointer)[i] = NULL;
    }

    free(matrix_pointer);
    matrix_pointer = NULL;
}