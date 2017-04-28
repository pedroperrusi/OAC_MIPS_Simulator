#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <iostream>
using std::cout;
using std::cin;
using std::endl;

#include <string>
using std::string;
using std::getline;

#define MEM_SIZE 4096

#define CLEAR "clr" 						//Utilize clr caso sistema seja unix
//#define CLEAR "clear"						//Utilize clear caso sistema seja windows


/* Variaveis que correspondem aos campos das intrucoes */
int opcode, rs, rt, rd, shamt, funct;
int k16;
int32_t k26;


int32_t mem[MEM_SIZE];


/* 32 registradores e HI e LO declarados como int32_t como pedido no roteiro */
int32_t  AT, V0, V1, A0, A1, A2, A3, T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, S0, S1, S2, S3, S4, S5,
		 S6, S7, K0, K1, GP, SP, FP, RA, HI, LO;


/* PC e RI declarados como uint32_t como pedido no roteiro */
uint32_t PC, RI;


/* Cada numero representa um registrador */
/*enum REGISTERS {	ZERO=0, AT=1, V0=2, V1=3, A0=4, A1=5, A2=6, A3=7, T0=8, T1=9, T2=10, T3=11, T4=12, T5=13, T6=14,
					T7=15, T8=24, T9=25, S0=16, S1=17, S2=18, S3=19, S4=20, S5=21, S6=22, S7=23, K0=26, K1=27, GP=28, SP=29,
					FP=30, RA=31 };*/


/* Constantes dos opcodes */
enum OPCODES {		EXT=0x00, LH=0x21, SB=0x28, BLEZ=0x06, SLTI=0x0A, XORI=0x0E, LW=0x23, LHU=0x25, SH=0x29,	
					BGTZ=0x07, SLTIU=0x0B, J=0x02, LB=0x20, LUI=0x0F, BEQ=0x04, ADDI=0x08, ANDI=0x0C, JAL=0x03,
					LBU=0x24, SW=0x2B, BNE=0x05, ADDIU=0x09, ORI=0x0D };


/* Constantes dos funct*/
enum FUNCT {		ADD=0x20, OR=0x25, SLL=0x00, SUB=0x22, XOR=0x26,	SRL=0x02, MULT=0x18, NOR=0x27,
					SRA=0x03, DIV=0x1A, AND=0x24, SLT=0x2A, JR=0x08, SYSCALL=0x0c, MFHI=0x10, MFLO=0x12 };



/**************************************************************************************************************/
/*
*	Bloco 0: destinado as funções genericas:
*/
/**************************************************************************************************************/

void limpaTela(int pausa){

	if(pausa == 0){									//Limpa a tela sem esperar nada
		system(CLEAR);
	
	}else if(pausa == 1){							//Espera enter para limpar tela, mostra mensagem pedindo para tecla ser apertada
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		cout << "Pressione ENTER para continuar";
		getchar();
		system(CLEAR);
	
	}else if(pausa == 2){							//Espera enter para limpar tela, mas nao mostra mensagem
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		getchar();
		system(CLEAR);
	}

	
}

/**************************************************************************************************************/
//	Fim do bloco 0
/**************************************************************************************************************/




/**************************************************************************************************************/
//	Bloco 1: destinado as funções relativas ao primeiro caminho de execução:
/**************************************************************************************************************/

int menu(){ 
	int opcao;

	cout << "Defina o numero da opcao desejada:\n";
	cout << "1. step\n\n";
	cout << "2. run\n\n";
	cout << "3. dump_mem\n\n";
	cout << "4. dump_reg\n\n";
	cout << "5. exit\n\n>";

	cin >> opcao;

	return opcao;
}

void interfaceUsuario(){

	int opcaoMenu;

	do{		
		opcaoMenu = menu();

		switch(opcaoMenu){
			case 1:
				cout << "1\n";
			break;

			case 2:
				cout << "2\n";
			break;

			case 3:
				cout << "3\n";
			break;

			case 4:
				cout << "4\n";
			break;

			case 5:
				cout << "5- Encerrando programa!\n";
			break;

			default:
				cout << "Opcao digitada invalida! Tente novamente com um valor de 0 a 5!\n";
		}

		limpaTela(1);
	}while(opcaoMenu != 5);
}


/**************************************************************************************************************/
//	Fim do bloco 1
/**************************************************************************************************************/





/**************************************************************************************************************/
//	Bloco 2: destinado as funções relativas ao segundo caminho de execução:
/**************************************************************************************************************/
void fetch(){

} 
 
void decode(){

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

void executar(){
	cout << "Teste f";
}

/**************************************************************************************************************/
//	Fim do bloco 2
/**************************************************************************************************************/
