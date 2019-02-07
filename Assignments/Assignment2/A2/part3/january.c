#include <stdio.h>
#include <stdlib.h>

// define a new data type
typedef struct node {
    int index;
    float min;
    float max;
    struct node* next;
} node;

// function forms
void update(node**, int, float, float);
void delete(node**, int);
void delete_all(node**);
void print(node*);


// allocate a new node and return it.
node* new(int index, float min, float max)
{
    node* c = (node*) malloc(sizeof(node));
    c->index = index;
    c->min = min;
    c->max = max;
    c->next = NULL;

    return c;
}

// insert or update the node with the provided index.
void update(node** r, int index, float min, float max)
{
    // if the root is still NULL (has not been initialized)
    if((*r) == NULL)
    {
        (*r) = new(index, min, max);
        return;
    }

    // define the current node
    node* c = *r;

    // define the previous node
    node* prev = NULL;

    //loop until the current node is NULL (reach the end) or it found a node with equal or greater index.
    while(c != NULL && c->index < index)
    {
        prev = c;
        c = c->next;
    }

    // reach the end
    if(c == NULL)
    {
        node* t = new(index, min, max);
        prev->next = t; // let the last node point to the node just created.
        return;
    }
    else if(c->index == index) // found a node with same index
    {
        // update
        c->min = min;
        c->max = max;
        return;
    }
    else if(prev == NULL) // it stopped at the first node of the linked list.
    {
        node* t = new(index, min, max);
        t->next = (*r); // let the node just created point to the root (head) of the linked list.
        (*r) = t; // update the root (head) of the linked list
        return;
    }
    else // it stopped somewhere at the middle of the list.
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

// delete a node with given index
void delete(node** p, int index)
{
    // if the root node is NULL, i.e. the list is empty, return.
    if((*p) == NULL) 
        return;

    node* c = *p;
    node* prev = NULL;
    while(c != NULL && c->index != index) // try to find the node with given index
    {
        prev = c;
        c = c->next;
    }

    if(c == NULL) // if not found, return
        return;
    else //(c->index == index) found
    {
        if(prev == NULL) //if it is the head
        {
            node* n = (*p)->next;
            free(*p); // free that node
            *p = n; // update the root node.
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
    // if current pointer points to NULL, return
    if((*p) == NULL) 
        return;

    // if the next node points to a node, delete that before freeing the current node.
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

        // get the first character of the command A or D or P or Q.
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
                    printf("The index should be in range from 1 to 31 inclusively.\n");
                    break;
                }

                c = scanf("%f", &min);
                if(c == 0)
                {
                    printf("Invalid value for min !\n");
                    break;
                }

                c = scanf("%f", &max);
                if(c == 0 || max < min)
                {
                    printf("Invalid value for max !\n");
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