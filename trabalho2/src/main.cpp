#include "headers.hpp"
#include "core.hpp"
#include "MIPS_simulador.hpp"

int main(int argc, char *argv[])
{
	string paramP("p");
	string paramF("f");

	MIPS_simulador simulador( argv[1], argv[2] );

  	if(!paramP.compare(argv[3])){			//Caso o parametro passado seja p
		simulador.interfaceUsuario();

	}else if(!paramF.compare(argv[3])){		//Caso o parametro passado seja f

		simulador.run();
		std::cout << "Gerando arquivos mem.txt e reg.txt..." << '\n';
		freopen("mem.txt","w",stdout);
	    	simulador.dump_mem( 'f' );
		fclose (stdout);

		freopen("reg.txt","w",stdout);
	    	simulador.dump_reg( 'f' );
		fclose (stdout);
	}

	return EXIT_SUCCESS;

}
