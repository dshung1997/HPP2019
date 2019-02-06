#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int index;
    float min;
    float max;
    struct node* next;
} node;

void update(node**, int, float, float);
void delete(node**, int);
void delete_all(node**);
void print(node*);

node* new(int index, float min, float max)
{
    node* c = (node*) malloc(sizeof(node));
    c->index = index;
    c->min = min;
    c->max = max;
    c->next = NULL;

    return c;
}

void update(node** r, int index, float min, float max)
{
    if((*r) == NULL)
    {
        (*r) = new(index, min, max);
        return;
    }

    node* c = *r;
    node* prev = NULL;
    while(c != NULL && c->index < index)
    {
        prev = c;
        c = c->next;
    }

    if(c == NULL)
    {
        node* t = new(index, min, max);
        prev->next = t;
        return;
    }
    else if(c->index == index)
    {
        c->min = min;
        c->max = max;
        return;
    }
    else if(prev == NULL)
    {
        node* t = new(index, min, max);
        t->next = (*r);
        (*r) = t;
        return;
    }
    else
    {
        node* t = new(index, min, max);
        prev->next = t;
        t->next = c;
        return;
    }
}

void print(node* r)
{
    node* i = r;
    while(i != NULL)
    {
        printf("%d\t%f\t%f\n", i->index, i->min, i->max);
        i = i->next;
    }
}

void delete(node** p, int index)
{
    if((*p) == NULL) 
        return;

    node* c = *p;
    node* prev = NULL;
    while(c != NULL && c->index != index)
    {
        prev = c;
        c = c->next;
    }

    if(c == NULL)
        return;
    else //(c->index == index)
    {
        if(prev == NULL) //head
        {
            node* n = (*p)->next;
            free(*p);
            *p = n;
        }
        else
        {
            prev->next = c->next;
            free(c);
            c = NULL;
        }
    }
}

void delete_all(node** p)
{
    if((*p) == NULL) 
        return;

    if((*p)->next != NULL)
        delete_all(&((*p)->next));

    free(*p);
   
    *p = NULL;   
}

int main()
{
    node* root = NULL;
    int exit = 0;
    while(exit == 0)
    {
        printf("Enter command: ");

        char cmd_name;
        scanf("%c", &cmd_name);

        switch(cmd_name)
        {
            case 'A':
            {
                int index;
                float min;
                float max;

                int c = scanf("%d", &index);
                if(c == 0 || index < 1 || index > 31)
                {
                    printf("Invalid command !1\n");
                    break;
                }

                c = scanf("%f", &min);
                if(c == 0)
                {
                    printf("Invalid command !2\n");
                    break;
                }

                c = scanf("%f", &max);
                if(c == 0 || max < min)
                {
                    printf("Invalid command !3\n");
                    break;
                }

                update(&root, index, min, max);


                break;
            }

            case 'D':
            {
                int index = 0;
                scanf("%d", &index);

                delete(&root, index);

                break;
            }

            case 'P':
            {
                print(root);
                break;
            }

            case 'Q':
            {
                exit = 1;
                break;
            }

            default:
            {
                printf("Invalid command !\n");
                break;
            }
        }

        scanf("%*c");
    }

    delete_all(&root);
    return 0;
}