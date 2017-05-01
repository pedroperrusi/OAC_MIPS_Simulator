#ifndef _SIMULATOR_MIPS_H_
#define _SIMULATOR_MIPS_H_

#include "headers.hpp"
#include "core.hpp"
#include "MIPS_core.hpp"
#include "binaryIO.hpp"

class MIPS_simulador
{
private:
    void limpaTela(int);
    int loadMemory( std::string, std::string );

public:
    MIPS_core* mips_;
    MIPS_simulador( std::string, std::string );

    int menu();
    void interfaceUsuario();
};

#endif
