#ifndef _quad
#define _quad
#include <stdio.h>
#include <stdlib.h>


//-------------------------STRUCTURE----------------------------------------------------
typedef struct point {
    double px;  // position x of the point
    double py;
    double m;
    double vx;
    double vy;
    double b;
} point;


typedef struct quad quad;
struct quad {
    point** p;   // an array of (point *)

    // int info[2];    // 0: number of points
    //                 // 1: is divided or not

    int n;

    double m;   // mass
    double w;   // width of the square
    double cx;  // position x of the center of the square
    double cy;  // position y of the center of the square

    quad *child[4];

};
//--------------------------------------------------------------------------------------





//-------------------------FUNCTIONS----------------------------------------------------
point point_new(double px, double py, double m, double vx, double vy, double b);
void point_print(point p);
void point_print_list(point* list_points, int N);



void quad_init(quad** q, point* list_points, int num_points);
quad* quad_new(double w, double cy, double cx);
void quad_insert(quad** q, point* p);
int quad_get_index(quad* q, point* p);
void quad_divide(quad** q);
void quad_free(quad** q);



#endif