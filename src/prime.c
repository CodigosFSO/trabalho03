#include "prime.h"

#include <stdlib.h>
#include <time.h>

int generate_prime()
{
	int prime;
	int result = NOT_PRIME;

	srand(time(NULL));

	while(result != PRIME) {
		prime = rand() % 1000000;
		result = test_prime(prime);
	}

	return prime;
}

int test_prime(int prime)
{
	int test_number = 3;

	if(prime % 2 == 0 && prime != 2) {
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