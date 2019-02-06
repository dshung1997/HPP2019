#include <stdio.h>
#include <stdlib.h>

int binom(int x, int y);
int faculty(int x);

int main(int argc, char** argv)
{
    int i,j;
    char* char_x = argv[1];
    int x = atoi(char_x);
    for (i=0; i<x; i++)
    {
        for (j=0; j<=i; j++)
        {
            int a = binom(i,j);
            printf("%d ",a);
        }
        
        printf("\n");
    }
}

/* This is a program to calculate the binomial coefficient */
/* for a certain row x and column y */
/* Function faculty is used */
int binom (int x, int y)
{
    int a = faculty(x);
    int b = faculty(y);
    int c = faculty(x-y);

    return a / (b * c);
}

/* This is a program to calculate the faculty of number n */
/* This is used to calculate the binomial coefficient */
int faculty (int n)
{
    if (n>1)
        return n * faculty(n-1);
    else
        return 1;
}
