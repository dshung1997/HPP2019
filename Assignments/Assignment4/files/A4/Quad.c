#include "Quad.h"

//-------------------------QUADTREE------------------------------------------------------------

quad* quad_new(double w, double cx, double cy)
{
    quad* qt = (quad*) malloc(sizeof(quad));

    qt->p = NULL;

    qt->w = w;
    qt->cx = cx;
    qt->cy = cy;

    qt->core = (point*) malloc(sizeof(point));
    qt->core->m = 0;
    qt->core->px = 0;
    qt->core->py = 0;

    // unroll loops
    // for(int i = 0; i < 4; i++)
    // {
    //     (qt->child)[i] = NULL;
    // }

    (qt->child)[0] = NULL;
    (qt->child)[1] = NULL;
    (qt->child)[2] = NULL;
    (qt->child)[3] = NULL;

    return qt;
}

void quad_insert(quad** qt, point* p, double _w, double _cx, double _cy)
{
    if(*qt == NULL)
    {
        *qt = quad_new(_w, _cx, _cy);
        (*qt)->p = p;

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

    return;
}

void quad_mass(quad** qt)
{
    if(*qt == NULL)
        return;

    // use array 0-1
    if((*qt)->p != NULL)
    {
        (*qt)->core->m = (*qt)->p->m;

        (*qt)->core->px = (*qt)->p->px;
        (*qt)->core->py = (*qt)->p->py;

        return;
    }

    // unroll loops
    for(int i = 0; i < 4; i++)
    {
        if(((*qt)->child)[i] != NULL)
        {
            quad_mass(&(((*qt)->child)[i]));

            (*qt)->core->px += (((*qt)->child)[i])->core->px * (((*qt)->child)[i])->core->m;
            (*qt)->core->py += (((*qt)->child)[i])->core->py * (((*qt)->child)[i])->core->m;

            (*qt)->core->m += (((*qt)->child)[i])->core->m;
        }
    }

    (*qt)->core->px /= (*qt)->core->m;
    (*qt)->core->py /= (*qt)->core->m;
}

force quad_force(quad* qt, point* p, double theta_max)
{
    force f = {0, 0};

    if(qt == NULL)
        return f;

    if(qt->p == p)
        return f;

    double tempx = p->px - qt->core->px;
    double tempy = p->py - qt->core->py;

    double rij = sqrt(tempx * tempx + tempy * tempy);

    // use normal instead of multiply
    if(qt->p != NULL || qt->w <= theta_max * rij)
    {
        double rij_e0_3 = (rij + 0.001) * (rij + 0.001) * (rij + 0.001);

        f.fx = qt->core->m * tempx / rij_e0_3;
        f.fy = qt->core->m * tempy / rij_e0_3;

        return f;
    }

    for(int i = 0; i < 4; i++)
    {
        force fc = quad_force((qt->child)[i], p, theta_max);
        f.fx += fc.fx;
        f.fy += fc.fy;
    }
   
    return f;
}


int quad_get_index(quad* qt, point* p)
{
    char ix; // index x
    char iy; // index y

    iy = (p->py) > (qt->cy);
    ix = (p->px) > (qt->cx);

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

    free((*q)->core);
    (*q)->core = NULL;

    free(*q);
    (*q) = NULL;
}
