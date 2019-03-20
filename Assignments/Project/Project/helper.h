#ifndef _helper
#define helper

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <immintrin.h>

union Data { __m256d result4; double result[4] ;};

void gen_input_files (char* s1, char* s2, int N);
void gen_output_file (char* s, int N);

int read_input_file (char* filename, int N, double*** matrix_pointer);
int write_output_file (char* filename, int N, double** matrix_pointer);

double** allocate_matrix(int N);
void free_matrix (double*** matrix_pointer, int N);

double** matrix_addition(double** matrix_in_1, double** matrix_in_2, int N);
double** matrix_subtraction(double** matrix_in_1, double** matrix_in_2, int N);

// Naive solution
void matrix_multiplication_1(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Strassens algorithm
void matrix_multiplication_2(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

void matrix_multiplication_3(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

void matrix_merge(double** matrix_parent, int N, double** matrix_00, double** matrix_01, double** matrix_10, double** matrix_11);

double** matrix_split(double** marix_parent, int N_parent, int y, int x);

void matrix_multiplication_4(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

#endif