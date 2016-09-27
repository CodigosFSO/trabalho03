#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "prime.h"

int main() 
{
	int prime;
	int result = NOT_PRIME;
	printf("digite o numero: ");
	scanf("%d", &prime);

	result = test_prime(prime);

	if(result == PRIME) {
		printf("o numero %d é um primo!\n", prime);
	}
	else {
		printf("o numero %d não é um primo!\n", prime);	
	}

	return 0;
}