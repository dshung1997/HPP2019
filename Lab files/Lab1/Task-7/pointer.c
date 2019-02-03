#include <stdio.h>
#include <stdlib.h>

int main()
{
    double a = 11.1;
    int b = 2;
    char c = '3';

    double* p_a = &a;
    int* p_b = &b;
    char* p_c = &c;

    printf("Value: %5.2lf Address: %p\n", a, p_a); 
    printf("Value: %5d Address: %p\n", b, p_b); 
    printf("Value: %5c Address: %p\n", c, p_c); 

    return 0;
}