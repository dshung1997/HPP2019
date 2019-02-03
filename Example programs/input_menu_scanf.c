/**
 * Example of how the scanf() function can be used to get a kind of
 * input "menu" behavior; reading in different commands from the user,
 * in a loop.
 *
 * In this example, the program reads one char representing the
 * "command" from the user, and then does different things depending
 * on the command. The command 'x' causes the program to quit, 'h'
 * prints "hej", and in case of the command 'n' the program calls
 * scanf again to read an int number, which is printed.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
  int done = 0;
  while(done == 0) {
    char command;
    scanf(" %c", &command); /* Note whitespace before %c! */
    if(command == 'x')
      done = 1;
    else if (command == 'h')
      printf("hej!\n");
    else if (command == 'n') {
      int number;
      scanf("%d", &number);
      printf("The number is %d\n", number);
    }
  }
  return 0;
}

/*

Here is an example of what it might look like when the program is run:

h
hej!
n 77
The number is 77
n 44
The number is 44
h
hej!
x

(In the example above the user first types "h" and then <enter>, then
the user types "n 77" and then <enter>, and so on.)

*/
