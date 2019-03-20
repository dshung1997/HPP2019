#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <immintrin.h>

union Data { __m256d result4; double result[4] ;};

int main()
{
    union Data data;

    __m256d a4 = _mm256_set_pd(1.0, 1.0, 1.0, 1.0);
    __m256d b4 = _mm256_set_pd(10.0, 20.0, 30.0, 40.0);

    data.result4 = _mm256_add_pd(a4, b4);

    for(int i = 0; i < 4; i++)
    {
        printf("%lf\n", data.result[i]);
    }

    return 0;
}