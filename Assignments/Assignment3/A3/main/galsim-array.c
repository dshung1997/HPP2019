#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "graphics.h"

// use define instead
double G = 100.0;
const double e0 = 0.001;
// const double delta = 0.00001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

const int _PX_ = 0;
const int _PY_ = 1;

const int _VX_ = 2;
const int _VY_ = 3;

const int _M_ = 4;

//-----------------------------------------------------------------

void output_filename(char* input, char* output, int nsteps);
void execute_with_graphics(double (*params)[], int N, int nsteps, double delta, char* window_title);
void execute(double (*params)[], int N, int nsteps, double delta, char* window_title);
void read_array(char* filename, double (*params)[], double* brightness, int N);
void write_array(char* filename, double (*params)[], double* brightness, int N);
void calculate_next(double (*next_params)[], int N, double delta);

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
    printf("N : %d\n", N);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    double delta = (double) atof(argv[4]);
    int graphics = atoi(argv[5]);
    G /= (double) N;

    double params[N][5];
    double brightness[N];

    

    //-----------------------------------------------------------------

    // read data
    read_array(filename, params, brightness, N);
    
    //-----------------------------------------------------------------

    // calculation with and without graphics 
    // void (*func_pointer[2])(point*, int, int, double, char*);
    // func_pointer[0] = &execute;
    // func_pointer[1] = &execute_with_graphics;

    // (*func_pointer[graphics])(list_points, N, nsteps, delta, argv[0]);

    if(graphics)
    {
        execute_with_graphics(params, N, nsteps, delta, argv[0]);
    }
    else
    {
        double t1 = get_wall_seconds();
        execute(params, N, nsteps, delta, argv[0]);
        double t2 = get_wall_seconds();
        printf("---\nExecution time: %lf\n", t2-t1);
    }

    

    //-----------------------------------------------------------------

    // write data
    char output[80] = "";
    output_filename(filename, output, nsteps);
    printf("---\n%s\n---\n", output);

    write_array(output, params, brightness, N);

    return 0;
}

void calculate_next(double (*next_params)[5], int N, double delta)
{
    double prev_params[N][5];

    memcpy(prev_params, next_params, sizeof(prev_params));

    for(int i = 0; i < N; i++)
    {
        double fx = 0.0, fy = 0.0;

        for(int j = 0; j < N; j++)
        {
            if(i == j) 
                continue;

            double rx = prev_params[i][_PX_] - prev_params[j][_PX_];
            double ry = prev_params[i][_PY_] - prev_params[j][_PY_];

            double r = sqrt((rx * rx) + (ry * ry));

            // double r1 = (r + e0)*(r + e0)*(r + e0);
            double r1 = (r + e0) * (r + e0) * (r + e0);
            // pow((r + e0), 3);

            double tempx = prev_params[j][_M_] * rx / r1;
            double tempy = prev_params[j][_M_] * ry / r1;

            fx = fx + tempx;
            fy = fy + tempy;
        }

        double ax = - fx * G;
        double ay = - fy * G;

        next_params[i][_VX_] = prev_params[i][_VX_] + delta * ax;
        next_params[i][_VY_] = prev_params[i][_VY_] + delta * ay;

        next_params[i][_PX_] = prev_params[i][_PX_] + delta * next_params[i][_VX_];
        next_params[i][_PY_] = prev_params[i][_PY_] + delta * next_params[i][_VY_];
    }
}

void write_array(char* filename, double (*params)[5], double* brightness, int N)
{
    FILE* fw = fopen(filename, "wb");

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;
        _px = params[i][_PX_];
        _py = params[i][_PY_];
        _m = params[i][_M_];
        _vx = params[i][_VX_];
        _vy = params[i][_VY_];
        _b = brightness[i];
        fwrite(&_px, sizeof(double), 1, fw);
        fwrite(&_py, sizeof(double), 1, fw);
        fwrite(&_m, sizeof(double), 1, fw);
        fwrite(&_vx, sizeof(double), 1, fw);
        fwrite(&_vy, sizeof(double), 1, fw);
        fwrite(&_b, sizeof(double), 1, fw);
    }

    fclose(fw);
}

void read_array(char* filename, double (*params)[5], double* brightness, int N)
{
    FILE* f = fopen(filename, "rb");

    
    if(!f)
    {
        printf("Cannot read file: %s.\n", filename);
        return;
    }
    
    for(int i = 0; i < N; i++)
    {
        
        // use an array instead
        double  _b;

        fread(&params[i], sizeof(double), 5, f);
              
        fread(&_b, sizeof(double), 1, f);

        brightness[i] = _b; 
    }
    
    fclose(f);
    
}

void execute(double (*params)[5], int N, int nsteps, double delta, char* window_title)
{
    for(int i = 0; i < nsteps; i++)
    {
        calculate_next(params, N, delta);
    }
}

void execute_with_graphics(double (*params)[5], int N, int nsteps, double delta, char* window_title)
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
            DrawCircle(params[i][_PX_], params[i][_PY_], L, W, circleRadius, circleColor);
        }
        Refresh();

        /* Sleep a short while to avoid screen flickering. */
        usleep(5000);
        
        calculate_next(params, N, delta);
        
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