#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "point.h"
#include "graphics.h"


// Define constants and global variables
double G = 100.0;
const double e0 = 0.001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

// Define functions
void output_filename(char* input, char* output, int nsteps);
void execute_with_graphics(double* restrict px, double* restrict py, double* restrict m, double* restrict vx, double* restrict vy, double* restrict b, int N, int nsteps, double delta, char* window_title);
void execute(double* restrict px, double* restrict py, double* restrict m, double* restrict vx, double* restrict vy, double* restrict b, int N, int nsteps, double delta, char* window_title);
void read_points(char* filename, double* restrict px, double* restrict py, double* restrict m, double* restrict vx, double* restrict vy, double* restrict b, int N);
void write_points(char* filename, double* restrict px, double* restrict py, double* restrict m, double* restrict vx, double* restrict vy, double* restrict b, int N);
void next_time_step(double* restrict next_px, double* restrict next_py, double* restrict m, double* restrict next_vx, double*  restrict next_vy, int N, double delta);
void display(double* restrict px, double* restrict py, double* restrict m, double* restrict vx, double* restrict vy, double* restrict b, int N, int j) ;


double get_wall_seconds(){
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double seconds = tv.tv_sec + (double)tv.tv_usec/1000000;

    return seconds;
}


// Main function
int main(int argc, char* argv[])
{
    // check arguments
    if(argc != 6)
    {
        printf("Wrong syntax.\n./galsim N filname nsteps delta_t graphics\n");
        return -1;
    }

    // initialization
    int N = atoi(argv[1]);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    double delta = (double) atof(argv[4]);
    int graphics = atoi(argv[5]);
    G /= (double) N;

    double px[N];
    double py[N];
    double m[N];
    double vx[N];
    double vy[N];
    double b[N];


    // read data from file
    read_points(filename, px, py, m, vx, vy, b, N);

    if(graphics)
    {
        execute_with_graphics(px, py, m, vx, vy, b, N, nsteps, delta, argv[0]);
    }
    else
    {
        double t1 = get_wall_seconds();
        
        execute(px, py, m, vx, vy, b, N, nsteps, delta, argv[0]);
        
        double t2 = get_wall_seconds();
        printf("---\nExecution time: %lf\n", t2-t1);
    }

    // write data to file
    char output[] = "result.gal";
    write_points(output, px, py, m, vx, vy, b, N);

    return 0;
}

void next_time_step(double* restrict next_px, double* restrict next_py, double* restrict m, double* restrict next_vx, double* restrict next_vy, int N, double delta)
{
    // Declare and initialize the previous values of the velocity and positions.
    double prev_px[N], prev_py[N], prev_vx[N], prev_vy[N];

    size_t copy_size = N * sizeof(double);
    memcpy(prev_px, next_px, copy_size);
    memcpy(prev_py, next_py, copy_size);
    memcpy(prev_vx, next_vx, copy_size);
    memcpy(prev_vy, next_vy, copy_size);

    // Force along x-axis and y-axis
    double fx[N], fy[N];

    for(int i = 0; i < N; i++)
    {
        fx[i] = 0;
        fy[i] = 0;
    }

    for(int i = 0; i < N; i++)
    {
        for(int j = i+1; j < N; j++)
        {
            double rx = prev_px[i] - prev_px[j];
            double ry = prev_py[i] - prev_py[j];

            double r = sqrt((rx * rx) + (ry * ry));

            double r1 = (r + e0) * (r + e0) * (r + e0);

            double rx_d = rx / r1;
            double ry_d = ry / r1;

            fx[i] += (- rx_d * m[j]);
            fy[i] += (- ry_d * m[j]);

            fx[j] += (rx_d * m[i]);
            fy[j] += (ry_d * m[i]);
        }

        double ax = fx[i] * G;
        double ay = fy[i] * G;

        next_vx[i] = prev_vx[i] + delta * ax;
        next_vy[i] = prev_vy[i] + delta * ay;

        next_px[i] = prev_px[i] + delta * next_vx[i];
        next_py[i] = prev_py[i] + delta * next_vy[i];
    }
}

void write_points(char* filename, double* px, double* py, double* m, double* vx, double* vy, double* b, int N)
{
    FILE* fw = fopen(filename, "wb");

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;
        _px = px[i];
        _py = py[i];
        _m = m[i];
        _vx = vx[i];
        _vy = vy[i];
        _b = b[i];

        int check[6];
        
        check[0] = fwrite(&_px, sizeof(double), 1, fw);
        check[1] = fwrite(&_py, sizeof(double), 1, fw);
        check[2] = fwrite(&_m, sizeof(double), 1, fw);
        check[3] = fwrite(&_vx, sizeof(double), 1, fw);
        check[4] = fwrite(&_vy, sizeof(double), 1, fw);
        check[5] = fwrite(&_b, sizeof(double), 1, fw);

        if(!(check[0]) | !(check[1]) | !(check[2]) | !(check[3]) | !(check[4]) | !(check[5]))
        {
            printf("There's an error writing to file %s\n", filename);
            fclose(fw);
            return;
        }
    }

    fclose(fw);
}

void read_points(char* filename, double* px, double* py, double* m, double* vx, double* vy, double* b, int N)
{
    FILE* f = fopen(filename, "rb");

    if(!f)
    {
        printf("Cannot read file: %s.\n", filename);
        return;
    }

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;

        int check[6];
        check[0] = fread(&_px, sizeof(double), 1, f);
        check[1] = fread(&_py, sizeof(double), 1, f);
        check[2] = fread(&_m, sizeof(double), 1, f);
        check[3] = fread(&_vx, sizeof(double), 1, f);
        check[4] = fread(&_vy, sizeof(double), 1, f);
        check[5] = fread(&_b, sizeof(double), 1, f);

        if(!(check[0]) | !(check[1]) | !(check[2]) | !(check[3]) | !(check[4]) | !(check[5]))
        {
            printf("There's an error reading file %s\n", filename);
            fclose(f);
            return;
        }

        px[i] = _px;
        py[i] = _py;
        m[i] = _m;
        vx[i] = _vx;
        vy[i] = _vy;
        b[i] = _b;
    }

    fclose(f);
}

void execute(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int nsteps, double delta, char* window_title)
{
    for(int i = 0; i < nsteps; i++)
    {
        next_time_step(px, py, m, vx, vy, N, delta);        
    }
}

void execute_with_graphics(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int nsteps, double delta, char* window_title)
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
            DrawCircle(px[i], py[i], L, W, circleRadius, circleColor);
        }
        Refresh();
        /* Sleep a short while to avoid screen flickering. */
        usleep(15000);
        
        next_time_step(px, py, m, vx, vy, N, delta);
        
        count_steps += 1;
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


void display(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int j)
{
    printf("---\n");
    printf("%d\n", j+1);
    for(int i = 0; i < N; i++)
    {
        printf("%lf    %lf    %lf    %lf    %lf    %lf\n", px[i], py[i], m[i], vx[i], vy[i], b[i]);
    }
}
