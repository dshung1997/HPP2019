/**
 * Example code showing how a char array can also be used as a text
 * string. Each letter/character in the string is then represented by
 * one char, and the end of the string is indicated by a final null
 * (0) char. This is how text strings are usually represented in C
 * programs, and the representation used by C library functions such
 * as strlen() and strcmp().
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char** argv) {

  /* Create a text string consisting of 3 characters: "Hej". Then we
     need a char array with 4 elements, 3 for the actual letters in
     the string and one for the final null-terminating char. */
  char string1[4];
  string1[0] = 'H';
  string1[1] = 'e';
  string1[2] = 'j';
  string1[3] = '\0'; /* Here '\0' means a zero char, same thing as 0. */

  /* Check that it works by printing the string. */
  printf("Printing string1: %s\n", string1);

  /* Now we modify one of the characters in the string and then print
     it again. */
  string1[1] = 'U';
  printf("Printing string1 again: %s\n", string1);

  /* Create another string, "Hello", this time allocating memory for
     the string dynamically by calling malloc(). "Hello" has 5
     letters, so the length f our char array should be 6. */
  char* string2;
  string2 = malloc(6*sizeof(char));
  string2[0] = 'H';
  string2[1] = 'e';
  string2[2] = 'l';
  string2[3] = 'l';
  string2[4] = 'o';
  string2[5] = '\0';

  /* Check that it works by printing the string. */
  printf("Printing string2: %s\n", string2);

  /* Now we modify two of the characters in the string and then print
     it again. */
  string2[2] = 'X';
  string2[3] = 'Y';
  printf("Printing string2 again: %s\n", string2);

  /* OK, now we are done with string2. Remember to free the allocated
     memory, to avoid a memory leak. */
  free(string2);

  /* Now we look at how each letter/character is actually
     represented. The datatype "char" is really an 8-bit signed
     integer type, it can store 256 different integer values, ranging
     from -128 to 127. When the "char" type is used to represent
     letters/characters in a string, a character encoding (like ASCII)
     is used to map char values to letters/characters. Here we test
     how this works. */
  char cA = 'A';
  char cB = 'B';
  char cM = 'M';
  char ca = 'a';
  char cb = 'b';
  char cm = 'm';
  printf("The char cA printed as int: %d or with hexadecimal notation 0x%x\n", cA, cA);
  printf("The char cA printed as a character: %c\n", cA);
  printf("The char cB printed as int: %d or with hexadecimal notation 0x%x\n", cB, cB);
  printf("The char cB printed as a character: %c\n", cB);
  printf("The char cM printed as int: %d or with hexadecimal notation 0x%x\n", cM, cM);
  printf("The char cM printed as a character: %c\n", cM);
  printf("The char ca printed as int: %d or with hexadecimal notation 0x%x\n", ca, ca);
  printf("The char ca printed as a character: %c\n", ca);
  printf("The char cb printed as int: %d or with hexadecimal notation 0x%x\n", cb, cb);
  printf("The char cb printed as a character: %c\n", cb);
  printf("The char cm printed as int: %d or with hexadecimal notation 0x%x\n", cm, cm);
  printf("The char cm printed as a character: %c\n", cm);

  /* So when we write something like 'A' in our C code that means the
     same thing as the integer number corresponding to the letter
     A. */
  printf("Printing string1 again: %s\n", string1);
  /* Now we change first character in string1 to A using the
     corresponding integer value (65). */
  string1[0] = 65;
  printf("Printing string1 again (after changing first character): %s\n", string1);

  /* Now we create a string using a loop to set the character
     values. */
  int N = 55;
  /* Create a char array with N elements. */
  char* string3;
  string3 = malloc(N*sizeof(char));
  /* Now we want to assign values to the elements in out char
     array. Note that the number of regular characters/letters in the
     string can be at most N-1 since we also need to have the final
     null-termination of the string. */
  int i;
  for(i = 0; i < N-1; i++)
    string3[i] = 'G';
  string3[N-1] = '\0'; /* Final null-character terminating the string. */
  printf("%s\n", string3);

  /* Call the strlen() library function to get the length of the
     string. */
  int length_of_string = strlen(string3);
  printf("length_of_string = %d\n", length_of_string);

  /* OK, now we are done with string3. Remember to free the allocated
     memory, to avoid a memory leak. */
  free(string3);

  return 0;
}
