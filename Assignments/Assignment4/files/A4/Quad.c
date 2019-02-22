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

void quad_insert(quad** qt, point* p, double _w, double _cx, double _cy)
{
    if(*qt == NULL)
    {
        *qt = quad_new(_w, _cx, _cy);
        (*qt)->p = p;
        // (*qt)->n += 1;

        return;
    }

    double half_w = (*qt)->w / 2.0;
  
    if((*qt)->p != NULL)
    {
         point* current_p = (*qt)->p;
        (*qt)->p = NULL; // remove the current point of the quad and insert it in its corresponding children

        int index_current_p = quad_get_index(*qt, current_p);

        int iy = index_current_p >> 1;
        int ix = index_current_p & 1;
            
        double new_cx = (*qt)->cx - half_w / 2.0 + ix * half_w;
        double new_cy = (*qt)->cy - half_w / 2.0 + iy * half_w;

        quad_insert(&(((*qt)->child)[index_current_p]), current_p, half_w, new_cx, new_cy);
    }

    int index_p = quad_get_index(*qt, p);

    int iy = index_p >> 1;
    int ix = index_p & 1;
        
    double new_cx = (*qt)->cx - half_w / 2.0 + ix * half_w;
    double new_cy = (*qt)->cy - half_w / 2.0 + iy * half_w;    

    quad_insert(&(((*qt)->child)[index_p]), p, half_w, new_cx, new_cy);

    // (*qt)->n += 1;

    return;
}

void quad_mass(quad** qt)
{
    if(*qt == NULL)
        return;

    // use array 0-1
    if((*qt)->p != NULL)
    {
        (*qt)->m = (*qt)->p->m;
        (*qt)->mass_x = (*qt)->p->m * (*qt)->p->px;
        (*qt)->mass_y = (*qt)->p->m * (*qt)->p->py;

        return;
    }

    // unroll loops
    for(int i = 0; i < 4; i++)
    {
        if(((*qt)->child)[i] != NULL)
        {
            quad_mass(&(((*qt)->child)[i]));

            (*qt)->m += (((*qt)->child)[i])->m;
            (*qt)->mass_x += (((*qt)->child)[i])->mass_x;
            (*qt)->mass_y += (((*qt)->child)[i])->mass_y;
        }
    }
}

force quad_force(quad* qt, point* p, double theta_max2)
{
    force f = {0, 0};

    if(qt == NULL)
        return f;

    if(qt->p == p)
        return f;

    // center of mass - x
    double cmx = qt->mass_x / qt->m;

    // center of mass - y
    double cmy = qt->mass_y / qt->m;

    double rij2 = (p->px - cmx) * (p->px - cmx) + (p->py - cmy) * (p->py - cmy);

    // use normal instead of multiply
    if(qt->p != NULL || (qt->w * qt->w) <= theta_max2 * rij2)
    {
        double rij = sqrt(rij2);

        f.fx = qt->m * (p->px - cmx) / ((rij + 0.001) * (rij + 0.001) * (rij + 0.001));
        f.fy = qt->m * (p->py - cmy) / ((rij + 0.001) * (rij + 0.001) * (rij + 0.001));
    }
    else
    {
        for(int i = 0; i < 4; i++)
        {
            force fc = quad_force((qt->child)[i], p, theta_max2);
            f.fx += fc.fx;
            f.fy += fc.fy;
        }
    }
    
    return f;
}

quad* quad_new(double w, double cx, double cy)
{
    quad* qt = (quad*) malloc(sizeof(quad));

    qt->p = NULL;

    qt->m = 0;

    // qt->n = 0;

    qt->w = w;
    qt->cx = cx;
    qt->cy = cy;

    qt->mass_x = 0;
    qt->mass_y = 0;


    // unroll loops
    for(int i = 0; i < 4; i++)
    {
        (qt->child)[i] = NULL;
    }

    return qt;
}


int quad_get_index(quad* qt, point* p)
{
    char ix; // index x
    char iy; // index y

    // double cx = q->cx;
    // double cy = q->cy;

    // double px = p->px;
    // double py = p->py;

    iy = (p->py) > (qt->cy);
    ix = (p->px) > (qt->cx);

    // if(py <= cy)
    //     iy = 0;
    // else
    //     iy = 1;

    // if(px <= cx)
    //     ix = 0;
    // else
    //     ix = 1;


    return (iy << 1) + ix;
}







void quad_free(quad** q)
{
    if((*q) == NULL)
        return;

    for(int i = 0; i < 4; i++)
    {
        quad_free(    &(  ((*q)->child)[i]   )    );
    }

    free(*q);
    (*q) = NULL;
}
