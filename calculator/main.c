/* main.c simple program to calc assembler program */

#include <stdio.h>

extern int calc(char oper, int a, int b);

int main(void)
{
	int num1, num2;
	char oper;

    printf("Please enter the operation: ");
    scanf ("%c", &oper);
    printf("%c", oper);

    printf("Please enter the first number: ");
    scanf ("%4d", &num1);
    printf("%4d", num1);

    printf("Please enter the second number: ");
    scanf ("%4d", &num2);
    printf("%4d", num2);

	int result = calc(oper, num1, num2);
	printf("Result is %d\n", result);

    while(1);
    return 0;
}
