#include "point.h"

point new_point(double p_x, double p_y, double m, double v_x, double v_y)
{
    point t;
    t.p_x = p_x;
    t.p_y = p_y;
    t.m = m;
    t.v_x = v_x;
    t.v_y = v_y;

    return t;
}

void print_point(point p)
{
    printf("%lf    %lf    %lf    %lf    %lf\n", p.p_x, p.p_y, p.m, p.v_x, p.v_y);
}