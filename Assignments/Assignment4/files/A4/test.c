#include <stdio.h>
#include <stdlib.h>

// int main()
// {
//     double a = 0.5;
//     double b = 1.0;
//     double c = 1.2;
//     double d = 0.0;
//     printf("%lu\n", sizeof(double));
//     printf("%d\n", !a);
//     printf("%d\n", !b);
//     printf("%d\n", !c);
//     printf("%d\n", !d);

//     return 0;
// }


//--------------------------------------------

typedef struct point {
    int x;
    int y;
} point;

typedef struct xx {
    double x;
    int y[2];
    double z;
} xx;

int main()
{
    int a = 5;
    int b = 4;
    double c = 3.5;
    double d =  a * c;

    printf("%d\n", (a << 1) + b);
    printf("%d\n", a & 1);
    printf("%d\n", b & 1);

    printf("%lf\n", d);

    printf("%lu\n", sizeof(xx));

    return 0;
}

