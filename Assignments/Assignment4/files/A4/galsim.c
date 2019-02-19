#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "Quad.h"
#include "graphics.h"

// use define instead
double G = 100.0;
const double e0 = 0.001;
// const double delta = 0.00001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

//-----------------------------------------------------------------
void write_points(char* filename, point list_points[], int N);

void read_points(char* filename, point list_points[], int N);

void execute(point* list_points, int N, int nsteps, double delta, char* window_title);

void display(quad* q, point* list_points, int N, int nsteps, double delta, char* window_title);
void display_quad_rectangle(quad* q);

void update_point(point p, quad* q, double theta_max, double* fx, double* fy);
void output_filename(char* input, char* output, int nsteps);

void execute_with_graphics(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title);


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
    if(argc != 7)
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
    double theta_max = (double) atof(argv[5]);
    int graphics = atoi(argv[6]);
    G /= (double) N;

    point list_points[N];

    //-----------------------------------------------------------------

    // read data
    read_points(filename, list_points, N);

    //-----------------------------------------------------------------
    execute_with_graphics(list_points, N, nsteps, delta, theta_max, argv[0]);

 
    // char output[80] = "";
    // output_filename(filename, output, nsteps);
    // printf("---\n%s\n---\n", output);

    // write_points(output, list_points, N);


    return 0;
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

        point temp = point_new(_px, _py, _m, _vx, _vy, _b);

        list_points[counter] = temp;
        
        // printf("%d  | ", counter);
        // print_point(list_points[counter]);

        counter += 1;
    }

    fclose(f);
}

void display(quad* qtree, point* list_points, int N, int nsteps, double delta, char* window_title)
{

    InitializeGraphics(window_title, windowWidth, windowWidth);
    SetCAxes(0,1);

    while(
        !CheckForQuit()
    )
    {
        ClearScreen();
        for(int i = 0; i < N; i++)
        {
            DrawCircle(list_points[i].px, list_points[i].py, L, W, circleRadius, circleColor);
        }

        display_quad_rectangle(qtree);


        Refresh();

        usleep(3000);
    }
    
    FlushDisplay();
    CloseDisplay();
}

void display_quad_rectangle(quad* q)
{
    if(q == NULL)
        return;

    double cx = q->cx;
    double cy = q->cy;

    double half_w = (q->w) / 2.0;

    DrawRectangle(cx-half_w, cy-half_w, L, W, q->w, q->w, circleColor);
    for(int i = 0; i < 4; i++)
    {
        display_quad_rectangle((q->child)[i]);
    }
}

void next_time_step(point* next_points, quad* q, int N, double delta, double theta_max)
{
    point prev_points[N];
    for(int i = 0; i < N; i++)
    {
        prev_points[i] = next_points[i];
    }

    for(int i = 0; i < N; i++)
    {
        double fx = 0;
        double fy = 0;

        update_point(prev_points[i], q, theta_max, &fx, &fy);

        double ax = - fx * G;
        double ay = - fy * G;

        next_points[i].vx = prev_points[i].vx + delta * ax;
        next_points[i].vy = prev_points[i].vy + delta * ay;

        next_points[i].px = prev_points[i].px + delta * next_points[i].vx;
        next_points[i].py = prev_points[i].py + delta * next_points[i].vy;
    }
}

void update_point(point p, quad* q, double theta_max, double* fx, double* fy)
{
    if(q == NULL)
        return;

    double w = q->w;    // get the width
    double m = q->m;    // get the mass
    double cx = q->cx;  // get the position x of the center
    double cy = q->cy;  // get the position y of the center

    double rx = p.px - cx; // get the distance along x axis
    double ry = p.py - cy; // get the distance along y axis

    double r = sqrt((rx * rx) + (ry * ry)); // get the distance between the point and the box's center

    // theta = width of current box contaning particles / distance from particle to center of box
    // theta = w / r
    double theta = w / r;

    if(theta <= theta_max)
    {
        double r1 = (r + e0) * (r + e0) * (r + e0);

        double tempx = p.m * rx / r1;
        double tempy = p.m * ry / r1;

        (*fx) = (*fx) + tempx;
        (*fy) = (*fy) + tempy;

        return;
    }

    for(int i = 0; i < 4; i++)
    {
        update_point(p, q->child[i], theta_max, fx, fy);
    }
}

void execute_with_graphics(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title)
{

    InitializeGraphics(window_title, windowWidth, windowWidth);
    SetCAxes(0,1);

    int count_steps = 0;

    quad* qtree;

    while(
        count_steps < nsteps 
        && !CheckForQuit()
    )
    {

        quad_init(&qtree, list_points, N);
        quad_divide(&qtree);

        ClearScreen();
        for(int i = 0; i < N; i++)
        {
            DrawCircle(list_points[i].px, list_points[i].py, L, W, circleRadius, circleColor);
        }

        display_quad_rectangle(qtree);
        
        Refresh();
        /* Sleep a short while to avoid screen flickering. */
        usleep(150000);

        
        
        next_time_step(list_points, qtree, N, delta, theta_max);

        quad_free(&qtree);
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




























// void calculate(point next_points[], int N, double delta)
// {
//     point prev_points[N];

//     for(int i = 0; i < N; i++)
//     {
//         prev_points[i] = next_points[i];
//     }

//     for(int i = 0; i < N; i++)
//     {
//         double fx = 0.0, fy = 0.0;

//         for(int j = 0; j < N; j++)
//         {
//             if(i == j) 
//                 continue;

//             double rx = prev_points[i].px - prev_points[j].px;
//             double ry = prev_points[i].py - prev_points[j].py;

//             double r = sqrt((rx * rx) + (ry * ry));

//             double r1 = pow((r + e0), 3);
//             // double r1 = (r + e0) * (r + e0) * (r + e0);

//             double tempx = prev_points[j].m * rx / r1;
//             double tempy = prev_points[j].m * ry / r1;

//             fx = fx + tempx;
//             fy = fy + tempy;
//         }

//         double ax = - fx * G;
//         double ay = - fy * G;

//         next_points[i].vx = prev_points[i].vx + delta * ax;
//         next_points[i].vy = prev_points[i].vy + delta * ay;

//         next_points[i].px = prev_points[i].px + delta * next_points[i].vx;
//         next_points[i].py = prev_points[i].py + delta * next_points[i].vy;
//     }
// }




















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