#include "MIPS_simulador.hpp"

MIPS_simulador::MIPS_simulador( char* fileText, char* fileData )
{
	this -> mips_ = new MIPS_core();
	loadMemory( fileText, fileData );
}

int MIPS_simulador::loadMemory( char* fileText, char* fileData)
{
	mips_->sizeText = 0;
	mips_->sizeText += loadBinFile( fileText, mips_->mem, MEM_TEXT_BEGIN, MEM_SIZE);
	mips_->sizeData = MEM_DATA_BEGIN;
	mips_->sizeData += loadBinFile( fileData, mips_->mem, MEM_DATA_BEGIN, MEM_SIZE );
	return(true);
}


int MIPS_simulador::menu(){
	limpaTela(0);

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
		system("clear");

	}else if(mode == 1){							//Espera enter para limpar tela, mostra mensagem pedindo para tecla ser apertada
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		cout << "Pressione ENTER para continuar";
		getchar();
		system("clear");

	}else if(mode == 2){							//Espera enter para limpar tela, mas nao mostra mensagem
		while (getchar() != '\n');					//Limpa o buffer no caso de mais de um char armazenado
		getchar();
		system("clear");
	}
}

void MIPS_simulador::interfaceUsuario(){

	mips_ -> inicializaRegs();
	int opcaoMenu;
	do{
		opcaoMenu = menu();

		switch(opcaoMenu){
			case 1:
				this -> step();
			break;

			case 2:
				this -> run();
			break;

			case 3:
				this -> dump_mem();
			break;

			case 4:
				this -> dump_reg();
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

void MIPS_simulador::step()
{
	limpaTela(0);
	std::cout <<
				"Essa função executa uma instrução no MIPS.\n"
				"Realiza, portanto, uma chamada das funções internas:\n\t"
				"fetch(), decode(), execute()\n"
	<< std::endl;
	mips_->step();
	limpaTela(1);
}

void MIPS_simulador::run()
{
	limpaTela(0);
	std::cout <<
				"Essa função executa o programa inteiramente através de repetidos step().\n"
				"Esta função chegará ao fim com uma chamada syscall de encerramento, ou ao acabarem as instruções.\n"
	<< std::endl;
	mips_ -> run();
	limpaTela(1);
}

void MIPS_simulador::dump_mem( char param )
{
	if( param == 'f' )
		mips_ -> dump_mem( MEM_TEXT_BEGIN, MEM_SIZE, 'h' );
	else
	{
		limpaTela(0);
		std::cout <<
					"Essa função imprime o conteúdo da memória a partir do endereço start até o endereço end.\n"
					"O formato pode ser em hexa (‘h’) ou decimal (‘d’).\n"
		<< std::endl;

		int start, end;
		char formato;
		do
		{
			std::cout << "Insira o valor de início de impressão:" << '\n';
			cin >> start;
		}while( start < MEM_TEXT_BEGIN || start > MEM_SIZE );
		do {
			std::cout << "Insira o valor de fim:" << '\n';
			cin >> end;
		} while( end < start || start > MEM_SIZE );
		do {
			std::cout << "Insira o formato desejado ('h' ou 'd'):" << '\n';
			cin >> formato;
		} while( formato != 'h' && formato != 'd' );

		mips_ -> dump_mem( start, end, formato );
		limpaTela(1);
	}
}

void MIPS_simulador::dump_reg( char param )
{
	if( param == 'f' )
		mips_ -> dump_reg( 'h' );
	else
	{
		limpaTela(0);
		std::cout <<
					"Essa função imprime o conteúdo da memória a partir do endereço start até o endereço end.\n"
					"O formato pode ser em hexa (‘h’) ou decimal (‘d’).\n"
		<< std::endl;
		char formato;
		do {
			std::cout << "Insira o formato desejado ('h' ou 'd'):" << '\n';
			cin >> formato;
		} while( formato != 'h' && formato != 'd' );
		mips_ -> dump_reg(formato);
		limpaTela(1);
	}
}
