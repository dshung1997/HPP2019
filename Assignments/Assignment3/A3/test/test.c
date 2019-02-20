#include <stdio.h>
#include <string.h>

int main()
{
    // double a[4] = {1, 2, 3, 4};
    // double b[4];

    // memcpy(b, a, sizeof(a));

    // for(int i = 0 ; i < 4; i++)
    // {
    //     printf("%lf ", b[i]);
    // }

    int n = 10;
    for(int i = 0; i < n; i++)
    {
        printf("%d | ", i);
        for(int j = 0; j < i; j++)
        {
            printf("%d ", j);
        }
        printf(" | ");
        for(int j = i; j < n; j++)
        {
            printf("%d ", j);
        }

        printf("\n");
    }

    int aa[4][5];
    printf("%lu\n", sizeof(aa));

    return 0;
}