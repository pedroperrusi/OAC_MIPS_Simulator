#include "MIPS_core.hpp"

void MIPS_core::inicializaRegs()
{
    PC = 0;
}

void MIPS_core::dump_mem( size_t start, size_t end, char format )
{
	if( start > end  || end > MEM_SIZE )
	{
        std::cout << "Dump Memory: Error when accessing memory dimentions." << '\n';
		return;
	}

	uint32_t binValue;
	std::cout << " Memory "<< '\n';
	for( size_t position = start; position < end; position += WORD_SIZE )
	{
		binValue = mem[ position ];
		// Prnt addresses and their values
		printAddressValues( position, binValue, format );
		// wait key
		getchar();
	}
}


void MIPS_core::fetch()
{

}

void MIPS_core::decode(){

	opcode = (RI >> 26) & 0x3F;		/* Separa apenas os bits de interesse que representam o opcode */


	if(opcode == EXT){	/* Se do tipo R */


			/* Separacao de cada campo */
			rs = (RI >> 21) & 0x1F;
			rt = (RI >> 16) & 0x1F;
			rd = (RI >> 11) & 0x1F;
			shamt = (RI >> 6) & 0x1F;
			funct = RI & 0x3F;
	}
	else if(opcode == ADDI, opcode == ADDIU, opcode == ANDI, opcode == BEQ, opcode == BNE, opcode == LBU,
			opcode == LH, opcode == LUI, opcode == LW, opcode == ORI, opcode == SB, opcode == SH, opcode == SLTI,
			opcode == SLTIU, opcode == SW, opcode == XORI,  opcode == LB, opcode == LHU){	/* Se do tipo I */


			/* Separacao de cada campo */
			rs = (RI >> 21) & 0x1F;
			rt = (RI >> 16) & 0x1F;
			k16 = RI & 0xFFFF;
	}
	else if(opcode == BLEZ, opcode == J, opcode == JAL, opcode == BGTZ){	/* Se do tipo J */


			/* Separacao de cada campo */
			k26 = RI & 0x03FFFFFF;		/* Separando endereco */
	}

}

void MIPS_core::execute(){
	switch(opcode){
		case EXT:
		break;

		case LH:
		break;

		case SB:
		break;

		case BLEZ:
		break;

		case SLTI:
		break;

		case XORI:
		break;

		case LW:
		break;

		case LHU:
		break;

		case SH:
		break;

		case BGTZ:
		break;

		case SLTIU:
		break;

		case J:
		break;

		case LB:
		break;

		case LUI:
		break;

		case BEQ:
		break;

		case ADDI:
		break;

		case ANDI:
		break;

		case JAL:
		break;

		case LBU:
		break;

		case SW:
		break;

		case BNE:
		break;

		case ADDIU:
		break;

		case ORI:
		break;
	}
}

void MIPS_core::step(){
	fetch();
	decode();
	execute();
}

void MIPS_core::run()
{

}
