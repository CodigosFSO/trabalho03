#include "prime.h"

int generate_prime()
{
	int prime = 2;

	return prime;
}

int test_prime(int prime)
{
	int test_number = 3;

	if(prime % 2 == 0) {
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