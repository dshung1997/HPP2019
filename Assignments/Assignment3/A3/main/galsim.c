#include <stdio.h>
#include <stdlib.h>
#include "point.h"

// use define instead
const int G = 100;
const float e0 = 0.001;
const float delta_t = 0.00001;

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
    char filename[] = "../input_data/circles_N_2.gal";
    int nsteps = atoi(argv[3]);
    // float delta_t
    int graphics = atoi(argv[5]);

    point list_points[N];

    //-----------------------------------------------------------------

    FILE* f = fopen(filename, "rb");

    if(!f)
    {
        printf("Cannot read file: %s.\n", filename);
        return -1;
    }

    int counter = 0;
    while(!feof(f))
    {
        if(counter == N)
            break;
        // use an array instead
        double _p_x, _p_y, _m, _v_x, _v_y;

        fread(&_p_x, sizeof(double), 1, f);
        fread(&_p_y, sizeof(double), 1, f);
        fread(&_m, sizeof(double), 1, f);
        fread(&_v_x, sizeof(double), 1, f);
        fread(&_v_y, sizeof(double), 1, f);

        point temp = new_point(_p_x, _p_y, _m, _v_x, _v_y);

        list_points[counter] = temp;
        
        print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);


    return 0;
}