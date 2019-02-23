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

int quad_get_index(double px, double py, double cx, double cy);

int main()
{
    // int a = 5;
    // int b = 4;
    // double c = 3.5;
    // double d =  a * c;

    // printf("%d\n", (a << 1) + b);
    // printf("%d\n", a & 1);
    // printf("%d\n", b & 1);

    // printf("%lf\n", d);

    // printf("%lu\n", sizeof(xx));


    // char x = 1 < 2;
    // char y = 3 < 4;
    // int z = x * 2 + y;
    // printf("%d %ld %ld\n", z, sizeof(x), sizeof(z));

    // printf("%d\n", quad_get_index(0.3, 0.3, 0.5, 0.5));
    // printf("%d\n", quad_get_index(0.8, 0.3, 0.5, 0.5));
    // printf("%d\n", quad_get_index(0.3, 0.8, 0.5, 0.5));
    // printf("%d\n", quad_get_index(0.8, 0.8, 0.5, 0.5));


    // char m = 3;
    // int mm[] = {0, 1, 2, 3};
    // printf("%d\n", mm[m]);

    double x1 = 0.238742984;
    double x2 = 0.837287238;

    for(int i = 0; i < 3000; i++)
    {
        double x3 = x1 / x2; 
    }

    return 0;
}


int quad_get_index(double px, double py, double cx, double cy)
{
    char ix; // index x
    char iy; // index y

    // double cx = q->cx;
    // double cy = q->cy;

    // double px = p->px;
    // double py = p->py;

    iy = py > cy;
    ix = px > cx;

    // if(py <= cy)
    //     iy = 0;
    // else
    //     iy = 1;

    // if(px <= cx)
    //     ix = 0;
    // else
    //     ix = 1;


    return (iy << 1) + ix;
}
