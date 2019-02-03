/**
 * An example program showing usage of the if..else statement and for and while loops
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */

#include <stdio.h>

int main() {
        int number;
        printf("Enter a small positive integer: ");
        scanf("%d", &number);

	/****************/
 	/* if statement */
        if(number <= 0)
        {
                printf("The entered number is negative or zero. Exiting.\n");
                return 0;
        }


	/***********************/
 	/* if...else statement */

        printf("================\n");
        printf("if...else\n");

        if(number > 25 && number < 35)
        {
                printf("The test expression is evaluated to true!\n");
        }
        else
        {
                printf("The test expression is evaluated to false!\n");
        }

        // Note that one can use a C ternary operator instead
        int b = (number > 25 && number < 35) ? 1 : -1;
        printf("b=%d\n", b);

	/************/
	/* for loop */

        printf("================\n");
        printf("for loop\n");

        printf("Printing 'hi' %d times: \n", number);
        for (size_t i = 0; i < number; i++) {
                printf("hi ");
        }
        printf("\n");


	// nested loops
	for (int i=0; i<2; i++)
	{
		for (int j=0; j<3; j++)
		{
		   printf("%d, %d\n",i ,j);
		}
	}


	/**************/
	/* while loop */

        printf("================\n");
        printf("while loop\n");

        printf("Printing 'hi' %d times: \n", number);
        size_t i = 0;
        while(i < number) {
                printf("hi ");
                i++;
        }
        printf("\n");

        return 0;
}
