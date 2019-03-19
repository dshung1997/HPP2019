#include <stdio.h>
#include <stdlib.h>

#include "helper.h"

int main(int argc, char* argv[])
{
    if(argc != 2) 
    {
        printf("Syntax: ./main size_of_matrix\n");
        return 0;
    }

    int N = atoi(argv[1]);

    char input_file_1[50];
    char input_file_2[50];
    char output_file[] = "result.mat";

    gen_input_files(input_file_1, input_file_2, N);

    double** matrix1 = NULL;

    int read_matrix_1 = read_input_file(input_file_1, N, &matrix1);

    if(read_matrix_1 == 0)
    {
        return 0;
    }

    for(int i = 0; i < 10; i++)
    {
        printf("%lf\n", matrix1[0][i]);
    }

    free_matrix(matrix1, N);

    return 0;
}