#include <stdio.h>

typedef struct point {
    int x;
    int y;
} point;

int main()
{
    point a[2];
    for(int i = 0; i < 2; i++)
    {
        point p;
        p.x = i;
        p.y = i+10;

        a[i] = p;
    }

    for(int i = 0; i < 2; i++)
    {
        printf("(%d %d) ", a[i].x, a[i].y);
    }

    point b[2];
    for(int i = 0; i < 2; i++)
    {
        b[i] = a[i];
        b[i].x += 100;
        b[i].y += 100;
    }

    for(int i = 0; i < 2; i++)
    {
        printf("(%d %d) ", a[i].x, a[i].y);
    }

    printf("\n");

    for(int i = 0; i < 2; i++)
    {
        printf("(%d %d) ", b[i].x, b[i].y);
    }

    printf("\n");

    return 0;
}