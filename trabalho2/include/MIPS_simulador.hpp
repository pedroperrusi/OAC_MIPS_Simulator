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
    int loadMemory( char*, char* );

public:
    MIPS_core* mips_;
    MIPS_simulador( char*, char* );
    int sizeText, sizeData;

    int menu();
    void interfaceUsuario();
};

#endif
