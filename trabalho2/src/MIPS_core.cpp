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
    std::cout << "----------------------------------------" << '\n';
    std::cout << "fetch:\n" << '\n';
    RI = mem[PC];
    std::cout << "PC \t \t \t RI " << '\n';
    printAddressValues( PC, RI, 'h' );
    std::cout << "----------------------------------------" << '\n';
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
    std::cout << "----------------------------------------" << '\n';
    std::cout << "decode:\n" << '\n';
	switch(opcode){
		case EXT:
			switch(funct){

				case ADD:  //TODO verificar ocorrencia de overflow
                    std::cout
                        << "function\n\tadd rd, rs, $rt\n" << std::hex
                        << rd << " <- " << mem[rs] << " + " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] + mem[rt];
				break;

				case SUB:	//TODO verificar overflow
                    std::cout
                        << "function\n\tsub rd, rs, $rt\n" << std::hex
                        << rd << " <- " << mem[rs] << " - " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] - mem[rt];
				break;

				case DIV:
                    std::cout
                        << "function\n\tdiv rs, $rt\n" << std::hex
                        << "LO" << " <- " << mem[rs] << " / " << mem[rt]
                        << "HI" << " <- " << mem[rs] << " % " << mem[rt] << "\n"
                    << std::endl;
					LO = mem[rs]/mem[rt];
					HI = mem[rs]%mem[rt];
				break;

				case MULT:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tmult rs, $rt\n" << std::hex
                        << "HI" << " <- " << mem[rs] << " * " << mem[rt] << "\n"
                        << "LO" << " <- " << mem[rs] << " * " << mem[rt]
                    << std::endl;
					/*int64_t result = mem[rs] * mem[rt];
					LO = *((int32_t *)&result + 0);
					HI = *((int32_t *)&result + 1);*/
				break;

				case AND:
                    std::cout
                        << "function\n\tand rd, rs, $rt\n" << std::hex
                        << rd << " <- " << mem[rs] << " & " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] & mem[rt];
				break;

				case OR:
                    std::cout
                        << "function\n\tor rd, rs, $rt\n" << std::hex
                        << rd << " <- " << mem[rs] << " | " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] | mem[rt];
				break;

                case XOR:
                    std::cout
                        << "function\n\txor rd, rs, $rt\n" << std::hex
                        << rd << " <-  " << mem[rs] << " xor " << mem[rt] << " )"
                    << std::endl;
					mem[rd] = mem[rs] ^ mem[rt];
				break;

				case NOR:
                    std::cout
                        << "function\n\tnor rd, rs, $rt\n" << std::hex
                        << rd << " <- ~( " << mem[rs] << " | " << mem[rt] << " )"
                    << std::endl;
					mem[rd] = !(mem[rs] | mem[rt]);
				break;

				case SLT:
                    std::cout
                        << "function\n\tslt rd, rs, $rt\n" << std::hex
                        << rd << " = ( " << mem[rs] << " < " << mem[rt] << " )? 1 : 0"
                    << std::endl;
					if(mem[rs] < mem[rt]) mem[rd] = 1;
					else mem[rd] = 0;
				break;

				case SLL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsll rd, rs, shamt\n" << std::hex
                        << rd << " = " << mem[rs] << " << " << shamt
                    << std::endl;
					mem[rd] = ((uint32_t) mem[rt]) << shamt;
				break;

				case SRL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsrl rd, rs, shamt\n" << std::hex
                        << rd << " = " << mem[rs] << "∅ >> " << shamt
                    << std::endl;
                    // TODO expressão do MIPS reference: RD = RS >> SHIFT5
					mem[rd] = ((uint32_t) mem[rt]) >> shamt;
				break;

				case SRA:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tra rd, rs, shamt\n" << std::hex
                        << rd << " = " << mem[rs] << " >> " << shamt
                    << std::endl;
					mem[rd] = ((int32_t) mem[rt]) >> shamt;
				break;

				case MFHI:  //TODO restricçao de instrulcoes seguintes nao poderem mexer em HI
                    std::cout
                        << "function\n\tmfhi rd\n" << std::hex
                        << rd << " = " << HI
                    << std::endl;
					mem[rd] = HI;
				break;

				case MFLO:  //TODO restricçao de instrucoes seguintes nao poderem mexer em LO
                    std::cout
                        << "function\n\tmflo rd\n" << std::hex
                        << rd << " = " << LO
                    << std::endl;
					mem[rd] = LO;
				break;

				case JR:  //TODO verificar o branch delay, nao saquei o q e,  //VERIFICAR O PC +4
                    std::cout
                        << "function\n\tjr rs\n" << std::hex
                        << PC << " <-  " << rs
                    << std::endl;
					PC = mem[rs];
				break;
			}
		break;

        case ADDI:  //TODO verificar overflow
            std::cout
                << "function\n\taddi rd, rs, k16\n" << std::hex
                << rd << " <- " << mem[rs] << " + " << k16
            << std::endl;
			mem[rt] = mem[rs] + k16;
		break;

        case ADDIU:
            std::cout
                << "function\n\taddiu rd, rs, k16\n" << std::hex
                << rd << " <- u(" << mem[rs] << ") + u(" << k16 << ")"
            << std::endl;
			mem[rt] = (int32_t)mem[rs] + (int16_t)k16;
		break;

        case ANDI:
            std::cout
                << "function\n\tandi rd, rs, k16\n" << std::hex
                << rd << " <-  " << mem[rs] << " & " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] & (uint32_t)k16;
		break;

        case ORI:
            std::cout
                << "function\n\tori rd, rs, k16\n" << std::hex
                << rd << " <-  " << mem[rs] << " | " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] | (uint32_t)k16;
		break;

        case XORI:
            std::cout
                << "function\n\txori rd, rs, k16\n" << std::hex
                << rd << " <-  " << mem[rs] << " xor " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] ^ (uint32_t)k16;
		break;

        case LW:
            std::cout
                << "function\n\tlw rd, off( rs )\n" << std::hex
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

		case LH:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                // TODO representar rs em half word
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case LHU:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                // TODO representar rs em half word
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case LB:
            std::cout
                << "function\n\tlb rd, off( rs )\n" << std::hex
                // TODO representá-los em byte
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case LBU:
            //TODO Fazer função
		break;

        case LUI:
        //TODO Fazer função
		break;

        case SW:
            //TODO Fazer função
		break;

        case SH:
            std::cout
                << "function\n\tsh rs, off( rt )\n" << std::hex
                // TODO representar rt em halfword
                << rs << " <-  " << mem[rt] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

		case SB:
            std::cout
                << "function\n\tsb rs, off( rt )\n" << std::hex
                // TODO representar rt em byte
                << rs << " <-  " << mem[rt] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case SLTI:
            std::cout
                << "function\n\tslti rd, rs, k16\n" << std::hex
                << rd << " = ( " << mem[rs] << " < " <<  k16 << " )? 1 : 0"
            << std::endl;
			if((int32_t)mem[rs] < (int16_t)k16) mem[rt] = 1;
			else mem[rt] = 0;
		break;

        case SLTIU:
            std::cout
                << "function\n\tsltiu rd, rs, k16\n" << std::hex
                << rd << " = ( u(" << mem[rs] << ") < u(" <<  k16 << ") )? 1 : 0"
            << std::endl;
            //TODO Fazer função
		break;

        case J:  //VERIFICAR O PC +4
            std::cout
                << "function\n\tj LABEL\n" << std::hex
                << PC <<  " += " << k26
            << std::endl;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

        case JAL: //VERIFICAR O PC +4
            std::cout
                << "function\n\tjal LABEL\n" << std::hex
                << RA << " <- " << PC + 8 << "\n"
                << PC << " += " << k26 << "\n"
            << std::endl;
			mem[RA] = PC + 8;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

        case BEQ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbeq rs, rt, LABEL\n" << std::hex
                << "if( " << mem[rs] << " == " << mem[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
            if(mem[rs] == mem[rt]) PC = (PC+ ((int32_t)k16<<2));
        break;

		case BNE: //testar se e necessario +4
            std::cout
                << "function\n\tbne rs, rt, LABEL\n" << std::hex
                << "if( " << mem[rs] << " != " << mem[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
			if(mem[rs] != mem[rt]) PC = (PC+ ((int32_t)k16<<2));
		break;

		case BLEZ:  //TODO, testar caso de o endereco ser invalido, testar se precisa do +4
            std::cout
                << "function\n\tblez rs, k26\n" << std::hex
                << "if( " << mem[rs] << " <= 0  )\n\t"
                << PC << " <-  " << rs << " + " << k26
            << std::endl;
			if(mem[rs] <= 0) PC = (PC + ((int32_t)k16<<2));
		break;

		case BGTZ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbgtz rs, LABEL\n" << std::hex
                << "if( " << mem[rs] << " > 0  )\n\t"
                << PC << " +=  " << k26
            << std::endl;
			if(mem[rs] > 0) PC = (PC + ((int32_t)k16<<2));
		break;
	}
    std::cout << "----------------------------------------" << '\n';
}

void MIPS_core::step(){
	fetch();
	decode();
	execute();
}

void MIPS_core::run()
{

}
