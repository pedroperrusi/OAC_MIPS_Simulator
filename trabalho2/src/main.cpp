#include "headers.hpp"
#include "core.hpp"
#include "func.hpp"

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
