#include <stdio.h>

void print_row_full_stars(int);
void print_row_stars_and_dots(int);

int main(int argc, char* const argv[])
{
    int a, b;
    printf("Enter the height: ");
    scanf("%d", &a);

    printf("Enter the width: ");
    scanf("%d", &b);

    printf("\n\n");

    print_row_full_stars(b);

    for(int i = 1; i < a-1; i++)
        print_row_stars_and_dots(b);

    if(a > 1) print_row_full_stars(b);

    return 0;
}

void print_row_full_stars(int w)
{
    for(int i = 0; i < w; i++)
    {
        printf("*");
    }

    printf("\n");
}

void print_row_stars_and_dots(int w)
{
    printf("*");

    for(int i = 1; i < w-1; i++)
    {
        printf(".");
    }

    if(w > 1) printf("*");

    printf("\n");
}