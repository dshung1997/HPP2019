#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "Quad.h"
#include "graphics.h"


double G = 100.0;
const double e0 = 0.001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

char* WINDOW;


void write_points(char* filename, point list_points[], int N);
void read_points(char* filename, point list_points[], int N);
void execute(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title);
void display(quad* qtree, point* list_points, int N, char* window_title);
void display_quad_rectangle(quad* q);
void output_filename(char* input, char* output, int nsteps);
void execute_with_graphics(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title);
void display_quad_rectangle(quad* q);
void next_time_step(quad** qtree, point* list_points, int N, double delta, double theta_max);

double get_wall_seconds(){
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double seconds = tv.tv_sec + (double)tv.tv_usec/1000000;

    return seconds;
}


int main(int argc, char* argv[])
{
    if(argc != 7)
    {
        printf("Wrong syntax.\n./galsim N filname nsteps delta_t graphics\n");
        return -1;
    }

    WINDOW = argv[0];

    int N = atoi(argv[1]);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    double delta = (double) atof(argv[4]);
    double theta_max = (double) atof(argv[5]);
    int graphics = atoi(argv[6]);
    G /= (double) N;

    point list_points[N];

   
    FILE* test_file = fopen(filename, "rb");
    if(test_file == NULL)
    {
        printf("Cannot read the file !\n");
        return -1;  
    }
    fclose(test_file);
    
    
    read_points(filename, list_points, N);
    






    if(graphics)
    {
        execute_with_graphics(list_points, N, nsteps, delta, theta_max, argv[0]);
    }
    else
    {
        double t1 = get_wall_seconds();
        execute(list_points, N, nsteps, delta, theta_max, argv[0]);   
        double t2 = get_wall_seconds();
        printf("---\nExecution time: %lf\n", t2-t1);
    }

  



    char output[80] = "";
    output_filename(filename, output, nsteps);
    printf("---\n%s\n---\n", output);

    write_points(output, list_points, N);


    return 0;
}



void display(quad* qtree, point* list_points, int N, char* window_title)
{

    InitializeGraphics(window_title, windowWidth, windowWidth);
    SetCAxes(0,1);

    while(
        !CheckForQuit()
    )
    {
        ClearScreen();
        // for(int i = 0; i < N; i++)
        // {
        //     DrawCircle(list_points[i].px, list_points[i].py, L, W, circleRadius, circleColor);
        // }

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

    if(q->p != NULL)
    {
        DrawCircle(q->p->px, q->p->py, L, W, circleRadius, circleColor);
    }

    for(int i = 0; i < 4; i++)
    {
        display_quad_rectangle((q->child)[i]);
    }
}

void next_time_step(quad** qtree, point* list_points, int N, double delta, double theta_max)
{
    force f[N];
    // quad* qtree = NULL;
    double theta_max2 = theta_max * theta_max;

    for(int i = 0; i < N; i++)
    {
        quad_insert(qtree, &(list_points[i]), 1, 0.5, 0.5);
        // display(*qtree, list_points, N, WINDOW);
    }

    quad_mass(qtree);

    for(int i = 0; i < N; i++)
    {
        f[i] = quad_force(*qtree, &(list_points[i]), theta_max2);
    }

    for(int i = 0; i < N; i++)
    {
        list_points[i].vx += - G * delta * f[i].fx;
        list_points[i].vy += - G * delta * f[i].fy;

        list_points[i].px += delta * list_points[i].vx;
        list_points[i].py += delta * list_points[i].vy;
    }

    // quad_free(&qtree);
}

void execute_with_graphics(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title)
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
        usleep(500000);

        
        // next_time_step(list_points, N, delta, theta_max);
        quad* qtree = NULL;
        next_time_step(&qtree, list_points, N, delta, theta_max);

        quad_free(&qtree);
        
        count_steps += 1;
    }
    
    FlushDisplay();
    CloseDisplay();
}

void execute(point* list_points, int N, int nsteps, double delta, double theta_max, char* window_title)
{
    for(int i = 0; i < nsteps; i++)
    {
        quad* qtree = NULL;
        next_time_step(&qtree, list_points, N, delta, theta_max);

        // display(qtree, list_points, N, window_title);

        quad_free(&qtree);
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
        
        double _px, _py, _m, _vx, _vy, _b;

        fread(&_px, sizeof(double), 1, f);
        fread(&_py, sizeof(double), 1, f);
        fread(&_m, sizeof(double), 1, f);
        fread(&_vx, sizeof(double), 1, f);
        fread(&_vy, sizeof(double), 1, f);
        fread(&_b, sizeof(double), 1, f);

        point temp = point_new(_px, _py, _m, _vx, _vy, _b);

        list_points[counter] = temp;
        
        
        

        counter += 1;
    }

    fclose(f);
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