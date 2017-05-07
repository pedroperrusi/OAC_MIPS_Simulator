#ifndef _MIPS_CORE_HPP_
#define _MIPS_CORE_HPP_

#include "headers.hpp"
#include "core.hpp"
#include "binaryIO.hpp"

// Classe simulator_MIPS deverá embarcar todos nossos procedimentos em memória no MIPS.
class MIPS_core
{
// Variáveis e subrotinas privadas são acessíveis apenas aos metodos desta classe.
// Caso precise acessá-las diretamente, posicione-as em public.
private:
    /* Criando um enum com alias para facilitar a manipulacao dos registradores na memoria */
    enum REGISTERS
    {
        ZERO=0, AT=1, V0=2, V1=3, A0=4, A1=5, A2=6, A3=7, T0=8, T1=9, T2=10, T3=11, T4=12, T5=13, T6=14,
    	T7=15, T8=24, T9=25, S0=16, S1=17, S2=18, S3=19, S4=20, S5=21, S6=22, S7=23, K0=26, K1=27, GP=28, SP=29,
    	FP=30, RA=31
    };

    /* Constantes dos opcodes */
    enum OPCODES
    {
        EXT=0x00, LH=0x21, SB=0x28, BLEZ=0x06, SLTI=0x0A, XORI=0x0E, LW=0x23, LHU=0x25, SH=0x29,
    	BGTZ=0x07, SLTIU=0x0B, J=0x02, LB=0x20, LUI=0x0F, BEQ=0x04, ADDI=0x08, ANDI=0x0C, JAL=0x03,
    	LBU=0x24, SW=0x2B, BNE=0x05, ADDIU=0x09, ORI=0x0D
    };

    /* Constantes dos funct*/
    enum FUNCT
    {
        ADD=0x20, OR=0x25, SLL=0x00, SUB=0x22, XOR=0x26,	SRL=0x02, MULT=0x18, NOR=0x27,
    	SRA=0x03, DIV=0x1A, AND=0x24, SLT=0x2A, JR=0x08, SYSCALL=0x0c, MFHI=0x10, MFLO=0x12
    };

    /* Variaveis que correspondem aos campos das intrucoes */
    int opcode, rs, rt, rd, shamt, funct;
    int k16;
    int32_t k26;

    /* Declarando PC, RI, HI, LO como sugerido no roteiro */
    uint32_t PC, RI;
    int32_t HI,LO;

public:
    // Memória do simulador
    int32_t mem[MEM_SIZE];
    int sizeText, sizeData;

    MIPS_core();
    void inicializaRegs();

    void dump_mem( size_t, size_t, char );
    void dump_reg( char );

    bool fetch();
    void decode();
    void execute();
    void step();
    void run();
};

#endif
