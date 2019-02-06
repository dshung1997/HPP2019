#include <stdio.h>

int main()
{
    int a;
    double b;
    char c;
    float d;

    FILE* f = fopen("little_bin_file", "rb");

    if(f == NULL) 
    {
        printf("Cannot open file little_bin_file !");
        return -1;
    }

    fread(&a, sizeof(int), 1, f);
    printf("%d\n", a);

    fread(&b, sizeof(double), 1, f);
    printf("%lf\n", b);

    fread(&c, sizeof(char), 1, f);
    printf("%c\n", c);

    fread(&d, sizeof(float), 1, f);
    printf("%f", d);

    fclose(f);

    return 0;
}