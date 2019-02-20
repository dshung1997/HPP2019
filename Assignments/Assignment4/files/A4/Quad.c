#include "Quad.h"


//-------------------------POINT------------------------------------------------------------
point point_new(double px, double py, double m, double vx, double vy, double b)
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

void point_print(point p)
{
    printf("%lf    %lf    %lf    %lf    %lf    %lf\n", p.px, p.py, p.m, p.vx, p.vy, p.b);
    // printf("%lf    %lf    %lf    %lf\n", p.px, p.py, p.vx, p.vy);
}

void point_print_list(point* list_points, int N)
{
    for(int i = 0; i < N; i++)
    {
        printf("%d | ", i);
        point_print(list_points[i]);
    }
}



//-------------------------QUADTREE------------------------------------------------------------

void quad_init(quad** q, point* list_points, int num_points)
{
    if((*q) == NULL)
    {
        (*q) = (quad*) malloc(sizeof(quad));

        // (*q)->w = 1.0;
        // (*q)->cx = 0.5;
        // (*q)->cy = 0.5;
        // (*q)->n = num_points;

        // (*q)->p = (point**) malloc(num_points * sizeof(point*));

        // for(int i = 0; i < 4; i++)
        // {
        //     ((*q)->child)[i] = NULL;
        // }

        *q = quad_new(1.0, 0.5, 0.5);
        (*q)->n = num_points;
        (*q)->p = (point**) malloc(num_points * sizeof(point*));

    }

    double total_mass = 0.0;

    for(int i = 0; i < num_points; i++)
    {
        total_mass += list_points[i].m;
        ((*q)->p)[i] = &list_points[i];
    }

    (*q)->m = total_mass;
}

quad* quad_new(double w, double cy, double cx)
{
    quad* q = NULL;
    q = (quad*) malloc(sizeof(quad));

    q->w = w;
    q->cx = cx;
    q->cy = cy;

    // use memset instead
    q->n = 0; // number of points
    // q->info[1] = 0; // has been divided or not

    q->p = NULL;

    // q->tlquad = NULL;
    // q->trquad = NULL;
    // q->blquad = NULL;
    // q->brquad = NULL;

    for(int i = 0; i < 4; i++)
    {
        (q->child)[i] = NULL;
    }

    return q;
}

void quad_insert(quad** q, point* p)
{
    (*q)->n += 1;
    int n = (*q)->n;

    (*q)->p = realloc((*q)->p, n * sizeof(point*));
    ((*q)->p)[n-1] = p;

    (*q)->m += p->m;
}   

int quad_get_index(quad* q, point* p)
{
    int ix; // index x
    int iy; // index y

    double cx = q->cx;
    double cy = q->cy;

    double px = p->px;
    double py = p->py;

    double half_w = q->w / 2.0;


    if(py <= cy)
        iy = 0;
    else
        iy = 1;

    if(px <= cx)
        ix = 0;
    else
        ix = 1;


    return (iy << 1) + ix;
}

void quad_divide(quad** q)
{
    if((*q)->n > 1)
    {
        // (*q)->info[1] = 1;
        double half_w = (*q)->w / 2.0;
        double cy = (*q)->cy;
        double cx = (*q)->cx;

        for(int i = 0; i < 4; i++)
        {
            int iy = i >> 1;
            int ix = i & 1;
            
            double new_cy = cy - half_w / 2.0 + iy * half_w;
            double new_cx = cx - half_w / 2.0 + ix * half_w;

            ((*q)->child)[i] = quad_new(half_w, new_cy, new_cx);
        }

        int n = (*q)->n;

        for(int i = 0; i < n; i++)
        {
            int index = quad_get_index((*q), ((*q)->p)[i]);

            quad_insert(  &(  ((*q)->child)[index]   ), ((*q)->p)[i]     );
        }


        for(int i = 0; i < 4; i++)
        {
            quad_divide(    &(  ((*q)->child)[i]   )    );
        }
    }
}

void quad_free(quad** q)
{
    if((*q) == NULL)
        return;

    free((*q)->p);

    for(int i = 0; i < 4; i++)
    {
        quad_free(    &(  ((*q)->child)[i]   )    );
    }

    free(*q);
    (*q) = NULL;
}
