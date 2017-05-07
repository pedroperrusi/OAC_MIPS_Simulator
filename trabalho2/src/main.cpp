#include "headers.hpp"
#include "core.hpp"
#include "MIPS_simulador.hpp"

int main(int argc, char *argv[])
{
	string paramP("p");
	string paramF("f");

	MIPS_simulador simulador( argv[1], argv[2] );

  	if(!paramP.compare(argv[3])){			//Caso o parametro passado seja p
		simulador.interfaceUsuario();

	}else if(!paramF.compare(argv[3])){		//Caso o parametro passado seja f

		std::cout << ".text" << '\n';
		simulador.mips_ -> dump_mem( MEM_TEXT_BEGIN, simulador.mips_->sizeText, 'h' );
		std::cout << "Size: "<< simulador.mips_->sizeText << '\n';
		std::cout << ".data" << '\n';
		simulador.mips_ -> dump_mem( MEM_DATA_BEGIN, simulador.mips_->sizeData-4, 'h' );
		std::cout << "Size: "<< simulador.mips_->sizeData << '\n';

	}

	return EXIT_SUCCESS;

}
