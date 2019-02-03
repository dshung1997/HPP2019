/**
 * Example of a main() function using a binary search tree (BST),
 * reading information about plants to add one by one from the
 * standard input. 
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Authors: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *          Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct tree_node
{
   int              ID;
   char             *name;
   struct tree_node *left;
   struct tree_node *right;
} node_t;

// node_t a; a.ID
// node_t* b; b->ID


void print_bst(node_t *node)
{
   if(node == NULL) {printf("Tree is empty!\n"); return;}

   if (node != NULL) printf("%d %s: \t", node->ID, node->name);
   if (node->left != NULL) printf("L%d,", node->left->ID);
   if (node->right != NULL) printf("R%d", node->right->ID);
   printf("\n");

   if (node->left != NULL)
      print_bst(node->left);
   if (node->right != NULL)
      print_bst(node->right);
}


void delete_tree(node_t **node)
{
	node_t* left = (*node)->left;

	if(left != NULL) 
		delete_tree(&left);

	node_t* right = (*node)->right;

	if(right != NULL) 
		delete_tree(&right);

	free((*node)->name);
	free(*node);
	(*node) = NULL;
}

void insert(node_t **node, int ID, char *name)
{
  // printf("WARNING: Function insert is not implemented\n");
//   0. if the current node is empty, just insert it.
  // 1. check if the current node has the same ID as the ID we provide
  // 2. If it is equal, return error message
  // 3. If it is not equal, compare the current ID and the input ID
  // 4. less than -> go to the left child node.
  // 5. greater than -> go to the right child node.

  	node_t* current_node = *node;

	if(current_node == NULL)
	{
		int length = strlen(name);

		(*node) = (node_t*) (malloc (sizeof (node_t)));
		(*node)->ID = ID;
		(*node)->name = (char*) (malloc (length * (sizeof (char))));
		strcpy((*node)->name, name);
		(*node)->left = NULL;
		(*node)->right = NULL;

		return;
	}

	// else

  	int current_ID = current_node->ID;

  	if(current_ID == ID)
  	{
		printf("The ID is already in the tree !\n");
		return;
  	}
	else if(current_ID > ID)
	{
		// node_t* left = current_node->left;
		insert(&((*node)->left), ID, name);
	}
	else
	{
		// node_t* right = current_node->right;
		insert(&((*node)->right), ID, name);
	}
}


void search(node_t *node, int ID)
{
  printf("WARNING: Function search is not implemented\n");
}


int main(int argc, char const *argv[])
{
   node_t *root = NULL;

   while(1) {
     printf("================================================\n");
     printf("Please enter ID of plant to add (zero to stop): ");
     int id;
     int r = scanf("%d", &id);
     if(r != 1 || id == 0) {
       printf("Breaking loop now.\n");
       break;
     }
     printf("OK, you entered id %d\n", id);
     printf("Please enter name of plant to add: ");
     char nameString[100]; /* Note: this will only work if the name entered is less than 100 characters long! */
     r = scanf("%s", nameString);
     if(r != 1) {
       printf("Failed to read name, breaking loop now.\n");
       break;
     }
     printf("OK, you have entered the following:  id = %d  nameString = %s\n", id, nameString);
     printf("Now insterting that into the tree...\n");
     insert(&root, id, nameString);
     printf("Now printing the tree:\n");
     print_bst(root);
   }

   printf("After loop.\n");
   
   delete_tree(&root);
   printf("Deleting the tree.\n");
   print_bst(root);

   printf("================================================\n");
   return 0;
}
