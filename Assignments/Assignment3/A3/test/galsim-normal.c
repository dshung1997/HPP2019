#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "point.h"

// use define instead
const int G = 100;
const double e0 = 0.001;
const double delta = 0.00001;


void next_time_step(point next_points[], int N);
void write_points(char* filename, point list_points[], int N);
void read_points(char* filename, point list_points[], int N);

int main(int argc, char* argv[])
{
    // test_graphics(argv);
    // return 0;

    //-----------------------------------------------------------------

    if(argc != 6)
    {
        printf("Wrong syntax.\n./galsim N filname nsteps delta_t graphics\n");
        return -1;
    }

    //-----------------------------------------------------------------

    int N = atoi(argv[1]);
    char filename[] = "../input_data/ellipse_N_00010.gal";
    int nsteps = atoi(argv[3]);
    // float delta
    // int graphics = atoi(argv[5]);

    point list_points[N];

    //-----------------------------------------------------------------

    read_points(filename, list_points, N);

    //-----------------------------------------------------------------

    for(int n = 0; n < 2; n++)
    {
        next_time_step(list_points, N);

        printf("----\n");
        for(int i = 0; i < N; i++)
        {
            printf("%d  | ", i);
            print_point(list_points[i]);
        }
    }

    //-----------------------------------------------------------------


    //-----------------------------------------------------------------

    write_points("ellipse_N_00010_after200steps.gal", list_points, N);


    return 0;
}

void next_time_step(point next_points[], int N)
{

    point prev_points[N];


    for(int i = 0; i < N; i++)
    {
        prev_points[i] = next_points[i];
    }

    for(int i = 0; i < N; i++)
    {
        double fx = 0.0, fy = 0.0;

        for(int j = 0; j < N; j++)
        {
            if(i == j) 
                continue;

            double r_x = prev_points[i].px - prev_points[j].px;
            double r_y = prev_points[i].py - prev_points[j].py;

            double r = sqrt(r_x*r_x + r_y*r_y);

            double tempx = prev_points[j].m * r_x / ((r + e0)*(r + e0)*(r + e0));
            double tempy = prev_points[j].m * r_y / ((r + e0)*(r + e0)*(r + e0));

            fx += tempx;
            fy += tempy;
        }

        // Fx =  * prev_points[i].m;
        // Fy =  * prev_points[i].m;

        double ax = - fx * G;
        double ay = - fy * G;

        next_points[i].vx = prev_points[i].vx + delta * ax;
        next_points[i].vy = prev_points[i].vy + delta * ay;

        next_points[i].px = prev_points[i].px + delta * next_points[i].vx;
        next_points[i].py = prev_points[i].py + delta * next_points[i].vy;
    }
}

void write_points(char* filename, point list_points[], int N)
{
    FILE* fw = fopen(filename, "wb");

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;
        _px = list_points[i].px;
        _py = list_points[i].py;
        _m = list_points[i].m;
        _vx = list_points[i].vx;
        _vy = list_points[i].vy;
        _b = list_points[i].b;
        fwrite(&_px, sizeof(double), 1, fw);
        fwrite(&_py, sizeof(double), 1, fw);
        fwrite(&_m, sizeof(double), 1, fw);
        fwrite(&_vx, sizeof(double), 1, fw);
        fwrite(&_vy, sizeof(double), 1, fw);
        fwrite(&_b, sizeof(double), 1, fw);
    }

    fclose(fw);
}

void read_points(char* filename, point list_points[], int N)
{
    FILE* f = fopen(filename, "rb");

    if(!f)
    {
        printf("Cannot read file: %s.\n", filename);
        return;
    }

    int counter = 0;
    while(!feof(f))
    {
        if(counter == N)
            break;
        // use an array instead
        double _px, _py, _m, _vx, _vy, _b;

        fread(&_px, sizeof(double), 1, f);
        fread(&_py, sizeof(double), 1, f);
        fread(&_m, sizeof(double), 1, f);
        fread(&_vx, sizeof(double), 1, f);
        fread(&_vy, sizeof(double), 1, f);
        fread(&_b, sizeof(double), 1, f);

        point temp = new_point(_px, _py, _m, _vx, _vy, _b);

        list_points[counter] = temp;
        
        printf("%d  | ", counter);
        print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);
}