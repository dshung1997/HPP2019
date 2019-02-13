#ifndef _point
#define _point
#include <stdio.h>
typedef struct point {
    // may use an array instead
    double px;
    double py;
    double m ;
    double vx;
    double vy;
    double b;
} point;

point new_point(double px, double py, double m, double vx, double vy, double b);
void print_point(point p);

#endif