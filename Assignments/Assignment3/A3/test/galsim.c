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
void output_filename(char* input, char* output, int nsteps);
void execute_with_graphics(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int nsteps, double delta, char* window_title);
void execute(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int nsteps, double delta, char* window_title);
void read_points(char* filename, double* px, double* py, double* m, double* vx, double* vy, double* b, int N);
void write_points(char* filename, double* px, double* py, double* m, double* vx, double* vy, double* b, int N);
void next_time_step(double* next_px, double* next_py, double* m, double* next_vx, double* next_vy, int N, double delta);
void display(double* px, double* py, double* m, double* vx, double* vy, double* b, int N, int j);

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

    //------
    double px[N];
    double py[N];
    double m[N];
    double vx[N];
    double vy[N];
    double b[N];

    //-----------------------------------------------------------------

    // read data
    read_points(filename, px, py, m, vx, vy, b, N);
    // display(px, py, m, vx, vy, b, N, 0);


    //-----------------------------------------------------------------

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

    //-----------------------------------------------------------------

    // write data
    char output[80] = "";
    output_filename(filename, output, nsteps);
    printf("---\n%s\n---\n", output);

    write_points(output, px, py, m, vx, vy, b, N);

    return 0;
}

void next_time_step(double* next_px, double* next_py, double* m, double* next_vx, double* next_vy, int N, double delta)
{
    double prev_px[N], prev_py[N], prev_vx[N], prev_vy[N];

    size_t copy_size = N * sizeof(double);
    memcpy(prev_px, next_px, copy_size);
    memcpy(prev_py, next_py, copy_size);
    memcpy(prev_vx, next_vx, copy_size);
    memcpy(prev_vy, next_vy, copy_size);

    double fx1[100000];
    
    // fx[i][j] is the below formula of point j on point i along a axis
    // - mi * mj * rij / (|rij| + e0) ^ 3
    double fx[N][N], fy[N][N];

    for(int i = 0; i < N; i++)
    {
        for(int j = 0; j < N; j++)
        {
            fx[i][j] = 0;
            fy[i][j] = 0;
        }
    }

    for(int i = 0; i < N; i++)
    {
        // double _fx = 0.0, _fy = 0.0;

        for(int j = i+1; j < N; j++)
        {
            double rx = prev_px[i] - prev_px[j];
            double ry = prev_py[i] - prev_py[j];

            double r = sqrt((rx * rx) + (ry * ry));

            double r1 = (r + e0) * (r + e0) * (r + e0);

            // double rx_d = rx / r1;
            // double ry_d = ry / r1;

            fx[i][j] = - rx / r1 * m[j];
            fy[i][j] = - ry / r1 * m[j];

            fx[j][i] =   rx / r1 * m[i];
            fy[j][i] =   ry / r1 * m[i];
        }
    }

    // printf("-----fx---------------------\n");
    // for(int i = 0; i < N; i++)
    // {
    //     for(int j = 0; j < N; j++)
    //     {
    //         printf("%11lf ", fx[i][j]);
    //     }
    //     printf("\n");
    // }

    // printf("-----fy---------------------\n");
    // for(int i = 0; i < N; i++)
    // {
    //     for(int j = 0; j < N; j++)
    //     {
    //         printf("%11lf ", fy[i][j]);
    //     }
    //     printf("\n");
    // }

    // try to unroll loops
    // try to use vector

    // printf("ax: ");
    for(int i = 0; i < N; i++)
    {
        double _fx = 0.0;
        double _fy = 0.0;

        for(int j = 0; j < N; j++)
        {
            _fx += fx[i][j];
            _fy += fy[i][j];
        }

        double ax = _fx * G;
        double ay = _fy * G;

        // printf("%11lf ", ax);

        next_vx[i] = prev_vx[i] + delta * ax;
        next_vy[i] = prev_vy[i] + delta * ay;

        next_px[i] = prev_px[i] + delta * next_vx[i];
        next_py[i] = prev_py[i] + delta * next_vy[i];
    }
    // printf("\n");
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
        fwrite(&_px, sizeof(double), 1, fw);
        fwrite(&_py, sizeof(double), 1, fw);
        fwrite(&_m, sizeof(double), 1, fw);
        fwrite(&_vx, sizeof(double), 1, fw);
        fwrite(&_vy, sizeof(double), 1, fw);
        fwrite(&_b, sizeof(double), 1, fw);
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

        fread(&_px, sizeof(double), 1, f);
        fread(&_py, sizeof(double), 1, f);
        fread(&_m, sizeof(double), 1, f);
        fread(&_vx, sizeof(double), 1, f);
        fread(&_vy, sizeof(double), 1, f);
        fread(&_b, sizeof(double), 1, f);

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
        // display(px, py, m, vx, vy, b, N, i);
        
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
        // display(px, py, m, vx, vy, b, N, count_steps);
        
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