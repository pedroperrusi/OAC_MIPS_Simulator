#include <stdio.h>

#include <iostream>
using std::cout;
using std::cin;
using std::endl;

#include <string>
using std::string;
using std::getline;

#define MEM_SIZE 4096






int32_t mem[MEM_SIZE];

int main(int argc, char *argv[]){

	char *codigo	= (argv[1]);
	char *dados	= (argv[2]);
	
	FILE *fcode = fopen(codigo, "rb");
	FILE *fdata = fopen(dados, "rb");



	fclose(fcode);
	fclose(fdata);
	return 0;
}