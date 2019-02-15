#include "point.h"

point new_point(double px, double py, double m, double vx, double vy, double b)
{
    point t;
    t.px = px;
    t.py = py;
    t.m = m;
    t.vx = vx;
    t.vy = vy;
    t.b = b;

    return t;
}

void print_point(point p)
{
    printf("%lf    %lf    %lf    %lf    %lf    %lf\n", p.px, p.py, p.m, p.vx, p.vy, p.b);
    // printf("%lf    %lf    %lf    %lf\n", p.px, p.py, p.vx, p.vy);
}

void print_list_points(point* list_points, int N)
{
    for(int i = 0; i < N; i++)
    {
        printf("%d | ", i);
        print_point(list_points[i]);
    }
}