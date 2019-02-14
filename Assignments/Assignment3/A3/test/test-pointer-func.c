#include <stdio.h>

void a(int x){
    printf("%d", x);
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

    return 0;
}