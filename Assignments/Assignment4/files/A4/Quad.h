#ifndef _quad
#define _quad
#include <stdio.h>
#include <stdlib.h>
#include <math.h>


//-------------------------STRUCTURE----------------------------------------------------
typedef struct point {
    double px;  // position x of the point
    double py;
    double m;
    double vx;
    double vy;
    double b;
} point;

typedef struct force {
    double fx;
    double fy;
} force;


typedef struct quad quad;
struct quad {
    point* p; 

    double m;   // mass

    // long n;     // number of points inside

    double w;   // width of the square
    double cx;  // position x of the center of the square
    double cy;  // position y of the center of the square

    double mass_x; // center of mass in x axis
    double mass_y; // center of mass in y axis

    quad *child[4];
};
//--------------------------------------------------------------------------------------





//-------------------------FUNCTIONS----------------------------------------------------
point point_new(double px, double py, double m, double vx, double vy, double b);
void point_print(point p);
void point_print_list(point* list_points, int N);


void quad_free(quad** q);
int quad_get_index(quad* qt, point* p);
quad* quad_new(double w, double cx, double cy);
force quad_force(quad* qt, point* p, double theta_max2);
void quad_mass(quad** qt);
void quad_insert(quad** qt, point* p, double _w, double _cx, double _cy);



#endif