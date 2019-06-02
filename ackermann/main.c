// Ackermann Function implementation

#include <stdio.h>

extern long long int ack(long long int x, long long int y);

int main(void)
{
	long long int num1, num2;

	printf("Please enter number m: ");
	scanf("%d",&num1);

	printf("Please enter number n: ");
	scanf("%d",&num2);

	long long int res = ack(num1,num2);
    printf("Result = %d\n", res);

    while(1);
    return 0;
}
