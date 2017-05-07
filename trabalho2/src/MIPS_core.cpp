#include "MIPS_core.hpp"

MIPS_core::MIPS_core()
{
    this -> inicializaRegs();
}

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
    if( PC >= (this->sizeText) )
    {
        std::cout << "-- program is finished running --" << '\n';
        return;
    }
    RI = mem[PC];
    std::cout << "PC \t \t \t RI " << '\n';
    printAddressValues( PC, RI, 'h' );
    PC += WORD_SIZE;
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
			switch(funct){

				case ADD:  //TODO verificar ocorrencia de overflow
					mem[rd] = mem[rs] + mem[rt];
				break;

				case SUB:	//TODO verificar overflow
					mem[rd] = mem[rs] - mem[rt];
				break;

				case DIV:
					LO = mem[rs]/mem[rt];
					HI = mem[rs]%mem[rt];
				break;

				case MULT:  //TODO verificar se o funcionamento esta correto
					/*int64_t result = mem[rs] * mem[rt];
					LO = *((int32_t *)&result + 0);
					HI = *((int32_t *)&result + 1);*/
				break;

				case AND:
					mem[rd] = mem[rs] & mem[rt];
				break;

				case OR:
					mem[rd] = mem[rs] | mem[rt];
				break;

				case NOR:
					mem[rd] = !(mem[rs] | mem[rt]);
				break;

				case SLT:
					if(mem[rs] < mem[rt]) mem[rd] = 1;
					else mem[rd] = 0;
				break;

				case SLL:  //TODO verificar se o funcionamento esta correto
					mem[rd] = ((uint32_t) mem[rt]) << shamt;
				break;

				case SRL:  //TODO verificar se o funcionamento esta correto
					mem[rd] = ((uint32_t) mem[rt]) >> shamt;
				break;

				case SRA:  //TODO verificar se o funcionamento esta correto
					mem[rd] = ((int32_t) mem[rt]) >> shamt;
				break;

				case MFHI:  //TODO restricçao de instrulcoes seguintes nao poderem mexer em HI
					mem[rd] = HI;
				break;

				case MFLO:  //TODO restricçao de instrulcoes seguintes nao poderem mexer em LO
					mem[rd] = LO;
				break;

				case XOR:
					mem[rd] = mem[rs] ^ mem[rt];
				break;

				case JR:  //TODO verificar o branch delay, nao saquei o q e,  //VERIFICAR O PC +4
					PC = mem[rs];
				break;
			}
		break;

		case LH:
		break;

		case SB:
		break;

		case BLEZ:  //TODO, testar caso de o endereco ser invalido, testar se precisa do +4
			if(mem[rs] <= 0) PC = (PC + ((int32_t)k16<<2));
		break;

		case SLTI:
			if((int32_t)mem[rs] < (int16_t)k16) mem[rt] = 1;
			else mem[rt] = 0;
		break;

		case XORI:
			mem[rt] = mem[rs] ^ (uint32_t)k16;
		break;

		case LW:
		break;

		case LHU:
		break;

		case SH:
		break;

		case BGTZ: //Testar , verificar se é necessario o +4
			if(mem[rs] > 0) PC = (PC + ((int32_t)k16<<2));
		break;

		case SLTIU:
		break;

		case J:  //VERIFICAR O PC +4
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

		case LB:
		break;

		case LUI:
		break;

		case BEQ: //Testar , verificar se é necessario o +4
			if(mem[rs] == mem[rt]) PC = (PC+ ((int32_t)k16<<2));
		break;

		case ADDI:  //TODO verificar overflow
			mem[rt] = mem[rs] + k16;
		break;

		case ANDI:
			mem[rt] = mem[rs] & (uint32_t)k16;
		break;

		case JAL: //VERIFICAR O PC +4
			mem[RA] = PC + 8;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

		case LBU:
		break;

		case SW:
		break;

		case BNE: //testar se e necessario +4
			if(mem[rs] != mem[rt]) PC = (PC+ ((int32_t)k16<<2));
		break;

		case ADDIU:
			mem[rt] = (int32_t)mem[rs] + (int16_t)k16;
		break;

		case ORI:
			mem[rt] = mem[rs] | (uint32_t)k16;
		break;
	}
}

void MIPS_core::step(){
	fetch();
//	decode();
//	execute();
}

void MIPS_core::run()
{

}
