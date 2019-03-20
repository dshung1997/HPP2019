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

    double** m = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            double temp = 0;
            int read_temp = fread(&temp, sizeof(double), 1, f);

            if(read_temp != 1)
            {
                printf("There's an error reading double number in file: %s\n", filename);

                free_matrix(&m, N);
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


int write_output_file (char* filename, int N, double** matrix_pointer)
{
    FILE* f = fopen(filename, "wb");
    
    if(f == NULL)
    {
        printf("There's an error opening file: %s\n", filename);
        return 0;
    }

    int write_n = fwrite(&N, sizeof(int), 1, f);

    if(write_n != 1)
    {
        printf("There's an error writing the size of matrix in file: %s\n", filename);
        return 0;
    }

    for(int i = 0; i < N; i++)
    {
        fwrite(matrix_pointer[i], sizeof(double), N, f); 
    }

    fclose(f);

    return 1;
}

double** allocate_matrix(int N)
{
    double** m = NULL;

    m = (double**) calloc(N, sizeof(double*));

    for(int i = 0; i < N; i++)
    {
        m[i] = NULL;
        m[i] = (double*) calloc(N, sizeof(double));
    }

    return m;
}

void free_matrix (double*** matrix_pointer, int N)
{
    // int count = 0;

    if(*matrix_pointer == NULL)
        return;

    for(int i = 0; i < N; i++)
    {
        free((*matrix_pointer)[i]);
        (*matrix_pointer)[i] = NULL;

        // if((*matrix_pointer)[i] == NULL)
        // {
        //     count += 1;
        // }
    }

    free(*matrix_pointer);
    *matrix_pointer = NULL;

    // if(count == N)
    // {
    //     printf("OK.........\n");
    // }
}

void matrix_multiplication_1(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N)
{
    for(int i = 0; i < N; i++)
    {
        for(int k = 0; k < N; k++)
        {
            for(int j = 0; j < N; j++)
            {
                matrix_out[i][j] += matrix_in_1[i][k] * matrix_in_2[k][j];
            }
        }
    }
}

void matrix_multiplication_2(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N)
{
    if(N == 2)
    {
        for(int i = 0; i < N; i++)
        {
            for(int k = 0; k < N; k++)
            {
                for(int j = 0; j < N; j++)
                {
                    matrix_out[i][j] += matrix_in_1[i][k] * matrix_in_2[k][j];
                }
            }
        }

        return;
    }

    // main part

    int N_half = N >> 1;

    double** a00 = matrix_split(matrix_in_1, N, 0, 0);
    double** a01 = matrix_split(matrix_in_1, N, 0, 1);
    double** a10 = matrix_split(matrix_in_1, N, 1, 0);
    double** a11 = matrix_split(matrix_in_1, N, 1, 1);
    
    double** b00 = matrix_split(matrix_in_2, N, 0, 0);
    double** b01 = matrix_split(matrix_in_2, N, 0, 1);
    double** b10 = matrix_split(matrix_in_2, N, 1, 0);
    double** b11 = matrix_split(matrix_in_2, N, 1, 1);
    
    double** s1 = matrix_subtraction(b01, b11, N_half);
    double** s2 = matrix_addition(a00, a01, N_half);
    double** s3 = matrix_addition(a10, a11, N_half);
    double** s4 = matrix_subtraction(b10, b00, N_half);
    double** s5 = matrix_addition(a00, a11, N_half);
    double** s6 = matrix_addition(b00, b11, N_half);    
    double** s7 = matrix_subtraction(a01, a11, N_half);
    double** s8 = matrix_addition(b10, b11, N_half);   
    double** s9 = matrix_subtraction(a00, a10, N_half);
    double** s10 = matrix_addition(b00, b01, N_half);

    double** p1 = allocate_matrix(N_half);
    matrix_multiplication_1(a00, s1, p1, N_half);

    double** p2 = allocate_matrix(N_half);
    matrix_multiplication_1(s2, b11, p2, N_half);

    double** p3 = allocate_matrix(N_half);
    matrix_multiplication_1(s3, b00, p3, N_half);

    double** p4 = allocate_matrix(N_half);
    matrix_multiplication_1(a11, s4, p4, N_half);

    double** p5 = allocate_matrix(N_half);
    matrix_multiplication_1(s5, s6, p5, N_half);

    double** p6 = allocate_matrix(N_half);
    matrix_multiplication_1(s7, s8, p6, N_half);

    double** p7 = allocate_matrix(N_half);
    matrix_multiplication_1(s9, s10, p7, N_half);

    double** c001 = matrix_addition(p5, p4, N_half);
    double** c002 = matrix_subtraction(p2, p6, N_half);
    double** c00 = matrix_subtraction(c001, c002, N_half);

    double** c01 = matrix_addition(p1, p2, N_half);
    double** c10 = matrix_addition(p3, p4, N_half);

    double** c111 = matrix_addition(p1, p5, N_half);
    double** c112 = matrix_addition(p3, p7, N_half);
    double** c11 = matrix_subtraction(c111, c112, N_half);

    matrix_merge(matrix_out, N, c00, c01, c10, c11);

    free_matrix(&a00, N_half); free_matrix(&a01, N_half); free_matrix(&a10, N_half); free_matrix(&a11, N_half);
    free_matrix(&b00, N_half); free_matrix(&b01, N_half); free_matrix(&b10, N_half); free_matrix(&b11, N_half);

    free_matrix(&s1, N_half); free_matrix(&s2, N_half); free_matrix(&s3, N_half); free_matrix(&s4, N_half); 
    free_matrix(&s5, N_half); free_matrix(&s6, N_half); free_matrix(&s7, N_half); free_matrix(&s8, N_half); 
    free_matrix(&s9, N_half); free_matrix(&s10, N_half);

    free_matrix(&p1, N_half); free_matrix(&p2, N_half); free_matrix(&p3, N_half); free_matrix(&p4, N_half); 
    free_matrix(&p5, N_half); free_matrix(&p6, N_half); free_matrix(&p7, N_half);

    free_matrix(&c001, N_half); free_matrix(&c002, N_half); free_matrix(&c00, N_half);
    free_matrix(&c01, N_half); free_matrix(&c10, N_half);
    free_matrix(&c111, N_half); free_matrix(&c112, N_half); free_matrix(&c11, N_half);
}

void matrix_merge(double** matrix_parent, int N, double** matrix_00, double** matrix_01, double** matrix_10, double** matrix_11)
{
    int N_half = N >> 1;

    for(int i = 0; i < N_half; i++)
    {
        for(int j = 0; j < N_half; j++)
        {
            matrix_parent[i][j] = matrix_00[i][j];
            matrix_parent[i][j + N_half] = matrix_01[i][j];
            matrix_parent[i + N_half][j] = matrix_10[i][j];
            matrix_parent[i + N_half][j + N_half] = matrix_11[i][j];
        }
    }
}

double** matrix_split(double** matrix_parent, int N_parent, int y, int x)
{
    int N = N_parent >> 1;

    double** matrix = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            matrix[i][j] = matrix_parent[i + N * y][j + N * x];
        }
    }

    return matrix;
}

double** matrix_addition(double** matrix_in_1, double** matrix_in_2, int N)
{
    double** matrix_out = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            matrix_out[i][j] = (matrix_in_1[i][j] + matrix_in_2[i][j]);
        }
    }

    return matrix_out;
}

double** matrix_subtraction(double** matrix_in_1, double** matrix_in_2, int N)
{
    double** matrix_out = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            matrix_out[i][j] = (matrix_in_1[i][j] - matrix_in_2[i][j]);
        }
    }

    return matrix_out;
}

double** matrix_addition_vector(double** matrix_in_1, double** matrix_in_2, int N)
{
    double** matrix_out = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j += 4)
        {
            union Data data;

            __m256d a4 = _mm256_set_pd(matrix_in_1[i][j+3], matrix_in_1[i][j+2], matrix_in_1[i][j+1], matrix_in_1[i][j]);
            __m256d b4 = _mm256_set_pd(matrix_in_2[i][j+3], matrix_in_2[i][j+2], matrix_in_2[i][j+1], matrix_in_2[i][j]);

            data.result4 = _mm256_add_pd(a4, b4);
            
            matrix_out[i][j] = data.result[0];
            matrix_out[i][j+1] = data.result[1];
            matrix_out[i][j+2] = data.result[2];
            matrix_out[i][j+3] = data.result[3];
        }
    }

    return matrix_out;
}

double** matrix_subtraction_vector(double** matrix_in_1, double** matrix_in_2, int N)
{
    double** matrix_out = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j += 4)
        {
            union Data data;

            __m256d a4 = _mm256_set_pd(matrix_in_1[i][j+3], matrix_in_1[i][j+2], matrix_in_1[i][j+1], matrix_in_1[i][j]);
            __m256d b4 = _mm256_set_pd(matrix_in_2[i][j+3], matrix_in_2[i][j+2], matrix_in_2[i][j+1], matrix_in_2[i][j]);

            data.result4 = _mm256_sub_pd(a4, b4);
            
            matrix_out[i][j] = data.result[0];
            matrix_out[i][j+1] = data.result[1];
            matrix_out[i][j+2] = data.result[2];
            matrix_out[i][j+3] = data.result[3];
        }
    }

    return matrix_out;
}

double** matrix_multiplication_vector(double** matrix_in_1, double** matrix_in_2, int N)
{
    double** matrix_out = allocate_matrix(N);

    for(int i = 0; i < N; i++)
    {
        for(int k = 0; k < N; k += 4)
        {
            for(int j = 0; j < N; j++)
            {
                // matrix_out[i][j] += matrix_in_1[i][k] * matrix_in_2[k][j];

                union Data data;

                __m256d a4 = _mm256_set_pd(matrix_in_1[i][k], matrix_in_1[i][k+1], matrix_in_1[i][k+2], matrix_in_1[i][k+3]);
                __m256d b4 = _mm256_set_pd(matrix_in_2[k][j], matrix_in_2[k+1][j], matrix_in_2[k+2][j], matrix_in_2[k+3][j]);

                data.result4 = _mm256_mul_pd(a4, b4);

                matrix_out[i][j] += (data.result[0] + data.result[1]) + (data.result[2] + data.result[3]);
            }
        }
    }

    return matrix_out;
}

void matrix_multiplication_3(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N)
{
    int N_half = N >> 1;

    double** a00 = matrix_split(matrix_in_1, N, 0, 0);
    double** a01 = matrix_split(matrix_in_1, N, 0, 1);
    double** a10 = matrix_split(matrix_in_1, N, 1, 0);
    double** a11 = matrix_split(matrix_in_1, N, 1, 1);
    
    double** b00 = matrix_split(matrix_in_2, N, 0, 0);
    double** b01 = matrix_split(matrix_in_2, N, 0, 1);
    double** b10 = matrix_split(matrix_in_2, N, 1, 0);
    double** b11 = matrix_split(matrix_in_2, N, 1, 1);
    
    double** s1 = matrix_subtraction_vector(b01, b11, N_half);
    double** s2 = matrix_addition_vector(a00, a01, N_half);
    double** s3 = matrix_addition_vector(a10, a11, N_half);
    double** s4 = matrix_subtraction_vector(b10, b00, N_half);
    double** s5 = matrix_addition_vector(a00, a11, N_half);
    double** s6 = matrix_addition_vector(b00, b11, N_half);    
    double** s7 = matrix_subtraction_vector(a01, a11, N_half);
    double** s8 = matrix_addition_vector(b10, b11, N_half);   
    double** s9 = matrix_subtraction_vector(a00, a10, N_half);
    double** s10 = matrix_addition_vector(b00, b01, N_half);


    double** p1 = matrix_multiplication_vector(a00, s1, N_half);
    double** p2 = matrix_multiplication_vector(s2, b11, N_half);
    double** p3 = matrix_multiplication_vector(s3, b00, N_half);
    double** p4 = matrix_multiplication_vector(a11, s4, N_half);
    double** p5 = matrix_multiplication_vector(s5, s6, N_half);
    double** p6 = matrix_multiplication_vector(s7, s8, N_half);
    double** p7 = matrix_multiplication_vector(s9, s10, N_half);


    double** c001 = matrix_addition_vector(p5, p4, N_half);
    double** c002 = matrix_subtraction_vector(p2, p6, N_half);
    double** c00 = matrix_subtraction_vector(c001, c002, N_half);

    double** c01 = matrix_addition_vector(p1, p2, N_half);
    double** c10 = matrix_addition_vector(p3, p4, N_half);

    double** c111 = matrix_addition_vector(p1, p5, N_half);
    double** c112 = matrix_addition_vector(p3, p7, N_half);
    double** c11 = matrix_subtraction_vector(c111, c112, N_half);

    matrix_merge(matrix_out, N, c00, c01, c10, c11);

    free_matrix(&a00, N_half); free_matrix(&a01, N_half); free_matrix(&a10, N_half); free_matrix(&a11, N_half);
    free_matrix(&b00, N_half); free_matrix(&b01, N_half); free_matrix(&b10, N_half); free_matrix(&b11, N_half);

    free_matrix(&s1, N_half); free_matrix(&s2, N_half); free_matrix(&s3, N_half); free_matrix(&s4, N_half); 
    free_matrix(&s5, N_half); free_matrix(&s6, N_half); free_matrix(&s7, N_half); free_matrix(&s8, N_half); 
    free_matrix(&s9, N_half); free_matrix(&s10, N_half);

    free_matrix(&p1, N_half); free_matrix(&p2, N_half); free_matrix(&p3, N_half); free_matrix(&p4, N_half); 
    free_matrix(&p5, N_half); free_matrix(&p6, N_half); free_matrix(&p7, N_half);

    free_matrix(&c001, N_half); free_matrix(&c002, N_half); free_matrix(&c00, N_half);
    free_matrix(&c01, N_half); free_matrix(&c10, N_half);
    free_matrix(&c111, N_half); free_matrix(&c112, N_half); free_matrix(&c11, N_half);
}


void matrix_multiplication_4(double** matrix_in_1, double** matrix_in_2, double** matrix_out, int N)
{

    if(N == 256)
    {
        for(int i = 0; i < N; i++)
        {
            for(int k = 0; k < N; k++)
            {
                for(int j = 0; j < N; j++)
                {
                    matrix_out[i][j] += matrix_in_1[i][k] * matrix_in_2[k][j];
                }
            }
        }

        return;
    }

    int N_half = N >> 1;

    double** a00 = matrix_split(matrix_in_1, N, 0, 0);
    double** a01 = matrix_split(matrix_in_1, N, 0, 1);
    double** a10 = matrix_split(matrix_in_1, N, 1, 0);
    double** a11 = matrix_split(matrix_in_1, N, 1, 1);
    
    double** b00 = matrix_split(matrix_in_2, N, 0, 0);
    double** b01 = matrix_split(matrix_in_2, N, 0, 1);
    double** b10 = matrix_split(matrix_in_2, N, 1, 0);
    double** b11 = matrix_split(matrix_in_2, N, 1, 1);
    
    double** s1 = matrix_subtraction(b01, b11, N_half);
    double** s2 = matrix_addition(a00, a01, N_half);
    double** s3 = matrix_addition(a10, a11, N_half);
    double** s4 = matrix_subtraction(b10, b00, N_half);
    double** s5 = matrix_addition(a00, a11, N_half);
    double** s6 = matrix_addition(b00, b11, N_half);    
    double** s7 = matrix_subtraction(a01, a11, N_half);
    double** s8 = matrix_addition(b10, b11, N_half);   
    double** s9 = matrix_subtraction(a00, a10, N_half);
    double** s10 = matrix_addition(b00, b01, N_half);

    double** p1 = allocate_matrix(N_half);
    matrix_multiplication_4(a00, s1, p1, N_half);

    double** p2 = allocate_matrix(N_half);
    matrix_multiplication_4(s2, b11, p2, N_half);

    double** p3 = allocate_matrix(N_half);
    matrix_multiplication_4(s3, b00, p3, N_half);

    double** p4 = allocate_matrix(N_half);
    matrix_multiplication_4(a11, s4, p4, N_half);

    double** p5 = allocate_matrix(N_half);
    matrix_multiplication_4(s5, s6, p5, N_half);

    double** p6 = allocate_matrix(N_half);
    matrix_multiplication_4(s7, s8, p6, N_half);

    double** p7 = allocate_matrix(N_half);
    matrix_multiplication_4(s9, s10, p7, N_half);

    double** c001 = matrix_addition(p5, p4, N_half);
    double** c002 = matrix_subtraction(p2, p6, N_half);
    double** c00 = matrix_subtraction(c001, c002, N_half);

    double** c01 = matrix_addition(p1, p2, N_half);
    double** c10 = matrix_addition(p3, p4, N_half);

    double** c111 = matrix_addition(p1, p5, N_half);
    double** c112 = matrix_addition(p3, p7, N_half);
    double** c11 = matrix_subtraction(c111, c112, N_half);

    matrix_merge(matrix_out, N, c00, c01, c10, c11);

    free_matrix(&a00, N_half); free_matrix(&a01, N_half); free_matrix(&a10, N_half); free_matrix(&a11, N_half);
    free_matrix(&b00, N_half); free_matrix(&b01, N_half); free_matrix(&b10, N_half); free_matrix(&b11, N_half);

    free_matrix(&s1, N_half); free_matrix(&s2, N_half); free_matrix(&s3, N_half); free_matrix(&s4, N_half); 
    free_matrix(&s5, N_half); free_matrix(&s6, N_half); free_matrix(&s7, N_half); free_matrix(&s8, N_half); 
    free_matrix(&s9, N_half); free_matrix(&s10, N_half);

    free_matrix(&p1, N_half); free_matrix(&p2, N_half); free_matrix(&p3, N_half); free_matrix(&p4, N_half); 
    free_matrix(&p5, N_half); free_matrix(&p6, N_half); free_matrix(&p7, N_half);

    free_matrix(&c001, N_half); free_matrix(&c002, N_half); free_matrix(&c00, N_half);
    free_matrix(&c01, N_half); free_matrix(&c10, N_half);
    free_matrix(&c111, N_half); free_matrix(&c112, N_half); free_matrix(&c11, N_half);
}

