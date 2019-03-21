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

    if((N & (N-1)) != 0)
    {
        printf("Size of matrix should be a power of 2.\n");
        return 0;
    }

    char output_file[] = "result.mat";

    // Generate the input based on N
    double** matrix1 = matrix_generate(N);
    double** matrix2 = matrix_generate(N);

    double** matrix_out = NULL;

    // Run in parallel
    matrix_out = allocate_matrix(N);
    matrix_multiplication_5(matrix1, matrix2, matrix_out, N, 4);

    // Run normally 
    // matrix_out = matrix_multiplication_4(matrix1, matrix2, N);
    
    write_output_file(output_file, N, matrix_out);

    free_matrix(&matrix1, N);
    free_matrix(&matrix2, N);
    free_matrix(&matrix_out, N);
    return 0;
}



