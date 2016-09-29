#include "prime.h"

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int generate_prime()
{
	int prime;
	int result = NOT_PRIME;
	int i = 0;
	srand(time(NULL));

	while(result != PRIME) {
		prime = rand() % RAND_MAX;
		result = test_prime(prime);
		i++;
	}

	return prime;
}

int test_prime(int prime)
{
	int test_number = 3;

	if(prime < 2) {
		return NOT_PRIME;
	}

	while(test_number * test_number <= prime) {
		if(prime % test_number == 0) {
			return NOT_PRIME;
		}

		test_number += 2;
	}

	return PRIME;
}