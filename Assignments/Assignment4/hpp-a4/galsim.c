#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "./graphics/graphics.h"
#include <string.h>
#include <sys/time.h>
#define RECURSIVE 1

const double e0 = 0.001;
double theta_max_2;
double G;

typedef struct vector {
  double x;
  double y;
} vector_t;

typedef struct particle {
  double x;
  double y;
  double m;
} particle_t;

typedef struct quadrangle {
  double boundary_x;
  double boundary_y;
  double boundary_length;
  double mass;
  double mass_x;
  double mass_y;
  struct particle* particle;
  struct quadrangle* sw;
  struct quadrangle* se;
  struct quadrangle* ne;
  struct quadrangle* nw;
} quadrangle_t;

quadrangle_t* quadtree_create_new_node(particle_t* particle, double boundary_x, double boundary_y, double boundary_length) {
    quadrangle_t* new_node = (quadrangle_t *) malloc(sizeof(quadrangle_t));
    new_node->particle = particle;
    new_node->boundary_x = boundary_x;
    new_node->boundary_y = boundary_y;
    new_node->boundary_length = boundary_length;
    new_node->sw = NULL;
    new_node->se = NULL;
    new_node->ne = NULL;
    new_node->nw = NULL;
    return new_node;
}

#if RECURSIVE

void quadtree_insert(quadrangle_t** root, particle_t* particle) 
{
    quadrangle_t* current = *root;

    if (current == NULL) 
    {
        quadrangle_t* new_node = quadtree_create_new_node(particle, 0, 0, 1);
        *root = new_node;
        return;
    }

    double new_node_boundary_length = current->boundary_length*0.5;
    // if the node has children
    if (current->sw != NULL || current->se != NULL || current->ne != NULL || current->nw != NULL) 
    {
        if (particle->x < current->boundary_x + new_node_boundary_length) 
        {
            if (particle->y < current->boundary_y + new_node_boundary_length) 
            {
                char new_node_is_null = current->sw == NULL;

                quadtree_insert(&(current->sw), particle);

                if (new_node_is_null) 
                {
                    quadrangle_t* new_node = current->sw;
                    new_node->boundary_x = current->boundary_x;
                    new_node->boundary_y = current->boundary_y;
                    new_node->boundary_length = new_node_boundary_length;
                }
            } 
            else 
            {
                char new_node_is_null = current->nw == NULL;

                quadtree_insert(&(current->nw), particle);

                if (new_node_is_null) 
                {
                    quadrangle_t* new_node = current->nw;
                    new_node->boundary_x = current->boundary_x;
                    new_node->boundary_y = current->boundary_y+new_node_boundary_length;
                    new_node->boundary_length = new_node_boundary_length;
                }
            }
        } 
        else 
        {
            if (particle->y < current->boundary_y + new_node_boundary_length) 
            {
                char new_node_is_null = current->se == NULL;

                quadtree_insert(&(current->se), particle);

                if (new_node_is_null) 
                {
                    quadrangle_t* new_node = current->se;
                    new_node->boundary_x = current->boundary_x+new_node_boundary_length;
                    new_node->boundary_y = current->boundary_y;
                    new_node->boundary_length = new_node_boundary_length;
                }
            } 
            else 
            {
                char new_node_is_null = current->ne == NULL;

                quadtree_insert(&(current->ne), particle);

                if (new_node_is_null) 
                {
                    quadrangle_t* new_node = current->ne;
                    new_node->boundary_x = current->boundary_x+new_node_boundary_length;
                    new_node->boundary_y = current->boundary_y+new_node_boundary_length;
                    new_node->boundary_length = new_node_boundary_length;
                }
            }
        }

        return;
    }

    // if the node does not have children
    double new_node_boundary_x, new_node_boundary_y;

    particle_t* current_particle = current->particle;

    current->particle = NULL;

    if (current_particle->x < current->boundary_x + new_node_boundary_length) 
    {
        if (current_particle->y < current->boundary_y + new_node_boundary_length) 
        {
            new_node_boundary_x = current->boundary_x;
            new_node_boundary_y = current->boundary_y;
            current->sw = quadtree_create_new_node(current_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
        } 
        else 
        {
            new_node_boundary_x = current->boundary_x;
            new_node_boundary_y = current->boundary_y+new_node_boundary_length;
            current->nw = quadtree_create_new_node(current_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
        }
    } 
    else 
    {
        if (current_particle->y < current->boundary_y + new_node_boundary_length) 
        {
            new_node_boundary_x = current->boundary_x+new_node_boundary_length;
            new_node_boundary_y = current->boundary_y;
            current->se = quadtree_create_new_node(current_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
        } 
        else 
        {
            new_node_boundary_x = current->boundary_x+new_node_boundary_length;
            new_node_boundary_y = current->boundary_y+new_node_boundary_length;
            current->ne = quadtree_create_new_node(current_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
        }
    }

    quadtree_insert(root, particle);
}

#else

void quadtree_insert(quadrangle_t** root, particle_t* particle) {
  quadrangle_t* current = *root;
  if (current == NULL) {
    // the root is empty
    quadrangle_t* new_node = quadtree_create_new_node(particle, 0, 0, 1);
    *root = new_node;
  } else {
    quadrangle_t* parent;
    // go down till a leaf named 'parent'
    while(current != NULL) {
      parent = current;
      if (particle->x < current->boundary_x + current->boundary_length*0.5) {
        if (particle->y < current->boundary_y + current->boundary_length*0.5) {
          current = current->sw;
        } else {
          current = current->nw;
        }
      } else {
        if (particle->y < current->boundary_y + current->boundary_length*0.5) {
          current = current->se;
        } else {
          current = current->ne;
        }
      }
    }
    
    double new_node_boundary_x, new_node_boundary_y, new_node_boundary_length;
    particle_t* parent_particle = parent->particle;
    // while the box still contains another point
    while (parent->sw == NULL && parent->se == NULL && parent->ne == NULL && parent->nw == NULL) {
      parent->particle = NULL;
      new_node_boundary_length = parent->boundary_length*0.5;
      if (parent_particle->x < parent->boundary_x + new_node_boundary_length) {
        if (parent_particle->y < parent->boundary_y + new_node_boundary_length) {
          new_node_boundary_x = parent->boundary_x;
          new_node_boundary_y = parent->boundary_y;
          parent->sw = quadtree_create_new_node(parent_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
          if (particle->x < parent->boundary_x + new_node_boundary_length && particle->y < parent->boundary_y + new_node_boundary_length) parent = parent->sw;
        } else {
          new_node_boundary_x = parent->boundary_x;
          new_node_boundary_y = parent->boundary_y + new_node_boundary_length;
          parent->nw = quadtree_create_new_node(parent_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
          if (particle->x < parent->boundary_x + new_node_boundary_length && particle->y >= parent->boundary_y + new_node_boundary_length) parent = parent->nw;
        }
      } else {
        if (parent_particle->y < parent->boundary_y + new_node_boundary_length) {
          new_node_boundary_x = parent->boundary_x + new_node_boundary_length;
          new_node_boundary_y = parent->boundary_y;
          parent->se = quadtree_create_new_node(parent_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
          if (particle->x >= parent->boundary_x + new_node_boundary_length && particle->y < parent->boundary_y + new_node_boundary_length) parent = parent->se;
        } else {
          new_node_boundary_x = parent->boundary_x + new_node_boundary_length;
          new_node_boundary_y = parent->boundary_y + new_node_boundary_length;
          parent->ne = quadtree_create_new_node(parent_particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
          if (particle->x >= parent->boundary_x + new_node_boundary_length && particle->y >= parent->boundary_y + new_node_boundary_length) parent = parent->ne;
        }
      }
    }

    new_node_boundary_length = parent->boundary_length*0.5;

    if (particle->x < parent->boundary_x + new_node_boundary_length) {
      if (particle->y < parent->boundary_y + new_node_boundary_length) {
        new_node_boundary_x = parent->boundary_x;
        new_node_boundary_y = parent->boundary_y;
        parent->sw = quadtree_create_new_node(particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
      } else {
        new_node_boundary_x = parent->boundary_x;
        new_node_boundary_y = parent->boundary_y + new_node_boundary_length;
        parent->nw = quadtree_create_new_node(particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
      }
    } else {
      if (particle->y < parent->boundary_y + new_node_boundary_length) {
        new_node_boundary_x = parent->boundary_x + new_node_boundary_length;
        new_node_boundary_y = parent->boundary_y;
        parent->se = quadtree_create_new_node(particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
      } else {
        new_node_boundary_x = parent->boundary_x + new_node_boundary_length;
        new_node_boundary_y = parent->boundary_y + new_node_boundary_length;
        parent->ne = quadtree_create_new_node(particle, new_node_boundary_x, new_node_boundary_y, new_node_boundary_length);
      }
    }
  }
}

#endif

void quadtree_free(quadrangle_t* root) 
{
    if (root == NULL)
        return;

    quadtree_free(root->sw);
    quadtree_free(root->se);
    quadtree_free(root->ne);
    quadtree_free(root->nw);
    free(root);
}

void quadtree_mass(quadrangle_t* root) 
{
    if (root == NULL)
        return;

    if (root->particle != NULL) 
    {
        root->mass = root->particle->m;
        root->mass_x = root->particle->x;
        root->mass_y = root->particle->y;
        return;
    }

    root->mass = 0.0;
    root->mass_x = 0.0;
    root->mass_y = 0.0;

    if (root->sw != NULL) 
    {
        quadtree_mass(root->sw);

        root->mass += root->sw->mass;
        root->mass_x += root->sw->mass_x * root->sw->mass;
        root->mass_y += root->sw->mass_y * root->sw->mass;
    }

    if (root->se != NULL) 
    {
        quadtree_mass(root->se);

        root->mass += root->se->mass;
        root->mass_x += root->se->mass_x * root->se->mass;
        root->mass_y += root->se->mass_y * root->se->mass;
    }

    if (root->ne != NULL) 
    {
        quadtree_mass(root->ne);

        root->mass += root->ne->mass;
        root->mass_x += root->ne->mass_x * root->ne->mass;
        root->mass_y += root->ne->mass_y * root->ne->mass;
    }

    if (root->nw != NULL) 
    {
        quadtree_mass(root->nw);

        root->mass += root->nw->mass;
        root->mass_x += root->nw->mass_x * root->nw->mass;
        root->mass_y += root->nw->mass_y * root->nw->mass;
    }

    root->mass_x /= root->mass;
    root->mass_y /= root->mass;
}

vector_t calculate_force(quadrangle_t* root, particle_t* particle) 
{
    vector_t f = {0.0, 0.0};

    if (root->particle == particle)
        return f;

    double rij_2 = (root->mass_x - particle->x) * (root->mass_x - particle->x) + (root->mass_y - particle->y) * (root->mass_y - particle->y);

    if (root->particle != NULL || (root->boundary_length*root->boundary_length < theta_max_2*rij_2)) 
    {
        double rij = sqrt(rij_2);
        f.x = root->mass/((rij + e0)*(rij + e0)*(rij + e0))*(particle->x-root->mass_x);
        f.y = root->mass/((rij + e0)*(rij + e0)*(rij + e0))*(particle->y-root->mass_y);
        return f;
    }

    if (root->sw != NULL) 
    {
        vector_t f_add = calculate_force(root->sw, particle);
        f.x += f_add.x;
        f.y += f_add.y;
    }

    if (root->se != NULL) 
    {
        vector_t f_add = calculate_force(root->se, particle);
        f.x += f_add.x;
        f.y += f_add.y;
    }

    if (root->ne != NULL) 
    {
        vector_t f_add = calculate_force(root->ne, particle);
        f.x += f_add.x;
        f.y += f_add.y;
    }
    
    if (root->nw != NULL) 
    {
        vector_t f_add = calculate_force(root->nw, particle);
        f.x += f_add.x;
        f.y += f_add.y;
    }

    return f;
}

static double get_wall_seconds() 
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
    return seconds;
}

int main(int argc, char **argv)
{
    if (argc != 7) 
    {
        printf("Invalid inputs!\nInstruction: ./galsim N filename nsteps delta_t theta_max graphics\n");
        return 0;
    }

    const unsigned int N = atoi(argv[1]);
    const char* filename = argv[2];
    const unsigned int nsteps = atoi(argv[3]);
    const double delta_t = atof(argv[4]);
    const double theta_max = atof(argv[5]);
    theta_max_2 = theta_max*theta_max;
    const char graphics = atoi(argv[6]);

    FILE* fp = fopen(filename, "r");
    if (fp == NULL) 
    {
        printf("Invalid input file: %s\n. Exit.", filename);
        return 0;
    }

    particle_t* particles = (particle_t *) malloc(sizeof(particle_t)*N);
    double* brightness = (double*) malloc(sizeof(double)*N);
    double* ux = (double*) malloc(sizeof(double)*N);
    double* uy = (double*) malloc(sizeof(double)*N);
    unsigned int i;
    double buff;

    for (i =0; i < N; i++)
    {
        fread(&buff, sizeof(double), 1, fp);
        particles[i].x = buff;
        fread(&buff, sizeof(double), 1, fp);
        particles[i].y = buff;
        fread(&buff, sizeof(double), 1, fp);
        particles[i].m = buff;
        fread(&buff, sizeof(double), 1, fp);
        ux[i] = buff;
        fread(&buff, sizeof(double), 1, fp);
        uy[i] = buff;
        fread(&buff, sizeof(double), 1, fp);
        brightness[i] = buff;
    }

    fclose(fp);
    //printf("Reading input file took %7.7f wall seconds\n", get_wall_seconds() - time1);
    //double insert_time = 0.0;
    double time1;
    unsigned int k;
    G = 100.0/(double)N;
    double insert_time = 0.0, mass_time = 0.0, force_time = 0.0, free_time = 0.0;

    if (graphics) 
    {
        InitializeGraphics(argv[0], 800, 800);
        SetCAxes(0, 1);
    }

    for (k = 0; k < nsteps; k++) 
    {
        if (graphics)
        ClearScreen();
        quadrangle_t* root = NULL;
        time1 = get_wall_seconds();

        for (i = 0; i < N; i++) 
        {
            if (graphics)
                DrawCircle(particles[i].x, particles[i].y, 1, 1, 0.0025, 0);
            quadtree_insert(&root, &particles[i]);
        }

        insert_time += get_wall_seconds() - time1;

        time1 = get_wall_seconds();

        quadtree_mass(root);

        mass_time += get_wall_seconds() - time1;

        time1 = get_wall_seconds();

        vector_t* force =  (vector_t *) malloc(sizeof(vector_t)*N);

        for (i = 0; i < N; i++) 
        {
            force[i] = calculate_force(root, &particles[i]);
        }

        force_time += get_wall_seconds() - time1;

        //insert_time += get_wall_seconds() - time1;
        for (i = 0; i < N; i++) 
        {
            ux[i] += -G*delta_t*force[i].x;
            uy[i] += -G*delta_t*force[i].y;
            particles[i].x += delta_t*ux[i];
            particles[i].y += delta_t*uy[i];
        }

        free(force);

        time1 = get_wall_seconds();

        quadtree_free(root);

        free_time += get_wall_seconds() - time1;
        if (graphics) 
        {
            Refresh();
            usleep(5000);
        }
    }

    printf("%d - %7.7lf - %7.7lf - %7.7lf - %7.7lf\n", N, insert_time, mass_time, force_time, free_time);
    //printf("calculate force took %7.7f wall seconds\n", insert_time);
    if (graphics) {
        FlushDisplay();
        CloseDisplay();
    }
    //time1 = get_wall_seconds();
    fp = fopen("result.gal", "w");
    for (i = 0; i < N; i++)
    {
        fwrite(&(particles[i].x), 1, sizeof(double), fp);
        fwrite(&(particles[i].y), 1, sizeof(double), fp);
        fwrite(&(particles[i].m), 1, sizeof(double), fp);
        fwrite(&(ux[i]), 1, sizeof(double), fp);
        fwrite(&(uy[i]), 1, sizeof(double), fp);
        fwrite(&(brightness[i]), 1, sizeof(double), fp);
    }
    fclose(fp);
    free(particles); free(ux); free(uy); free(brightness);
    return 0;
}
