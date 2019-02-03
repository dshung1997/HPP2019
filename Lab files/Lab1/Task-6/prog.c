#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(int argc, char* const argv[])
{
    if(argc != 2) {
        printf("Wrong number of arguments !");
        return -1;
    }

    int a = atoi(argv[1]);

    int b = (int) sqrt(a);

    if(b * b == a) printf("Yes");
    else printf("No");

    return 0;
}