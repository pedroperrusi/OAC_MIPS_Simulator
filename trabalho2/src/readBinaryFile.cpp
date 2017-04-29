#include <stdio.h>
#include <string.h>

#include <stdexcept>
#include <iostream>
#include <fstream>
#include <iterator>
#include <bitset>

#define MEM_SIZE 4096
int32_t mem[MEM_SIZE];

void help()
{
	std::cout << "\nThis program is importing MIPS data from binary files\n"
	<<	"Input parameters are:\n"
	<<"\t ./readBinaryFile [filenameText.bin] [filenameData.bin] [output format ('d', ou 'h')]" << "\n\n";
}

void validateNumInput( int nInput, int nExpected )
{
	if( nInput != nExpected )
		throw std::invalid_argument( "Número de parâmetros incorreto." );
}

char getFormat( char format )
{
	if( format != 'h' && format != 'd' )
		throw std::invalid_argument( "O parâmetro format de entrada não era nem 'd' para saídas decimais e nem 'h' para hexadecimais." );

	else return format;
}

void printAddressValues( int32_t, int32_t, char format = 'h' );

void allocateValueOnMemory( size_t, int32_t );

void dump_mem( size_t, size_t, char );

int loadBinFile( std::string );

int main( int argc, char* argv[] ) {

	help();

	validateNumInput( argc, 4 );

	std::string fileText = argv[1];
	std::string fileData = argv[2];
	char format = getFormat( *argv[3] );

	if( format != 'h' && format != 'd' )
	{
		std::cout << "Invalid format input" << '\n';
		return -1;
	}

	int size;

	size = loadBinFile( fileText );
	dump_mem( 0, size, format );
	std::cout << "Size: " << size << '\n';

	return 0;
}

void printAddressValues( int32_t addr, int32_t value, char format )
{
	// Print as Hexadecimal Values (default)
	if( format == 'h' )
		printf("%#010x \t = \t %#010x\n", addr, value );
		// ref: http://stackoverflow.com/questions/14733761/printf-formatting-for-hex
	// Print as Decimal Values
	else if( format == 'd' )
		std::cout << addr << "\t = \t" << value << '\n';
	// Invalid input
	else
		std::cout << "Invalid Formatation Requested." << '\n';
}

void allocateValueOnMemory( size_t position, int32_t value )
{
	if( position < MEM_SIZE )
		mem[ position ] = value;
}

void dump_mem( size_t start, size_t end, char format )
{
	if( start > end || end > MEM_SIZE )
		return;

	uint32_t binValue;
	std::cout << " Memory "<< '\n';
	for( size_t position = start; position < end; position += 4 )
	{
		binValue = mem[ position ];
		// Prnt addresses and their values
		printAddressValues( position, binValue, format );
		// wait key
		getchar();
	}
}

int loadBinFile( std::string fileName )
{
	std::ifstream myfile; // File stream for reading
	myfile.open ( fileName,  std::ios::in|std::ios::binary );

	uint32_t binValue;

	std::streampos fileSize;

	if( myfile.is_open() )
	{
		// Move to the end of the file
		myfile.seekg( 0, std::ios::end );
		// Get file size (get file pointer position at the end = file size)
		fileSize = myfile.tellg();
		// Return to beginning
		myfile.seekg( 0, std::ios::beg );

		// Loop over the file
		size_t position = myfile.tellg();
		while( position < fileSize )
		{
			// Read binary value from file.
			// Cating as a char* avoids warnings when passing pointer as reference
			myfile.read(reinterpret_cast<char *>(&binValue), sizeof(binValue));
			// ref: http://stackoverflow.com/questions/3595136/c-cout-hex-format

			allocateValueOnMemory( position, binValue );

			// Update Positon values
			position = myfile.tellg();
		}

		myfile.close();
	}
	else
	{
		std::cout << "Error when opening file" << '\n';
		return 0;
	}
	return fileSize;
}
