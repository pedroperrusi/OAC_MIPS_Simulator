#include "MIPS_simulador.hpp"

MIPS_simulador::MIPS_simulador( char* fileText, char* fileData )
{
	this -> mips_ = new MIPS_core();
	loadMemory( fileText, fileData );
}

int MIPS_simulador::loadMemory( char* fileText, char* fileData)
{
	this->sizeText = 0;
	this->sizeText += loadBinFile( fileText, mips_->mem, MEM_TEXT_BEGIN, MEM_TEXT_END );
	this->sizeData = MEM_DATA_BEGIN;
	this->sizeData += loadBinFile( fileData, mips_->mem, MEM_DATA_BEGIN, MEM_DATA_END );
	return(true);
}


int MIPS_simulador::menu(){
	int opcao;

	cout << "Defina o numero da opcao desejada:\n";
	cout << "1. step\n\n";
	cout << "2. run\n\n";
	cout << "3. dump_mem\n\n";
	cout << "4. dump_reg\n\n";
	cout << "5. exit\n\n>";

	cin >> opcao;
	this -> limpaTela(0);

	return opcao;
}

void MIPS_simulador::limpaTela(int mode){

	if(mode == 0){									//Limpa a tela sem esperar nada
		//system('clear');

	}else if(mode == 1){							//Espera enter para limpar tela, mostra mensagem pedindo para tecla ser apertada
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		cout << "Pressione ENTER para continuar";
		getchar();
		// system('clear');

	}else if(mode == 2){							//Espera enter para limpar tela, mas nao mostra mensagem
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		getchar();
		// system('clear');
	}
}

void MIPS_simulador::interfaceUsuario(){

	mips_ -> inicializaRegs();
	int opcaoMenu;
	do{
		opcaoMenu = menu();

		switch(opcaoMenu){
			case 1:
				mips_ -> step();
			break;

			case 2:

			break;

			case 3:
				mips_ -> dump_mem( 0, MEM_SIZE, 'h' );
			break;

			case 4:

			break;

			case 5:
				cout << "5- Encerrando programa!\n";
			break;

			default:
				cout << "Opcao digitada invalida! Tente novamente com um valor de 0 a 5!\n";
				limpaTela(1);
		}

	}while(opcaoMenu != 5);
}
