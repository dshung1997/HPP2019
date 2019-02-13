#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "point.h"
#include "../graphics/graphics.h"

// use define instead
const int G = 100;
const double e0 = 0.001;
const double delta = 0.00001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;


void next_time_step(point next_points[], int N);
void write_points(char* filename, point list_points[], int N);
void read_points(char* filename, point list_points[], int N);

int test_graphics(char *argv[]);

void execute(point* list_points, int N, int nsteps, char* window_title);

void execute_with_graphics(point* list_points, int N, int nsteps, char* window_title);

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
    int graphics = atoi(argv[5]);

    point list_points[N];


    // make an array of pointer functions
    //-----------------------------------------------------------------

    read_points(filename, list_points, N);

    //-----------------------------------------------------------------



    // for(int n = 0; n < nsteps; n++)
    // {
    //     next_time_step(list_points, N);

    //     printf("----\n");
    //     for(int i = 0; i < N; i++)
    //     {
    //         printf("%d  | ", i);
    //         print_point(list_points[i]);
    //     }
    // }

    // return 0;



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

    write_points("ellipse_N_00010_after200steps.gal", list_points, N);


    return 0;
}

void next_time_step(point next_points[], int N)
{

    point prev_points[N];

    for(int i = 0; i < N; i++)
    {
        prev_points[i] = next_points[i];

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

void execute(point* list_points, int N, int nsteps, char* window_title)
{
    int count_steps = 0;

    while(count_steps < nsteps)
    {
        next_time_step(list_points, N);

        count_steps += 1;

        // printf("%d  | ", count_steps);
        // print_point(list_points[0]);

        printf("----\n");
        for(int i = 0; i < N; i++)
        {
            printf("%d  | ", i);
            print_point(list_points[i]);
        }
    }
}

void execute_with_graphics(point* list_points, int N, int nsteps, char* window_title)
{

    InitializeGraphics(window_title, windowWidth, windowWidth);
    SetCAxes(0,1);

    int count_steps = 0;

    nsteps = 200;
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
        usleep(300000);
        
        next_time_step(list_points, N);
        
        count_steps += 1;

        printf("----\n");
        for(int i = 0; i < N; i++)
        {
            printf("%d  | ", i);
            print_point(list_points[i]);
        }

    }
    
    FlushDisplay();
    CloseDisplay();
}

// int test_graphics(char *argv[]) {

//     void keep_within_box(float* xA, float* yA) {
//     if(*xA > 1)
//         *xA = 0;
//     if(*yA > 1)
//         *yA = 0;
//     }


//   float L=1, W=1;

//   float xA = 0.45;
//   float yA = 0.41;
//   float xB = 0.32;
//   float yB = 0.56;

//   InitializeGraphics(argv[0],windowWidth,windowWidth);
//   SetCAxes(0,1);

//   printf("Hit q to quit.\n");
//   while(!CheckForQuit()) {
//     /* Move A. */
//     xA += 0.0012;
//     yA += 0.0020;
//     keep_within_box(&xA, &yA);
//     /* Move B. */
//     xB += 0.0007;
//     yB += 0.0018;
//     keep_within_box(&xB, &yB);
//     /* Call graphics routines. */
//     ClearScreen();
//     DrawCircle(xA, yA, L, W, circleRadius, circleColor);
//     DrawCircle(xB, yB, L, W, circleRadius, circleColor);
//     Refresh();
//     /* Sleep a short while to avoid screen flickering. */
//     usleep(3000);
//   }
//   FlushDisplay();
//   CloseDisplay();
//   return 0;
// }