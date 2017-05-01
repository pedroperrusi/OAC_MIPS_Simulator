#include "headers.hpp"
#include "core.hpp"
#include "MIPS_simulador.hpp"

MIPS_simulador* simulador_;

int main(int argc, char *argv[]){

	simulador_ = new MIPS_simulador( argv[1], argv[2] );
	std::cout << ".text" << '\n';
	simulador_ -> mips_ -> dump_mem( MEM_TEXT_BEGIN, MEM_TEXT_END, 'h' );
	std::cout << ".data" << '\n';
	simulador_ -> mips_ -> dump_mem( MEM_DATA_BEGIN, MEM_DATA_END, 'h' );


	return 0;
}
