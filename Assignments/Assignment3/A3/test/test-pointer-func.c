#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void a(int x){
    printf("%d", x);
}

void exec();

void cal(double (*x)[2])
{
    x[1][1] = 1000;
}

void b(int x){
    printf("%d", 100+x);
}

int main()
{
    void (*f[2])(int);
    f[0] = &a;
    f[1] = &b;

    (*f[0])(5);

    exec();

    double x[2][2] = {{1, 1}, {1, 1}};
    cal(x);
    
    for(int i = 0; i < 2; i++)
    {
        for(int j = 0; j < 2; j++)
        {
            printf("%lf ", x[i][j]);
        }

        printf("\n");
    }

    return 0;
}

void exec()
{
    int a[2][4] = {{1, 2, 3, 4}, {11, 22, 33, 44}};
    int b[2][4];

    memcpy((void*)b, (void*)a, sizeof(a));

    printf("\n");
    for(int i = 0; i < 2; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            printf("%d ", b[i][j]);
        }

        printf("\n");
    }
}


