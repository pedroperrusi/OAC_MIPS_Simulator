#include "headers.hpp"
#include "core.hpp"
#include "MIPS_simulador.hpp"

int main(int argc, char *argv[])
{
	MIPS_simulador simulador( argv[1], argv[2] );

	std::cout << ".text" << '\n';
	simulador.mips_ -> dump_mem( MEM_TEXT_BEGIN, simulador.sizeText, 'h' );
	std::cout << ".data" << '\n';
	simulador.mips_ -> dump_mem( MEM_DATA_BEGIN, simulador.sizeData -4, 'h' );


	return 0;
}
