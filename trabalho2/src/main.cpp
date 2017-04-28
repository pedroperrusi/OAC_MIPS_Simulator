#include <stdio.h>
#include <stdlib.h>
#include "func.hpp" 

#include <iostream>
using std::cout;
using std::cin;
using std::endl;

#include <string>
using std::string;
using std::getline;

#define MEM_SIZE 4096

#define CLEAR "clr" 						//Utilize clr caso sistema seja unix
//#define CLEAR "clear"						//Utilize clear caso sistema seja windows

//int32_t mem[MEM_SIZE];


int main(int argc, char *argv[]){
	string paramP("p");
	string paramF("f");

	char *codigo	= (argv[1]);			//Nome do arquivo contendo os codigos
	char *dados		= (argv[2]);			//Nome do arquivo contendo os dados

	if(!paramP.compare(argv[3])){			//Caso o parametro passado seja p, ele executa essa parte
		interfaceUsuario();
	}else if(!paramF.compare(argv[3])){		//Caso o parametro passado seja f, ele executa essa parte
		executar();
	} 

	return EXIT_SUCCESS;
}