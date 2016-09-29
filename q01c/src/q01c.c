#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <dlfcn.h>

enum {EXIT, GENERATE_PRIME, TEST_PRIME};
enum { NOT_PRIME, PRIME };

void menu();
void call_functions(int option);
void test_prime_call();

int main() 
{
	int option = 0;

	void* handle = dlopen("libprimo.so", RTLD_LAZY);
	int (*generate_prime)() = dlsym(handle, "generate_prime");
	int (*test_prime)() = dlsym(handle, "test_prime");

	do {
		menu();
		scanf("%d", &option);
		call_functions(option);

	} while(option != EXIT);

	dlclose(handle);

	return 0;
}

void menu() 
{
	printf("Escolha uma opção.\n");
	printf("1) Gerar um número primo.\n");
	printf("2) Testar a primalidade de um primo.\n");
	printf("0) Sair do programa.\n");
}

void call_functions(int option)
{
	int prime;
	switch(option) {
		case GENERATE_PRIME:
			prime = generate_prime();
			printf("Numero primo gerado: %d\n", prime);
		break;

		case TEST_PRIME:
			test_prime_call();
		break;

		case EXIT:
			printf("Bye!\n");
		break;

		default:
			printf("Opção inválida! Digite uma das opções apresentadas no menu...\n");
		break;

	}
}

void test_prime_call()
{
	int number;
	int result;
	printf("Digite o número que você deseja testar: \n");
	scanf("%d", &number);
	result = test_prime(number);

	if(result == PRIME) {
		printf("O numero %d é primo!\n", number);
	}
	else {
		printf("O numero %d não é primo!\n", number);
	}
}