#include <stdio.h>
#include <string.h>

void swap_nums(int*, int*);
void swap_pointers(char**, char**);

int main()
{
    int a, b;


    char* s1;
    char* s2;

    a=3; b=4;
    swap_nums(&a,&b);

    printf("a=%d, b=%d\n", a, b);

    s1 = "second"; s2 = "first";


    // printf("s1: %p\ns2: %p\n", s1, s2);
    // printf("s1: %p\ns2: %p\n", &s1, &s2);
    swap_pointers(&s1,&s2);

    printf("s1=%s, s2=%s\n", s1, s2);

    return 0;
}

void swap_nums(int* a, int* b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void swap_pointers(char** a, char** b)
{
    // printf("a: %p\nb: %p\n", *a, *b);
    char* x = *a;
    char* y = *b;
    *a = y;
    *b = x;
}