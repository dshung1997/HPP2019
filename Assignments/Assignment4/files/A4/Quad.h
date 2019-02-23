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
} point;

typedef struct force {
    double fx;
    double fy;
} force;


typedef struct quad quad;
struct quad {
    point* p; 

    double w;   // width of the square
    double cx;  // position x of the center of the square
    double cy;  // position y of the center of the square

    // double m;   // mass
    // double mx; // center of mass in x axis
    // double my; // center of mass in y axis

    point* core;

    quad *child[4];
};
//--------------------------------------------------------------------------------------





//-------------------------FUNCTIONS----------------------------------------------------
void quad_free(quad** q);
int quad_get_index(quad* qt, point* p);
quad* quad_new(double w, double cx, double cy);
force quad_force(quad* qt, point* p, double theta_max2);
void quad_mass(quad** qt);
void quad_insert(quad** qt, point* p, double _w, double _cx, double _cy);



#endif