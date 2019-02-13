#include <stdio.h>
#include <math.h>
#include "point.h"

const int G = 100;
const double e0 = 0.001;
const double delta_t = 0.00001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

void next_time_step(point next_points[], int N)
{
    point prev_points[N];

    for(int i = 0; i < N; i++)
    {
        prev_points[i] = next_points[i];

        double fx = 0.0, fy = 0.0, Fx = 0.0, Fy = 0.0;

        for(int j = 0; j < N; j++)
        {
            if(i == j) 
                continue;

            double r_x = prev_points[i].p_x - prev_points[j].p_x;
            double r_y = prev_points[i].p_y - prev_points[j].p_y;

            double r = sqrt(r_x*r_x + r_y*r_y);

            double temp_x = prev_points[j].m * r_x / ((r + e0)*(r + e0)*(r + e0));
            double temp_y = prev_points[j].m * r_y / ((r + e0)*(r + e0)*(r + e0));

            fx += temp_x;
            fy += temp_y;
        }

        Fx = - fx * G * prev_points[i].m;
        Fy = - fy * G * prev_points[i].m;

        double ax = Fx / prev_points[i].m;
        double ay = Fy / prev_points[i].m;

        next_points[i].v_x = prev_points[i].v_x + delta_t * ax;
        next_points[i].v_y = prev_points[i].v_y + delta_t * ay;

        next_points[i].p_x = prev_points[i].p_x + delta_t * next_points[i].v_x;
        next_points[i].p_y = prev_points[i].p_y + delta_t * next_points[i].v_y;
    }
}

int main()
{
    int N = 10;
    point list_points[N];
    char filename[] = "../input_data/ellipse_N_00010.gal";
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
        double _p_x, _p_y, _m, _v_x, _v_y, _b;

        fread(&_p_x, sizeof(double), 1, f);
        fread(&_p_y, sizeof(double), 1, f);
        fread(&_m, sizeof(double), 1, f);
        fread(&_v_x, sizeof(double), 1, f);
        fread(&_v_y, sizeof(double), 1, f);
        fread(&_b, sizeof(double), 1, f);

        point temp = new_point(_p_x, _p_y, _m, _v_x, _v_y, _b);

        list_points[counter] = temp;
        
        printf("%d  | ", counter);
        print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);

    //-------------------------------------------------------------
    for(int n = 0; n < 20; n++)
    {
        next_time_step(list_points, N);

        printf("----\n");
        for(int i = 0; i < N; i++)
        {
            printf("%d  | ", i);
            print_point(list_points[i]);
        }
    }

    return 0;
}