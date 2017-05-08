#include "MIPS_core.hpp"

MIPS_core::MIPS_core()
{
	this -> inicializaRegs();
}

void MIPS_core::inicializaRegs()	/* Inicializa todos os regs com o valor 0 */
{
	PC = 0;
	regs[ZERO] = 0;
	HI = 0;
	LO = 0;
	regs[ZERO] = 0;
	regs[AT] = 0;
	regs[V0] = 0;
	regs[V1] = 0;
	regs[A0] = 0;
	regs[A1] = 0;
	regs[A2] = 0;
	regs[A3] = 0;
	regs[T0] = 0;
	regs[T1] = 0;
	regs[T2] = 0;
	regs[T3] = 0;
	regs[T4] = 0;
	regs[T5] = 0;
	regs[T6] = 0;
	regs[T7] = 0;
	regs[S0] = 0;
	regs[S1] = 0;
	regs[S2] = 0;
	regs[S3] = 0;
	regs[S4] = 0;
	regs[S5] = 0;
	regs[S6] = 0;
	regs[S7] = 0;
	regs[T8] = 0;
	regs[T9] = 0;
	regs[K0] = 0;
	regs[K1] = 0;
	regs[GP] = 0;
	regs[SP] = 0;
	regs[FP] = 0;
	regs[RA] = 0;
}

void MIPS_core::dump_mem( size_t start, size_t end, char format )
{
	if( start > end  || end > MEM_SIZE )
	{
		std::cout << "Dump Memory: Error when accessing memory dimentions." << '\n';
		return;
	}

	uint32_t binValue;
	std::cout << "MEMORY\n\n";
	for( size_t position = start; position < end; position += WORD_SIZE )
	{
		binValue = mem[ position ];
		// Prnt addresses and their values
		printAddressValues( position, binValue, format );
	}
}

void MIPS_core::dump_reg(char formato)	/* Imprime o conteúdo dos registradores do MIPS */
{
	printf("REGISTERS\n\n");

	if(formato == 'h'){		/* Printando o valor dos regs em formato hexadecimal */

		printf("$zero\t = \t0x%08x \n",regs[ZERO]);		/* 0x%08x para printar no formato hexadecimal 0x00000000 */
		printf("$at  \t = \t0x%08x \n",regs[AT]);
		printf("$v0  \t = \t0x%08x \n",regs[V0]);
		printf("$v1  \t = \t0x%08x \n",regs[V1]);
		printf("$a0  \t = \t0x%08x \n",regs[A0]);
		printf("$a1  \t = \t0x%08x \n",regs[A1]);
		printf("$a2  \t = \t0x%08x \n",regs[A2]);
		printf("$a3  \t = \t0x%08x \n",regs[A3]);
		printf("$t0  \t = \t0x%08x \n",regs[T0]);
		printf("$t1  \t = \t0x%08x \n",regs[T1]);
		printf("$t2  \t = \t0x%08x \n",regs[T2]);
		printf("$t3  \t = \t0x%08x \n",regs[T3]);
		printf("$t4  \t = \t0x%08x \n",regs[T4]);
		printf("$t5  \t = \t0x%08x \n",regs[T5]);
		printf("$t6  \t = \t0x%08x \n",regs[T6]);
		printf("$t7  \t = \t0x%08x \n",regs[T7]);
		printf("$s0  \t = \t0x%08x \n",regs[S0]);
		printf("$s1  \t = \t0x%08x \n",regs[S1]);
		printf("$s2  \t = \t0x%08x \n",regs[S2]);
		printf("$s3  \t = \t0x%08x \n",regs[S3]);
		printf("$s4  \t = \t0x%08x \n",regs[S4]);
		printf("$s5  \t = \t0x%08x \n",regs[S5]);
		printf("$s6  \t = \t0x%08x \n",regs[S6]);
		printf("$s7  \t = \t0x%08x \n",regs[S7]);
		printf("$t8  \t = \t0x%08x \n",regs[T8]);
		printf("$t9  \t = \t0x%08x \n",regs[T9]);
		printf("$k0  \t = \t0x%08x \n",regs[K0]);
		printf("$k1  \t = \t0x%08x \n",regs[K1]);
		printf("$gp  \t = \t0x%08x \n",regs[GP]);
		printf("$sp  \t = \t0x%08x \n",regs[SP]);
		printf("$fp  \t = \t0x%08x \n",regs[FP]);
		printf("$ra  \t = \t0x%08x \n\n",regs[RA]);
		printf("PC   \t = \t0x%08x \n",PC);
		printf("HI   \t = \t0x%08x \n",HI);
		printf("LO   \t = \t0x%08x \n",LO);
	}
	else if(formato == 'd'){	/* Printando o valor dos regs em formato decimal */

		printf("$zero\t = \t%d \n",regs[ZERO]);
		printf("$at  \t = \t%d \n",regs[AT]);
		printf("$v0  \t = \t%d \n",regs[V0]);
		printf("$v1  \t = \t%d \n",regs[V1]);
		printf("$a0  \t = \t%d \n",regs[A0]);
		printf("$a1  \t = \t%d \n",regs[A1]);
		printf("$a2  \t = \t%d \n",regs[A2]);
		printf("$a3  \t = \t%d \n",regs[A3]);
		printf("$t0  \t = \t%d \n",regs[T0]);
		printf("$t1  \t = \t%d \n",regs[T1]);
		printf("$t2  \t = \t%d \n",regs[T2]);
		printf("$t3  \t = \t%d \n",regs[T3]);
		printf("$t4  \t = \t%d \n",regs[T4]);
		printf("$t5  \t = \t%d \n",regs[T5]);
		printf("$t6  \t = \t%d \n",regs[T6]);
		printf("$t7  \t = \t%d \n",regs[T7]);
		printf("$s0  \t = \t%d \n",regs[S0]);
		printf("$s1  \t = \t%d \n",regs[S1]);
		printf("$s2  \t = \t%d \n",regs[S2]);
		printf("$s3  \t = \t%d \n",regs[S3]);
		printf("$s4  \t = \t%d \n",regs[S4]);
		printf("$s5  \t = \t%d \n",regs[S5]);
		printf("$s6  \t = \t%d \n",regs[S6]);
		printf("$s7  \t = \t%d \n",regs[S7]);
		printf("$t8  \t = \t%d \n",regs[T8]);
		printf("$t9  \t = \t%d \n",regs[T9]);
		printf("$k0  \t = \t%d \n",regs[K0]);
		printf("$k1  \t = \t%d \n",regs[K1]);
		printf("$gp  \t = \t%d \n",regs[GP]);
		printf("$sp  \t = \t%d \n",regs[SP]);
		printf("$fp  \t = \t%d \n",regs[FP]);
		printf("$ra  \t = \t%d \n\n",regs[RA]);
		printf("PC   \t = \t%d \n",PC);
		printf("HI   \t = \t%d \n",HI);
		printf("LO   \t = \t%d \n",LO);
	}

}

bool MIPS_core::fetch()
{
    if( PC >= (this->sizeText) )
    {
        std::cout << "-- program is finished running --" << '\n';
        return false;
    }
    std::cout << "----------------------------------------" << '\n';
    std::cout << "fetch:\n" << '\n';
    RI = mem[PC];
    std::cout << "PC \t \t \t RI " << '\n';
    printAddressValues( PC, RI, 'h' );
    std::cout << "----------------------------------------\n";
    PC += WORD_SIZE;
	return true;
}

void MIPS_core::decode(){

	opcode = (RI >> 26) & 0x3F;		/* Separa apenas os bits de interesse que representam o opcode */


	if(opcode == EXT)
    {	/* Se do tipo R */
		/* Separacao de cada campo */
		rs = (RI >> 21) & 0x1F;
		rt = (RI >> 16) & 0x1F;
		rd = (RI >> 11) & 0x1F;
		shamt = (RI >> 6) & 0x1F;
		funct = RI & 0x3F;
	}
	else
        if( opcode == BLEZ || opcode == ADDI || opcode == ADDIU || opcode == ANDI || opcode == BEQ || opcode == BNE || opcode == LBU ||
			opcode == LH || opcode == LUI || opcode == LW || opcode == ORI || opcode == SB || opcode == SH || opcode == SLTI ||
			opcode == SLTIU || opcode == SW || opcode == XORI ||  opcode == LB || opcode == LHU || opcode == BGTZ)
        {	/* Se do tipo I */
			/* Separacao de cada campo */
			rs = (RI >> 21) & 0x1F;
			rt = (RI >> 16) & 0x1F;
			k16 = RI & 0xFFFF;
	}
	else
        if(opcode == J || opcode == JAL)
        {	/* Se do tipo J */
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
                        << rd << " <- " << regs[rs] << " + " << regs[rt]
                    << std::endl;
					regs[rd] = regs[rs] + regs[rt];
					std::cout << "Resultado " << regs[rd];
				break;

				case SUB:	//TODO verificar overflow
                    std::cout
                        << "function\n\tsub rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << regs[rs] << " - " << regs[rt]
                    << std::endl;
					regs[rd] = regs[rs] - regs[rt];
					std::cout << "Resultado " << regs[rd];
				break;

				case DIV:
                    std::cout
                        << "function\n\tdiv rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << "LO" << " <- " << regs[rs] << " / " << regs[rt] << "\n\t"
                        << "HI" << " <- " << regs[rs] << " % " << regs[rt]
                    << std::endl;
					LO = regs[rs]/regs[rt];
					HI = regs[rs]%regs[rt];
				break;

				case MULT:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tmult rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << "HI" << " <- " << regs[rs] << " * " << regs[rt] << "\n\t"
                        << "LO" << " <- " << regs[rs] << " * " << regs[rt]
                    << std::endl;
					int64_t result;
					result = regs[rs] * regs[rt];
					LO = *((int32_t*)&result + 0);
					HI = *((int32_t*)&result + 1);
				break;

				case AND:
                    std::cout
                        << "function\n\tand rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << regs[rs] << " & " << regs[rt]
                    << std::endl;
					regs[rd] = regs[rs] & regs[rt];
					std::cout << "Resultado " << regs[rd];
				break;

				case OR:
                    std::cout
                        << "function\n\tor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- " << regs[rs] << " | " << regs[rt]
                    << std::endl;
					regs[rd] = regs[rs] | regs[rt];
					std::cout << "Resultado " << regs[rd];
				break;

                case XOR:
                    std::cout
                        << "function\n\txor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <-  " << regs[rs] << " xor " << regs[rt] << " )"
                    << std::endl;
					regs[rd] = regs[rs] ^ regs[rt];
					std::cout << "Resultado " << regs[rd];
				break;

				case NOR:
                    std::cout
                        << "function\n\tnor rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " <- ~( " << regs[rs] << " | " << regs[rt] << " )"
                    << std::endl;
					regs[rd] = ~(regs[rs] | regs[rt]);
					std::cout << "Resultado " << regs[rd];
				break;

				case SLT:
                    std::cout
                        << "function\n\tslt rd, rs, $rt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = ( " << regs[rs] << " < " << regs[rt] << " )? 1 : 0"
                    << std::endl;
					if(regs[rs] < regs[rt]) regs[rd] = 1;
					else regs[rd] = 0;
					std::cout << "Resultado " << regs[rd];
				break;

				case SLL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsll rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << regs[rs] << " << " << shamt
                    << std::endl;
					regs[rd] = ((uint32_t) regs[rt]) << shamt;
					std::cout << "Resultado " << regs[rd];
				break;

				case SRL:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tsrl rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << regs[rs] << "∅ >> " << shamt
                    << std::endl;
                    // TODO expressão do MIPS reference: RD = RS >> SHIFT5
					regs[rd] = ((uint32_t) regs[rt]) >> shamt;
					std::cout << "Resultado " << regs[rd];
				break;

				case SRA:  //TODO verificar se o funcionamento esta correto
                    std::cout
                        << "function\n\tra rd, rs, shamt\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << regs[rs] << " >> " << shamt
                    << std::endl;
					regs[rd] = ((int32_t) regs[rt]) >> shamt;
					std::cout << "Resultado " << regs[rd];
				break;

				case MFHI:  //TODO restricçao de instrulcoes seguintes nao poderem mexer em HI
                    std::cout
                        << "function\n\tmfhi rd\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << HI
                    << std::endl;
					regs[rd] = HI;
					std::cout << "Resultado " << regs[rd];
				break;

				case MFLO:  //TODO restricçao de instrucoes seguintes nao poderem mexer em LO
                    std::cout
                        << "function\n\tmflo rd\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << rd << " = " << LO
                    << std::endl;
					regs[rd] = LO;
					std::cout << "Resultado " << regs[rd];
				break;

				case JR:  //TODO verificar o branch delay, nao saquei o q e,  //VERIFICAR O PC +4
                    std::cout
                        << "function\n\tjr rs\n" << std::hex
                        << "----------------------------------------\n"
                        << "execute:\n\t"
                        << PC << " <-  " << rs
                    << std::endl;
					PC = regs[rs];
					std::cout << "Resultado " << regs[rs];
				break;

				case SYSCALL:
					std::cout << "SYSCALL" << '\n';
					if( regs[V0] == 1 )
						std::cout
							<< "\tPrint integer" << "\n"
							<< "----------------------------------------\n"
							<< "execute:\n\t"
							<< regs[A0] << '\n';

					if( regs[V0] == 4 )
					{
						std::cout
							<< "\tPrint string on address: $a0 = " << regs[A0] << "\n"
							<< "----------------------------------------\n"
							<< "execute:\n\t";

							int address = regs[A0];
							char* ptr = (char*) (mem+address);
							int i = 0;
							while( ptr[i] != '\0' )
							{
								printf("%c", ptr[i] );
								i++;
								if( i == 4 )
								{
									address += 4;
									ptr = (char*) (mem+address);
									i = 0;
								}
							}

					}
					else if (regs[V0] == 10)
					{
						std::cout << "-- program is finished running --" << '\n';
					}
				break;

			}
		break;

        case ADDI:  //TODO verificar overflow
            std::cout
                << "function\n\taddi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <- " << regs[rs] << " + " << k16
            << std::endl;
			regs[rt] = (int32_t)regs[rs] + (int16_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ADDIU:
            std::cout
                << "function\n\taddiu rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <- u(" << regs[rs] << ") + u(" << k16 << ")"
            << std::endl;
			regs[rt] = (int32_t)regs[rs] + (int16_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ANDI:
            std::cout
                << "function\n\tandi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << regs[rs] << " & " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] & (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ORI:
            std::cout
                << "function\n\tori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << regs[rs] << " | " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] | (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case XORI:
            std::cout
                << "function\n\txori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << regs[rs] << " xor " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] ^ (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case LW:
            std::cout
                << "function\n\tlw rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << k16 << "(" << (int32_t)regs[rs] << ")"
            << std::endl;
             regs[rt] = ((int32_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

		case LH:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << k16 << "(" << (int16_t)regs[rs] << ")"
            << std::endl;
            regs[rt] = ((int16_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case LHU:
            std::cout
                << "function\n\tlhu rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << k16 << "(" << (uint16_t)regs[rs] << ")"
            << std::endl;
            regs[rt] = ((uint16_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case LB:
            std::cout
                << "function\n\tlb rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " <-  " << k16 << "(" << (int8_t)regs[rs] << ")"
            << std::endl;
            regs[rt] = ((int8_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

		case LUI:
			std::cout
				<< "function\n\tlui rt, k16\n" << std::hex
				<< "----------------------------------------\n"
				<< "execute:\n\t"
				<< rt << " <-  " << k16
			<< std::endl;
		    regs[rt] = ((uint32_t)k16 << 16);
		    std::cout << "Resultado " << regs[rt];
		break;

		case LBU:
			std::cout
				<< "function\n\tlbu rd, off( rs )\n" << std::hex
				<< "----------------------------------------\n"
				<< "execute:\n\t"
				<< rt << " <-  " << k16 << "(" << (uint8_t)regs[rs] << ")"
			<< std::endl;
			regs[rt] = ((uint8_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case SW:
			std::cout
				<< "function\n\tsh rs, off( rt )\n" << std::hex
				<< "----------------------------------------\n"
				<< "execute:\n\t"
				<< "mem["<<rs<<"] <-  " << k16 << "(" << (int32_t)regs[rs] << ")"
			<< std::endl;
            mem[regs[rs]+(int32_t)k16]= (int32_t)regs[rt];

		break;

        case SH:
            std::cout
                << "function\n\tsh rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "mem["<<rs<<"] <-  " << k16 << "(" << (int16_t)regs[rs] << ")"
            << std::endl;
            mem[regs[rs]+(int32_t)k16]= (int16_t)regs[rt];

		break;

		case SB:
            std::cout
                << "function\n\tsb rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "mem["<<rs<<"] <-  " << k16 << "(" << (int8_t)regs[rs] << ")"
            << std::endl;
            mem[regs[rs]+(int32_t)k16]= (int8_t)regs[rt];

		break;

        case SLTI:
            std::cout
                << "function\n\tslti rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " = ( " << regs[rs] << " < " <<  k16 << " )? 1 : 0"
            << std::endl;
			if((int32_t)regs[rs] < (int16_t)k16) regs[rt] = 1;
			else regs[rt] = 0;
			std::cout << "Resultado " << regs[rt];
		break;

        case SLTIU:
            std::cout
                << "function\n\tsltiu rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rt << " = ( u(" << regs[rs] << ") < u(" <<  k16 << ") )? 1 : 0"
            << std::endl;

            if((int32_t)regs[rs] < (int16_t)k16) regs[rt] = 1;
			else regs[rt] = 0;
		break;

        case J:  //VERIFICAR O PC +4
            std::cout
                << "function\n\tj LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << PC <<  " += " << k26
            << std::endl;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);
			std::cout << "Resultado " << PC;
		break;

        case JAL: //VERIFICAR O PC +4
            std::cout
                << "function\n\tjal LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << RA << " <- " << PC + 8 << "\n\t"
                << PC << " += " << k26
            << std::endl;
			regs[RA] = PC;
			PC = ((PC & 0xff000000) | (int32_t)k26 << 2);

			std::cout << "Resultado " << PC;
			std::cout << "Resultado " << regs[RA];
		break;

        case BEQ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbeq rs, rt, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << regs[rs] << " == " << regs[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
            if(regs[rs] == regs[rt]) PC = (PC+ ((int32_t)k16<<2));
            std::cout << "Resultado " << PC;
        break;

		case BNE: //testar se e necessario +4
            std::cout
                << "function\n\tbne rs, rt, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << regs[rs] << " != " << regs[rt] << " )\n\t"
                << PC << " += " << k26
            << std::endl;
			if(regs[rs] != regs[rt]) PC = (PC+ ((int32_t)k16<<2));
			std::cout << "Resultado " << PC;
		break;

		case BLEZ:  //TODO, testar caso de o endereco ser invalido, testar se precisa do +4
            std::cout
                << "function\n\tblez rs, k26\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << regs[rs] << " <= 0  )\n\t"
                << PC << " =  " << rs << " + " << k26
            << std::endl;
			if(regs[rs] <= 0) PC = (PC+ ((int16_t)k16<<2));
			std::cout << "Resultado " << PC;
		break;

		case BGTZ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbgtz rs, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << regs[rs] << " > 0  )\n\t"
                << PC << " +=  " << k16
            << std::endl;
			if(regs[rs] > 0) PC = (PC+ ((int16_t)k16<<2));
			std::cout << "Resultado " << PC;
		break;
	}
	std::cout << "\n----------------------------------------" << '\n';
}

void MIPS_core::step(){
	if( fetch() )
	{
		decode();
		execute();
	}
}

void MIPS_core::run()
{
	while( fetch() )
	{
		decode();
		execute();
	}
}
