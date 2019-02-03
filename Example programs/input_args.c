/**
 * Example of how the input arguments to the main function (argc and
 * argv) can be used. The program uses argc and argv to first print
 * all the input arguments, and then do a simple computation based on
 * a few of them.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

// printf("\n");
int main(int argc, const char** argv) {
  // char* char_x = argv[1];
  // int x = atoi(char_x);
  /* Print hello and the value of argc */
  printf("Hello! argc = %d\n", argc);
  /* Use a for-loop to print all input arguments */
  printf("=======================================\n");
  int i;
  for(i = 0; i < argc; i++)
    printf("argv[%d] = %s\n", i, argv[i]);
  /* For the computation below we want there to be 4 input arguments
     in addition to the executable program name, so argc should be 5. */
  if(argc != 5) {
    printf("This program expects 4 input arguments: name x y count\n");
    printf("The name should be a string, x and y should be floating-point "
	   "numbers, and count should be an integer.\n");
    printf("The program will print your name and the sum of the "
	   "numbers x and y. The sum will be printed count times.\n");
    /* Now we return -1 to indicate that the program ended due to an
       error. Note that returning from the main() function means that
       the program ends. */
    return -1;
  }
  /* OK, now we have checked that argc is 5, so we can continue.
     Now we create variables of the types we want, using atoi() and
     atof() to convert the values when needed. */
  const char* name = argv[1];
  /* Use atof() to convert argv[2] and argv[3] strings to
     floating-point numbers for x and y. */
  double x = atof(argv[2]);
  double y = atof(argv[3]);
  /* Use atoi() to convert argv[4] string to int. */
  int count = atoi(argv[4]);
  printf("=======================================\n");
  printf("name = '%s'\n", name);
  printf("x = %f\n", x);
  printf("y = %f\n", y);
  printf("count = %d\n", count);
  printf("=======================================\n");
  printf("Hello %s!\n", name);
  double sum = x + y;
  printf("The sum has been computed. Now it will be printed %d times.\n",
	 count);
  for(i = 0; i < count; i++)
    printf("The sum of %f and %f is %f\n", x, y, sum);
  printf("Goodbye.\n");
  /* Return 0 to indicate that the program completed without errors. */
  return 0;
}
