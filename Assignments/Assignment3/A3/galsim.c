#include <stdio.h>
#include <stdlib.h>

#define G 100
#define e0 0.001
#define delta_t 0.00001

typedef struct point {
    // may use an array instead
    double p_x;
    double p_y;
    double m;
    double v_x;
    double v_y;
} point;

int main(int argc, const char* argv[])
{
    //-----------------------------------------------------------------

    if(argc != 6)
    {
        printf("Wrong syntax.\n");
        return -1;
    }

    //-----------------------------------------------------------------

    int N = atoi(argv[1]);
    char filename[] = "input_data/circles_N_2.gal";
    int nsteps = atoi(argv[3]);
    // float delta_t
    int graphics = atoi(argv[5]);

    //-----------------------------------------------------------------

    FILE* f = fopen(filename, "rb");

    if(!f)
    {
        printf("Cannot read file: %s.\n", filename);
        return -1;
    }

    

    fclose(f);


    return 0;
}