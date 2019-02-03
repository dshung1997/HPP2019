#include <stdio.h>
#include <math.h>

int main()
{
    int a;
    printf("Enter the integer: ");
    scanf("%d", &a);

    int b = (int) sqrt(a);

    if(b * b == a) printf("Yes");
    else printf("No");

    return 0;
}