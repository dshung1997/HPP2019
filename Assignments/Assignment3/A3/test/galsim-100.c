#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "point.h"
#include "../graphics/graphics.h"

// use define instead
const double G = 100.0;
const double e0 = 0.001;
const double delta = 0.00001;

const double HESO = 500.0;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

//-----------------------------------------------------------------

void next_time_step(point next_points[], int N);

void write_points(char* filename, point list_points[], int N);

void read_points(char* filename, point list_points[], int N);

void execute(point* list_points, int N, int nsteps, char* window_title);

void execute_with_graphics(point* list_points, int N, int nsteps, char* window_title);

//-----------------------------------------------------------------


int main(int argc, char* argv[])
{
    // test_graphics(argv);
    // return 0;

    //-----------------------------------------------------------------

    // if(argc != 6)
    // {
    //     printf("Wrong syntax.\n./galsim N filname nsteps delta_t graphics\n");
    //     return -1;
    // }

    //-----------------------------------------------------------------

    int N = atoi(argv[1]);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    // float delta
    int graphics = atoi(argv[5]);

    point list_points[N];


    // make an array of pointer functions
    //-----------------------------------------------------------------

    read_points(filename, list_points, N);

    //-----------------------------------------------------------------

    //-----------------------------------------------------------------

    if(graphics)
    {
        execute_with_graphics(list_points, N, nsteps, argv[0]);
    }
    else
    {
        execute(list_points, N, nsteps, argv[0]);
    }

    //-----------------------------------------------------------------

    write_points(argv[6], list_points, N);


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
        // prev_points[i] = next_points[i];

        double fx = 0.0, fy = 0.0;

        for(int j = 0; j < N; j++)
        {
            if(i == j) 
                continue;

            double rx = prev_points[i].px - prev_points[j].px;
            double ry = prev_points[i].py - prev_points[j].py;

            double r = sqrt((rx * rx) + (ry * ry));

            // double r1 = (r + e0)*(r + e0)*(r + e0);
            double r1 = pow((r + e0), 3);

            double tempx = (prev_points[j].m * 100.0) / (r1 * 10.0) * rx  / 10.0;
            double tempy = (prev_points[j].m * 100.0) / (r1 * 10.0) * ry  / 10.0;

            fx = fx + tempx;
            fy = fy + tempy;
        }

        double ax = - fx * G;
        double ay = - fy * G;

        next_points[i].vx = prev_points[i].vx + delta * ax;
        next_points[i].vy = prev_points[i].vy + delta * ay;

        // next_points[i].px = prev_points[i].px + delta * next_points[i].vx;
        // next_points[i].py = prev_points[i].py + delta * next_points[i].vy;

        next_points[i].px = prev_points[i].px + delta * prev_points[i].vx + delta * delta * ax;
        next_points[i].py = prev_points[i].py + delta * prev_points[i].vy + delta * delta * ay;
    }
}

void write_points(char* filename, point list_points[], int N)
{
    FILE* fw = fopen(filename, "wb");

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;
        _px = list_points[i].px / HESO;
        _py = list_points[i].py / HESO;
        _m = list_points[i].m / HESO;
        _vx = list_points[i].vx / HESO;
        _vy = list_points[i].vy / HESO;
        _b = list_points[i].b / HESO;
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

        point temp = new_point(_px*HESO, _py*HESO, _m*HESO, _vx*HESO, _vy*HESO, _b*HESO);

        list_points[counter] = temp;
        
        printf("%d  | ", counter);
        print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);
}

void execute(point* list_points, int N, int nsteps, char* window_title)
{
    int count_steps = 0;

    while(count_steps < nsteps)
    {
        next_time_step(list_points, N);
        // print_list_points(list_points, N);

        count_steps += 1;

        // printf("----\n");
        // for(int i = 0; i < N; i++)
        // {
        //     printf("%d  | ", i);
        //     print_point(list_points[i]);
        // }
    }
}

void execute_with_graphics(point* list_points, int N, int nsteps, char* window_title)
{

    InitializeGraphics(window_title, windowWidth, windowWidth);
    SetCAxes(0,1);

    int count_steps = 0;

    while(
        count_steps < nsteps 
        && !CheckForQuit()
    )
    {
        ClearScreen();
        for(int i = 0; i < N; i++)
        {
            DrawCircle(list_points[i].px, list_points[i].py, L, W, circleRadius, circleColor);
        }
        Refresh();
        /* Sleep a short while to avoid screen flickering. */
        usleep(50000);
        
        next_time_step(list_points, N);
        // print_list_points(list_points, N);
        
        count_steps += 1;

        // printf("----\n");
        // for(int i = 0; i < N; i++)
        // {
        //     printf("%d  | ", i);
        //     print_point(list_points[i]);
        // }

    }
    
    FlushDisplay();
    CloseDisplay();
}