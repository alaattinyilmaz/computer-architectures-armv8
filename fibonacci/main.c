/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int fib(long long int n);

int main(void)
{
    long long int a;
    for (int i = 1; i <=5; i++){
		a = fib(i);
		printf("%dth Fibonacci Number is %lld\n", i, a);
    }
    while(1);
    //return 0;
}

