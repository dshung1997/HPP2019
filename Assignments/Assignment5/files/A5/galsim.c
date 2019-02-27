#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <pthread.h>

#include "Quad.h"
#include "graphics.h"


double G = 100.0;
const double e0 = 0.001;

const float circleRadius=0.0025, circleColor=0;
const int windowWidth=800;
const float L=1, W=1;

char* WINDOW;


void read_points(char* filename, point list_points[], double* velo_x, double* velo_y, double* br, int N);
void write_points(char* filename, point list_points[], double* velo_x, double* velo_y, double* br, int N);

void display(quad* qtree, point* list_points, int N, char* window_title);
void display_quad_rectangle(quad* q);

void next_time_step(point* restrict list_points, double* restrict velo_x, double* restrict velo_y, int N, double delta, double theta_max, int n_threads);

void execute_with_graphics(point* __restrict list_points, double* __restrict velo_x, double* __restrict velo_y, int N, int nsteps, double delta, double theta_max, int n_threads, char* window_title);
void execute(point* __restrict list_points, double* __restrict velo_x, double* __restrict velo_y, int N, int nsteps, double delta, double theta_max, int n_threads, char* window_title);

void output_filename(char* input, char* output, int nsteps);

double get_wall_seconds(){
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double seconds = tv.tv_sec + (double)tv.tv_usec/1000000;

    return seconds;
}

typedef struct thread_arg_force {
    quad* qtree;
    point* list_points;
    int index[2]; // 0 is starting index | 1 is to ending index. Ending index is exclusive
    double theta_max2;
} thread_arg_force;



force* F;






int main(int argc, char* argv[])
{
    if(argc != 8)
    {
        printf("Wrong syntax.\n./galsim N filename nsteps delta_t theta_max graphics\n");
        return -1;
    }

    WINDOW = argv[0];

    int N = atoi(argv[1]);
    char* filename = argv[2];
    int nsteps = atoi(argv[3]);
    double delta = (double) atof(argv[4]);
    double theta_max = (double) atof(argv[5]);
    int graphics = atoi(argv[6]);
    int n_threads = atoi(argv[7]);
    G /= (double) N;

    point list_points[N];
    double velo_x[N];
    double velo_y[N];
    double br[N];

    F = (force*) malloc(N * sizeof(force));

   
    FILE* test_file = fopen(filename, "rb");
    if(test_file == NULL)
    {
        printf("Cannot read the file !\n");
        return -1;  
    }
    fclose(test_file);
    
    double time_all = 0;
    
    double t1 = get_wall_seconds();
    read_points(filename, list_points, velo_x, velo_y, br, N);
    double t2 = get_wall_seconds();

    time_all += (t2 - t1);
    printf("---\n");
    printf("Reading time: %lf\n", t2-t1);

    if(graphics)
    {
        execute_with_graphics(list_points, velo_x, velo_y, N, nsteps, delta, theta_max, n_threads, argv[0]);
    }
    else
    {
        t1 = get_wall_seconds();
        execute(list_points, velo_x, velo_y, N, nsteps, delta, theta_max, n_threads, argv[0]);   
        t2 = get_wall_seconds();
        time_all += (t2 - t1);
        printf("Execution time: %lf\n", t2-t1);
    }

    // char output[80] = "";
    // output_filename(filename, output, nsteps);

    t1 = get_wall_seconds();
    write_points("result.gal", list_points, velo_x, velo_y, br, N);
    t2 = get_wall_seconds();
    time_all += (t2 - t1);
    printf("Writing time: %lf\n", t2-t1);

    printf("---\n");

    if(graphics)
    {
        printf("Do not count time for displaying graphics\n");
    }

    printf("Adds up: %lf\n", time_all);

    // printf("---\n%s\n---\n", output);


    free(F);

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






void* thread_exec_force(void* t)
{
    thread_arg_force* arg = (thread_arg_force*) t;

    for(int i = arg->index[0]; i < arg->index[1]; i++)
    {
        F[i] = quad_force(arg->qtree, &(arg->list_points[i]), arg->theta_max2);
    }

    pthread_exit(NULL);
}

void next_time_step(point* restrict list_points, double* restrict velo_x, double* restrict velo_y, int N, double delta, double theta_max, int n_threads)
{
    // force f[N];
    
    quad* qtree = NULL;
    double theta_max2 = theta_max * theta_max;
    pthread_t threads[n_threads];
    thread_arg_force args[n_threads];

    for(int i = 0; i < N; i++)
    {
        quad_insert(&qtree, &(list_points[i]), 1, 0.5, 0.5);
        // display(qtree, list_points, N, WINDOW);
    }

    quad_mass(&qtree);

    
    int part = N / n_threads;

    int i = 0;
    for(i = 0; i < (n_threads-1); i++)
    {
        int start = i * part;
        int end = (i+1) * part;

        // printf("Start: %d - %d\n", start, end);
        args[i].qtree = qtree;
        args[i].list_points = list_points;
        args[i].index[0] = start;
        args[i].index[1] = end;
        args[i].theta_max2 = theta_max2;

        pthread_create(&(threads[i]), NULL, thread_exec_force, (void*)(&args[i]));
    }


    i = n_threads-1;
    int start = i * part;
    int end = N;

    args[i].qtree = qtree;
    args[i].list_points = list_points;
    args[i].index[0] = start;
    args[i].index[1] = end;
    args[i].theta_max2 = theta_max2;
    pthread_create(&(threads[i]), NULL, thread_exec_force, (void*)(&args[i]));


    for(i = 0; i < n_threads; i++)
    {
        int rc = pthread_join(threads[i], NULL);

        if(rc) 
        {
            printf("Something wrong....\n");
        }
    }

    for(i = 0; i < N; i++)
    {
        velo_x[i] += - G * delta * F[i].fx;
        velo_y[i] += - G * delta * F[i].fy;

        list_points[i].px += delta * velo_x[i];
        list_points[i].py += delta * velo_y[i];
    }

    quad_free(&qtree);
}
















void execute_with_graphics(point* __restrict list_points, double* __restrict velo_x, double* __restrict velo_y, int N, int nsteps, double delta, double theta_max, int n_threads, char* window_title)
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
        usleep(5000);

        next_time_step(list_points, velo_x, velo_y, N, delta, theta_max, n_threads);
        
        count_steps += 1;
    }
    
    FlushDisplay();
    CloseDisplay();
}

void execute(point* __restrict list_points, double* __restrict velo_x, double* __restrict velo_y, int N, int nsteps, double delta, double theta_max, int n_threads, char* window_title)
{
    for(int i = 0; i < nsteps; i++)
    {
        next_time_step(list_points, velo_x, velo_y, N, delta, theta_max, n_threads);
    }
}

void write_points(char* filename, point list_points[], double* velo_x, double* velo_y, double* br, int N)
{
    FILE* fw = fopen(filename, "wb");
    if(fw == NULL)
    {
        printf("FW is null !\n");
        return;
    }

    for(int i = 0; i < N; i++)
    {
        double _px, _py, _m, _vx, _vy, _b;
        _px = list_points[i].px;
        _py = list_points[i].py;
        _m = list_points[i].m;
        _vx = velo_x[i];
        _vy = velo_y[i];
        _b = br[i];
        fwrite(&_px, sizeof(double), 1, fw);
        fwrite(&_py, sizeof(double), 1, fw);
        fwrite(&_m, sizeof(double), 1, fw);
        fwrite(&_vx, sizeof(double), 1, fw);
        fwrite(&_vy, sizeof(double), 1, fw);
        fwrite(&_b, sizeof(double), 1, fw);

        // printf("%lf %lf %lf %lf %lf %lf\n", _px, _py, _m, _vx, _vy, _b);
    }

    fclose(fw);
}

void read_points(char* filename, point list_points[], double* velo_x, double* velo_y, double* br, int N)
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

        point temp;
        temp.px = _px;
        temp.py = _py;
        temp.m = _m;

        list_points[counter] = temp;
        
        velo_x[counter] = _vx;
        velo_y[counter] = _vy;

        br[counter] = _b;
        
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