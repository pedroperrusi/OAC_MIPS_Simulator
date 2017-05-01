#include "headers.hpp"
#include "core.hpp"
#include "MIPS_simulador.hpp"

int main(int argc, char *argv[])
{
	MIPS_simulador simulador( argv[1], argv[2] );

	std::cout << ".text" << '\n';
	simulador.mips_ -> dump_mem( MEM_TEXT_BEGIN, MEM_TEXT_END, 'h' );
	std::cout << ".data" << '\n';
	simulador.mips_ -> dump_mem( MEM_DATA_BEGIN, (MEM_DATA_BEGIN+simulador.sizeData), 'h' );


	return 0;
}
