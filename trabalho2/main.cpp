#include <stdio.h>

#include <iostream>
using std::cout;
using std::cin;
using std::endl;

#include <string>
using std::string;
using std::getline;

#define MEM_SIZE 4096

//#define CLEAR "clr" 						//Utilize clr caso sistema seja unix
#define CLEAR "clear"						//Utilize clear caso sistema seja windows

int32_t mem[MEM_SIZE];


/**TODO: 	Depois tem q arrumar as declarações de funçoes como arquivo .h e os codigos em outro .cpp e arrumar o make, mas tem tempo q fiz isso nao lembro
			Vo pesquisar depois ve se lembro como faz, mas se alguem ja souber e quiser agilizar fica show*/


/**************************************************************************************************************/
/*
*	Bloco 0: destinado as funções genericas:
*/
/**************************************************************************************************************/

void interfaceUsuario();
void executar();
void limpaTela();

int main(int argc, char *argv[]){
	string paramP("p");
	string paramF("f");

	char *codigo	= (argv[1]);			//Nome do arquivo contendo os codigos
	char *dados		= (argv[2]);			//Nome do arquivo contendo os dados

	if(!paramP.compare(argv[3])){			//Caso o parametro passado seja p, ele executa essa parte
		interfaceUsuario();
	}else if(!paramF.compare(argv[3])){		//Caso o parametro passado seja f, ele executa essa parte
		executar();
	}

	return EXIT_SUCCESS;
}


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
int menu();

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
/**************************************************************************************************************/
//	Fim do bloco 1
/**************************************************************************************************************/





/**************************************************************************************************************/
//	Bloco 2: destinado as funções relativas ao segundo caminho de execução:
/**************************************************************************************************************/
void executar(){
	cout << "Teste f";
}

/**************************************************************************************************************/
//	Fim do bloco 2
/**************************************************************************************************************/


