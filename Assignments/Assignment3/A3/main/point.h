#ifndef _point
#define _point
#include <stdio.h>
typedef struct point {
    // may use an array instead
    double p_x;
    double p_y;
    double m;
    double v_x;
    double v_y;
} point;

point new_point(double p_x, double p_y, double m, double v_x, double v_y);
void print_point(point p);

#endif