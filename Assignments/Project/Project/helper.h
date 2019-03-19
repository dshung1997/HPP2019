#ifndef _helper
#define helper

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void gen_input_files (char* s1, char* s2, int N);
void gen_output_file (char* s, int N);

int read_input_file (char* filename, int N, double*** matrix_pointer);

void free_matrix (double** matrix_pointer, int N);
#endif