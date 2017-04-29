#include <stdio.h>
#include <string.h>

#include <stdexcept>
#include <iostream>
#include <fstream>
#include <iterator>
#include <bitset>

#define MEM_SIZE 		0x0002ffc
#define WORD_SIZE 4

#define MEM_TEXT_BEGIN 	0x00000000
#define MEM_TEXT_END 	0x00000084
#define MEM_DATA_BEGIN 	0x00002000
#define MEM_DATA_END 	0x0002ffc

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

int loadBinFile( std::string, size_t, size_t );

int main( int argc, char* argv[] ) {

	help();

	validateNumInput( argc, 4 );

	std::string fileText = argv[1];
	std::string fileData = argv[2];
	char format = getFormat( *argv[3] );

	int sizeText = 0;
	std::cout << ".text Segment" << '\n';
	sizeText+=loadBinFile( fileText, MEM_TEXT_BEGIN, MEM_TEXT_END );
	dump_mem( 0, sizeText, format );
	std::cout << "Size: " << sizeText << '\n';

	int sizeData = MEM_DATA_BEGIN;
	std::cout << ".data Segment" << '\n';
	sizeData+=loadBinFile( fileText, MEM_DATA_BEGIN, MEM_DATA_END );
	dump_mem( MEM_DATA_BEGIN, sizeData, format );
	std::cout << "Size: " << sizeData << '\n';

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
}

void allocateValueOnMemory( size_t position, int32_t value )
{
	if( position < MEM_SIZE )
		mem[ position ] = value;
}

void dump_mem( size_t start, size_t end, char format )
{
	if( start > end  || end > MEM_SIZE )
	{
		std::cout << "Error with memory dimentions." << '\n';
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

int loadBinFile( std::string fileName, size_t start, size_t end )
{
	std::ifstream myfile; // File stream for reading
	myfile.open ( fileName,  std::ios::in|std::ios::binary );

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
		uint32_t binValue;
		// get file pointer position and shift it from start
		size_t position =  myfile.tellg();
		while( position < fileSize && position <= end )
		{
			// Read binary value from file.
			// Casting as a char* avoids warnings when passing pointer as reference
			myfile.read(reinterpret_cast<char *>(&binValue), WORD_SIZE);
			// ref: http://stackoverflow.com/questions/3595136/c-cout-hex-format

			allocateValueOnMemory( start + position, binValue );

			// Update Positon values
			position += WORD_SIZE;
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
