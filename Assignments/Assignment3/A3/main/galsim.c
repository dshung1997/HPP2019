#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "point.h"
#include "graphics.h"

// use define instead
double G = 100.0;
const double e0 = 0.001;
// const double delta = 0.00001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

//-----------------------------------------------------------------

void next_time_step(point next_points[], int N, double delta);

void write_points(char* filename, point list_points[], int N);

void read_points(char* filename, point list_points[], int N);

void execute(point* list_points, int N, int nsteps, double delta, char* window_title);

void execute_with_graphics(point* list_points, int N, int nsteps, double delta, char* window_title);

void output_filename(char* input, char* output, int nsteps);


double get_wall_seconds(){
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double seconds = tv.tv_sec + (double)tv.tv_usec/1000000;

    return seconds;
}


//-----------------------------------------------------------------

int main(int argc, char* argv[])
{
    // check arguments
    if(argc != 6)
    {
        printf("Wrong syntax.\n./galsim N filname nsteps delta_t graphics\n");
        return -1;
    }

    //-----------------------------------------------------------------

    // initialization
    int N = atoi(argv[1]);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    double delta = (double) atof(argv[4]);
    int graphics = atoi(argv[5]);
    G /= (double) N;
    point list_points[N];

    //-----------------------------------------------------------------

    // read data
    read_points(filename, list_points, N);

    //-----------------------------------------------------------------

    // calculation with and without graphics 
    // void (*func_pointer[2])(point*, int, int, double, char*);
    // func_pointer[0] = &execute;
    // func_pointer[1] = &execute_with_graphics;

    // (*func_pointer[graphics])(list_points, N, nsteps, delta, argv[0]);

    if(graphics)
    {
        execute_with_graphics(list_points, N, nsteps, delta, argv[0]);
    }
    else
    {
        double t1 = get_wall_seconds();
        execute(list_points, N, nsteps, delta, argv[0]);
        double t2 = get_wall_seconds();
        printf("---\nExecution time: %lf\n", t2-t1);
    }

    

    //-----------------------------------------------------------------

    // write data
    char output[80] = "";
    output_filename(filename, output, nsteps);
    printf("---\n%s\n---\n", output);

    write_points(output, list_points, N);

    // print_list_points(list_points, N);

    // point list_points_2[N];
    // printf("---\n");
    // read_points("../ref_output_data/circles_N_2_after3steps.gal", list_points_2, 2);

    return 0;
}

void next_time_step(point next_points[], int N, double delta)
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

            double rx = prev_points[i].px - prev_points[j].px;
            double ry = prev_points[i].py - prev_points[j].py;

            double r = sqrt((rx * rx) + (ry * ry));

            // double r1 = pow((r + e0), 3);
            double r1 = (r + e0) * (r + e0) * (r + e0);

            double tempx = prev_points[j].m * rx / r1;
            double tempy = prev_points[j].m * ry / r1;

            fx = fx + tempx;
            fy = fy + tempy;
        }

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
        
        // printf("%d  | ", counter);
        // print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);
}

void execute(point* list_points, int N, int nsteps, double delta, char* window_title)
{
    for(int i = 0; i < nsteps; i++)
    {
        next_time_step(list_points, N, delta);
        // printf("---\n");
        // printf("%d\n", i+1  );
        // print_list_points(list_points, N);
    }
}

void execute_with_graphics(point* list_points, int N, int nsteps, double delta, char* window_title)
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
        usleep(15000);
        
        next_time_step(list_points, N, delta);
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

void output_filename(char* input, char* output, int nsteps)
{
    int len_input = strlen(input);
    int p = 0;
    for(int i = len_input-1; i >= 0; i--)
    {
        if(input[i] == '/')
        {
            p = i+1;
            break;
        }
    }

    char str_nsteps[10];
    sprintf(str_nsteps, "%d", nsteps);

    int len = strlen(input)-p;
    strncpy(output, input+p, len-4);
    strcat(output, "_after");
    strcat(output, str_nsteps);
    strcat(output, "steps.gal");
}