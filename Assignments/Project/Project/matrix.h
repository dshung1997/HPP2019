#ifndef _matrix
#define _matrix

typedef struct matrix {
    int tl[2]; // top left      inclusive
    int br[2]; // bottom right  exclusive
    double** mtx;
} matrix;

matrix* matrix_addition(matrix* a, matrix* b);
matrix* matrix_multiplication(matrix* a, matrix* b);

#endif