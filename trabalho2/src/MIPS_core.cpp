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

void MIPS_core::dump_reg(char formato)	/* Imprime o conteúdo dos registradores do MIPS */
{
	printf("REGISTERS\n\n");

	if(formato == 'h'){		/* Printando o valor dos regs em formato hexadecimal */

		printf("$zero = 0x%08x \n",mem[ZERO]);		/* 0x%08x para printar no formato hexadecimal 0x00000000 */
		printf("$at = 0x%08x \n",mem[AT]);
		printf("$v0 = 0x%08x \n",mem[V0]);
		printf("$v1 = 0x%08x \n",mem[V1]);
		printf("$a0 = 0x%08x \n",mem[A0]);
		printf("$a1 = 0x%08x \n",mem[A1]);
		printf("$a2 = 0x%08x \n",mem[A2]);
		printf("$a3 = 0x%08x \n",mem[A3]);
		printf("$t0 = 0x%08x \n",mem[T0]);
		printf("$t1 = 0x%08x \n",mem[T1]);
		printf("$t2 = 0x%08x \n",mem[T2]);
		printf("$t3 = 0x%08x \n",mem[T3]);
		printf("$t4 = 0x%08x \n",mem[T4]);
		printf("$t5 = 0x%08x \n",mem[T5]);
		printf("$t6 = 0x%08x \n",mem[T6]);
		printf("$t7 = 0x%08x \n",mem[T7]);
		printf("$s0 = 0x%08x \n",mem[S0]);
		printf("$s1 = 0x%08x \n",mem[S1]);
		printf("$s2 = 0x%08x \n",mem[S2]);
		printf("$s3 = 0x%08x \n",mem[S3]);
		printf("$s4 = 0x%08x \n",mem[S4]);
		printf("$s5 = 0x%08x \n",mem[S5]);
		printf("$s6 = 0x%08x \n",mem[S6]);
		printf("$s7 = 0x%08x \n",mem[S7]);
		printf("$t8 = 0x%08x \n",mem[T8]);
		printf("$t9 = 0x%08x \n",mem[T9]);
		printf("$k0 = 0x%08x \n",mem[K0]);
		printf("$k1 = 0x%08x \n",mem[K1]);
		printf("$gp = 0x%08x \n",mem[GP]);
		printf("$sp = 0x%08x \n",mem[SP]);
		printf("$fp = 0x%08x \n",mem[FP]);
		printf("$ra = 0x%08x \n\n",mem[RA]);
		printf("PC = 0x%08x \n",PC);
		printf("HI = 0x%08x \n",HI);
		printf("LO = 0x%08x \n",LO);
	}
	else if(formato == 'd'){	/* Printando o valor dos regs em formato decimal */

		printf("$zero = %d \n",mem[ZERO]);
		printf("$at = %d \n",mem[AT]);
		printf("$v0 = %d \n",mem[V0]);
		printf("$v1 = %d \n",mem[V1]);
		printf("$a0 = %d \n",mem[A0]);
		printf("$a1 = %d \n",mem[A1]);
		printf("$a2 = %d \n",mem[A2]);
		printf("$a3 = %d \n",mem[A3]);
		printf("$t0 = %d \n",mem[T0]);
		printf("$t1 = %d \n",mem[T1]);
		printf("$t2 = %d \n",mem[T2]);
		printf("$t3 = %d \n",mem[T3]);
		printf("$t4 = %d \n",mem[T4]);
		printf("$t5 = %d \n",mem[T5]);
		printf("$t6 = %d \n",mem[T6]);
		printf("$t7 = %d \n",mem[T7]);
		printf("$s0 = %d \n",mem[S0]);
		printf("$s1 = %d \n",mem[S1]);
		printf("$s2 = %d \n",mem[S2]);
		printf("$s3 = %d \n",mem[S3]);
		printf("$s4 = %d \n",mem[S4]);
		printf("$s5 = %d \n",mem[S5]);
		printf("$s6 = %d \n",mem[S6]);
		printf("$s7 = %d \n",mem[S7]);
		printf("$t8 = %d \n",mem[T8]);
		printf("$t9 = %d \n",mem[T9]);
		printf("$k0 = %d \n",mem[K0]);
		printf("$k1 = %d \n",mem[K1]);
		printf("$gp = %d \n",mem[GP]);
		printf("$sp = %d \n",mem[SP]);
		printf("$fp = %d \n",mem[FP]);
		printf("$ra = %d \n\n",mem[RA]);
		printf("PC = %d \n",PC);
		printf("HI = %d \n",HI);
		printf("LO = %d \n",LO);
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
    std::cout << "----------------------------------------\n";
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
    std::cout << "decode:\n";
	switch(opcode){
		case EXT:
			switch(funct){

				case ADD:  //TODO verificar ocorrencia de overflow
                    std::cout
                        << "function\n\tadd rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << mem[rs] << " + " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] + mem[rt];
				break;

				case SUB:	//TODO verificar overflow
                    std::cout
                        << "function\n\tsub rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << mem[rs] << " - " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] - mem[rt];
				break;

				case DIV:
                    std::cout
                        << "function\n\tdiv rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << "LO" << " <- " << mem[rs] << " / " << mem[rt] << "\n\t"
                        << "HI" << " <- " << mem[rs] << " % " << mem[rt]
                    << std::endl;
					LO = mem[rs]/mem[rt];
					HI = mem[rs]%mem[rt];
				break;

				case MULT:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tmult rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << "HI" << " <- " << mem[rs] << " * " << mem[rt] << "\n\t"
                        << "LO" << " <- " << mem[rs] << " * " << mem[rt]
                    << std::endl;
					/*int64_t result = mem[rs] * mem[rt];
					LO = *((int32_t *)&result + 0);
					HI = *((int32_t *)&result + 1);*/
				break;

				case AND:
                    std::cout
                        << "function\n\tand rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << mem[rs] << " & " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] & mem[rt];
				break;

				case OR:
                    std::cout
                        << "function\n\tor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << mem[rs] << " | " << mem[rt]
                    << std::endl;
					mem[rd] = mem[rs] | mem[rt];
				break;

                case XOR:
                    std::cout
                        << "function\n\txor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <-  " << mem[rs] << " xor " << mem[rt] << " )"
                    << std::endl;
					mem[rd] = mem[rs] ^ mem[rt];
				break;

				case NOR:
                    std::cout
                        << "function\n\tnor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- ~( " << mem[rs] << " | " << mem[rt] << " )"
                    << std::endl;
					mem[rd] = !(mem[rs] | mem[rt]);
				break;

				case SLT:
                    std::cout
                        << "function\n\tslt rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = ( " << mem[rs] << " < " << mem[rt] << " )? 1 : 0"
                    << std::endl;
					if(mem[rs] < mem[rt]) mem[rd] = 1;
					else mem[rd] = 0;
				break;

				case SLL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsll rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << mem[rs] << " << " << shamt
                    << std::endl;
					mem[rd] = ((uint32_t) mem[rt]) << shamt;
				break;

				case SRL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsrl rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << mem[rs] << "∅ >> " << shamt
                    << std::endl;
                    // TODO expressão do MIPS reference: RD = RS >> SHIFT5
					mem[rd] = ((uint32_t) mem[rt]) >> shamt;
				break;

				case SRA:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tra rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << mem[rs] << " >> " << shamt
                    << std::endl;
					mem[rd] = ((int32_t) mem[rt]) >> shamt;
				break;

				case MFHI:  //TODO restricçao de instrulcoes seguintes nao poderem mexer em HI
                    std::cout
                        << "function\n\tmfhi rd\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << HI
                    << std::endl;
					mem[rd] = HI;
				break;

				case MFLO:  //TODO restricçao de instrucoes seguintes nao poderem mexer em LO
                    std::cout
                        << "function\n\tmflo rd\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << LO
                    << std::endl;
					mem[rd] = LO;
				break;

				case JR:  //TODO verificar o branch delay, nao saquei o q e,  //VERIFICAR O PC +4
                    std::cout
                        << "function\n\tjr rs\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << PC << " <-  " << rs
                    << std::endl;
					PC = mem[rs];
				break;
			}
		break;

        case ADDI:  //TODO verificar overflow
            std::cout
                << "function\n\taddi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <- " << mem[rs] << " + " << k16
            << std::endl;
			mem[rt] = mem[rs] + k16;
		break;

        case ADDIU:
            std::cout
                << "function\n\taddiu rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <- u(" << mem[rs] << ") + u(" << k16 << ")"
            << std::endl;
			mem[rt] = (int32_t)mem[rs] + (int16_t)k16;
		break;

        case ANDI:
            std::cout
                << "function\n\tandi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << mem[rs] << " & " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] & (uint32_t)k16;
		break;

        case ORI:
            std::cout
                << "function\n\tori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << mem[rs] << " | " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] | (uint32_t)k16;
		break;

        case XORI:
            std::cout
                << "function\n\txori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << mem[rs] << " xor " << k16 << " )"
            << std::endl;
			mem[rt] = mem[rs] ^ (uint32_t)k16;
		break;

        case LW:
            std::cout
                << "function\n\tlw rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

		case LH:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rs em half word
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case LHU:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rs em half word
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case LB:
            std::cout
                << "function\n\tlb rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representá-los em byte
                << rd << " <-  " << mem[rs] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

		case LUI:
		      //TODO Fazer função
		break;

		case LBU:
			//TODO Fazer função
		break;

        case SW:
            //TODO Fazer função
		break;

        case SH:
            std::cout
                << "function\n\tsh rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rt em halfword
                << rs << " <-  " << mem[rt] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

		case SB:
            std::cout
                << "function\n\tsb rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rt em byte
                << rs << " <-  " << mem[rt] << " + " << k16
            << std::endl;
            //TODO Fazer função
		break;

        case SLTI:
            std::cout
                << "function\n\tslti rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " = ( " << mem[rs] << " < " <<  k16 << " )? 1 : 0"
            << std::endl;
			if((int32_t)mem[rs] < (int16_t)k16) mem[rt] = 1;
			else mem[rt] = 0;
		break;

        case SLTIU:
            std::cout
                << "function\n\tsltiu rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " = ( u(" << mem[rs] << ") < u(" <<  k16 << ") )? 1 : 0"
            << std::endl;
            //TODO Fazer função
		break;

        case J:  //VERIFICAR O PC +4
            std::cout
                << "function\n\tj LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << PC <<  " += " << k26
            << std::endl;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

        case JAL: //VERIFICAR O PC +4
            std::cout
                << "function\n\tjal LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << RA << " <- " << PC + 8 << "\n\t"
                << PC << " += " << k26
            << std::endl;
			mem[RA] = PC + 8;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
		break;

        case BEQ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbeq rs, rt, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << mem[rs] << " == " << mem[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
            if(mem[rs] == mem[rt]) PC = (PC+ ((int32_t)k16<<2));
        break;

		case BNE: //testar se e necessario +4
            std::cout
                << "function\n\tbne rs, rt, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << mem[rs] << " != " << mem[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
			if(mem[rs] != mem[rt]) PC = (PC+ ((int32_t)k16<<2));
		break;

		case BLEZ:  //TODO, testar caso de o endereco ser invalido, testar se precisa do +4
            std::cout
                << "function\n\tblez rs, k26\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << mem[rs] << " <= 0  )\n\t"
                << PC << " <-  " << rs << " + " << k26
            << std::endl;
			if(mem[rs] <= 0) PC = (PC + ((int32_t)k16<<2));
		break;

		case BGTZ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbgtz rs, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
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
