#ifndef _helper
#define helper

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <immintrin.h>
#include <time.h>

// I used this to easily get the numbers of each vector
union Data { __m256d result4; double result[4] ;};

// Generate the input files' names
void gen_input_files (char* s1, char* s2, int N);

// Generate the output file's names
void gen_output_file (char* s, int N);

// Read the input file and put the numbers into matrix_pointer
int read_input_file (char* filename, int N, double*** matrix_pointer);

// Write the matrix to the output file
int write_output_file (char* filename, int N, double** matrix_pointer);

// Allocate memory for the matrix with size N
double** allocate_matrix(int N);

// Generate a NxN matrix with random double numbers
double** matrix_generate(int N);

// Free memory of a matrix with size N
void free_matrix (double*** matrix_pointer, int N);

// Add two matrices with size N and return a result
double** matrix_addition(double** matrix_in_1, double** matrix_in_2, int N);

// Subtract two matrices with size N and return a result
double** matrix_subtraction(double** matrix_in_1, double** matrix_in_2, int N);

// Naive solution
void matrix_multiplication_1(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Strassens algorithm, but just 1 depth level
void matrix_multiplication_2(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Strassens algorithm, but use SIMD vectors
void matrix_multiplication_3(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Strassens algorithm recursively
void matrix_multiplication_4(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Strassens algorithm - parallel
void matrix_multiplication_5(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N, int n_threads);
void matrix_multiplication_5_helper(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N);

// Merge four matrices into a bigger one.
void matrix_merge(double** matrix_parent, int N, double** matrix_00, double** matrix_01, double** matrix_10, double** matrix_11);

// Split the matrix into each according to the row y and column x
double** matrix_split(double** marix_parent, int N_parent, int y, int x);

// Add two matrices using SIMD vectors
double** matrix_addition_vector(double** matrix_in_1, double** matrix_in_2, int N);

// Subtract two matrices using SIMD vectors
double** matrix_subtraction_vector(double** matrix_in_1, double** matrix_in_2, int N);

// Multiply two matrices using SIMD vectors
double** matrix_multiplication_vector(double** matrix_in_1, double** matrix_in_2, int N);

#endif