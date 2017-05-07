#include "MIPS_core.hpp"

MIPS_core::MIPS_core()
{
	this -> inicializaRegs();
}

void MIPS_core::inicializaRegs()
{
	PC = 0;
	regs[ZERO] = 0;
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

		printf("$zero = 0x%08x \n",regs[ZERO]);		/* 0x%08x para printar no formato hexadecimal 0x00000000 */
		printf("$at = 0x%08x \n",regs[AT]);
		printf("$v0 = 0x%08x \n",regs[V0]);
		printf("$v1 = 0x%08x \n",regs[V1]);
		printf("$a0 = 0x%08x \n",regs[A0]);
		printf("$a1 = 0x%08x \n",regs[A1]);
		printf("$a2 = 0x%08x \n",regs[A2]);
		printf("$a3 = 0x%08x \n",regs[A3]);
		printf("$t0 = 0x%08x \n",regs[T0]);
		printf("$t1 = 0x%08x \n",regs[T1]);
		printf("$t2 = 0x%08x \n",regs[T2]);
		printf("$t3 = 0x%08x \n",regs[T3]);
		printf("$t4 = 0x%08x \n",regs[T4]);
		printf("$t5 = 0x%08x \n",regs[T5]);
		printf("$t6 = 0x%08x \n",regs[T6]);
		printf("$t7 = 0x%08x \n",regs[T7]);
		printf("$s0 = 0x%08x \n",regs[S0]);
		printf("$s1 = 0x%08x \n",regs[S1]);
		printf("$s2 = 0x%08x \n",regs[S2]);
		printf("$s3 = 0x%08x \n",regs[S3]);
		printf("$s4 = 0x%08x \n",regs[S4]);
		printf("$s5 = 0x%08x \n",regs[S5]);
		printf("$s6 = 0x%08x \n",regs[S6]);
		printf("$s7 = 0x%08x \n",regs[S7]);
		printf("$t8 = 0x%08x \n",regs[T8]);
		printf("$t9 = 0x%08x \n",regs[T9]);
		printf("$k0 = 0x%08x \n",regs[K0]);
		printf("$k1 = 0x%08x \n",regs[K1]);
		printf("$gp = 0x%08x \n",regs[GP]);
		printf("$sp = 0x%08x \n",regs[SP]);
		printf("$fp = 0x%08x \n",regs[FP]);
		printf("$ra = 0x%08x \n\n",regs[RA]);
		printf("PC = 0x%08x \n",PC);
		printf("HI = 0x%08x \n",HI);
		printf("LO = 0x%08x \n",LO);
	}
	else if(formato == 'd'){	/* Printando o valor dos regs em formato decimal */

		printf("$zero = %d \n",regs[ZERO]);
		printf("$at = %d \n",regs[AT]);
		printf("$v0 = %d \n",regs[V0]);
		printf("$v1 = %d \n",regs[V1]);
		printf("$a0 = %d \n",regs[A0]);
		printf("$a1 = %d \n",regs[A1]);
		printf("$a2 = %d \n",regs[A2]);
		printf("$a3 = %d \n",regs[A3]);
		printf("$t0 = %d \n",regs[T0]);
		printf("$t1 = %d \n",regs[T1]);
		printf("$t2 = %d \n",regs[T2]);
		printf("$t3 = %d \n",regs[T3]);
		printf("$t4 = %d \n",regs[T4]);
		printf("$t5 = %d \n",regs[T5]);
		printf("$t6 = %d \n",regs[T6]);
		printf("$t7 = %d \n",regs[T7]);
		printf("$s0 = %d \n",regs[S0]);
		printf("$s1 = %d \n",regs[S1]);
		printf("$s2 = %d \n",regs[S2]);
		printf("$s3 = %d \n",regs[S3]);
		printf("$s4 = %d \n",regs[S4]);
		printf("$s5 = %d \n",regs[S5]);
		printf("$s6 = %d \n",regs[S6]);
		printf("$s7 = %d \n",regs[S7]);
		printf("$t8 = %d \n",regs[T8]);
		printf("$t9 = %d \n",regs[T9]);
		printf("$k0 = %d \n",regs[K0]);
		printf("$k1 = %d \n",regs[K1]);
		printf("$gp = %d \n",regs[GP]);
		printf("$sp = %d \n",regs[SP]);
		printf("$fp = %d \n",regs[FP]);
		printf("$ra = %d \n\n",regs[RA]);
		printf("PC = %d \n",PC);
		printf("HI = %d \n",HI);
		printf("LO = %d \n",LO);
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
        if( opcode == ADDI || opcode == ADDIU || opcode == ANDI || opcode == BEQ || opcode == BNE || opcode == LBU ||
			opcode == LH || opcode == LUI || opcode == LW || opcode == ORI || opcode == SB || opcode == SH || opcode == SLTI ||
			opcode == SLTIU || opcode == SW || opcode == XORI ||  opcode == LB || opcode == LHU)
        {	/* Se do tipo I */
			/* Separacao de cada campo */
			rs = (RI >> 21) & 0x1F;
			rt = (RI >> 16) & 0x1F;
			k16 = RI & 0xFFFF;
	}
	else
        if(opcode == BLEZ || opcode == J || opcode == JAL || opcode == BGTZ)
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
					/*int64_t result = regs[rs] * regs[rt];
					LO = *((int32_t *)&result + 0);
					HI = *((int32_t *)&result + 1);*/
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
					regs[rd] = !(regs[rs] | regs[rt]);
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
			}
		break;

        case ADDI:  //TODO verificar overflow
            std::cout
                << "function\n\taddi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <- " << regs[rs] << " + " << k16
            << std::endl;
			regs[rt] = regs[rs] + k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ADDIU:
            std::cout
                << "function\n\taddiu rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <- u(" << regs[rs] << ") + u(" << k16 << ")"
            << std::endl;
			regs[rt] = (int32_t)regs[rs] + (int16_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ANDI:
            std::cout
                << "function\n\tandi rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << regs[rs] << " & " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] & (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case ORI:
            std::cout
                << "function\n\tori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << regs[rs] << " | " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] | (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case XORI:
            std::cout
                << "function\n\txori rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << regs[rs] << " xor " << k16 << " )"
            << std::endl;
			regs[rt] = regs[rs] ^ (uint32_t)k16;
			std::cout << "Resultado " << regs[rt];
		break;

        case LW:
            std::cout
                << "function\n\tlw rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " <-  " << regs[rs] << " + " << k16
            << std::endl;
             regs[rt] = ((int32_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

		case LH:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rs em half word
                << rd << " <-  " << regs[rs] << " + " << k16
            << std::endl;
            regs[rt] = ((int16_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case LHU:
            std::cout
                << "function\n\tlh rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rs em half word
                << rd << " <-  " << regs[rs] << " + " << k16
            << std::endl;
            regs[rt] = ((uint16_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case LB:
            std::cout
                << "function\n\tlb rd, off( rs )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representá-los em byte
                << rd << " <-  " << regs[rs] << " + " << k16
            << std::endl;
            regs[rt] = ((int8_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];


            //TODO Fazer função
		break;

		case LUI:
		    regs[rt] = ((uint32_t)k16 << 16);
		    std::cout << "Resultado " << regs[rt];
		break;

		case LBU:
			regs[rt] = ((uint8_t)mem[regs[rs]+(int32_t)k16]);
			std::cout << "Resultado " << regs[rt];
		break;

        case SW:
            mem[regs[rs]+(int32_t)k16]= (int32_t)regs[rt];

		break;

        case SH:
            std::cout
                << "function\n\tsh rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rt em halfword
                << rs << " <-  " << regs[rt] << " + " << k16
            << std::endl;
            mem[regs[rs]+(int32_t)k16]= (int16_t)regs[rt];

		break;

		case SB:
            std::cout
                << "function\n\tsb rs, off( rt )\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                // TODO representar rt em byte
                << rs << " <-  " << regs[rt] << " + " << k16
            << std::endl;
            mem[regs[rs]+(int32_t)k16]= (int8_t)regs[rt];

		break;

        case SLTI:
            std::cout
                << "function\n\tslti rd, rs, k16\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << rd << " = ( " << regs[rs] << " < " <<  k16 << " )? 1 : 0"
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
                << rd << " = ( u(" << regs[rs] << ") < u(" <<  k16 << ") )? 1 : 0"
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
			regs[RA] = PC + 8;
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
                << PC << " <-  " << rs << " + " << k26
            << std::endl;
			if(regs[rs] <= 0) PC = (PC + ((int32_t)k16<<2));
			std::cout << "Resultado " << PC;
		break;

		case BGTZ: //Testar , verificar se é necessario o +4
            std::cout
                << "function\n\tbgtz rs, LABEL\n" << std::hex
                << "----------------------------------------\n"
                << "execute:\n\t"
                << "if( " << regs[rs] << " > 0  )\n\t"
                << PC << " +=  " << k26
            << std::endl;
			if(regs[rs] > 0) PC = (PC + ((int32_t)k16<<2));
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
