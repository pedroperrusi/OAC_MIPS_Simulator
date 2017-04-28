#include <stdio.h>
#include <string.h>

#include <iostream>
#include <fstream>
#include <iterator>
#include <bitset>

#define MEM_SIZE 4096
int32_t mem[MEM_SIZE];

int loadBinFile( std::string );

void dump_mem(/* int start int end char format */);

int main( int argc, char* argv[] ) {

	if( argc == 1 )
		return 0;

//	char * memblock;
	int size;

	size = loadBinFile( argv[1] );

	std::cout << "Size: " << size << '\n';

	//dump_mem();

//	delete[] memblock;

	return 0;
}

int loadBinFile( std::string fileName )
{
	std::ifstream myfile; // File stream for reading
	myfile.open ( fileName,  std::ios::in|std::ios::binary );

	uint32_t a;

	std::streampos size;

	if( myfile.is_open() )
	{
		// Move to the end of the file
		myfile.seekg( 0, std::ios::end );
		// Get file size
		size = myfile.tellg();
		// Return to beginning
		myfile.seekg( 0, std::ios::beg );
		std::cout << "Memory" << '\n';
		while( myfile.tellg() < size )
		{
			myfile.read(reinterpret_cast<char *>(&a), sizeof(a));
			std::cout << std::bitset<32>(myfile.tellg()) << "\t = \t" << std::bitset<32>(a) << '\n';
			getchar();
		}
		myfile.close();
	}
	else
	{
		std::cout << "Error when opening file" << '\n';
		return 0;
	}
	return size;
}

// void dump_mem(/* int start int end char format */)
// {
// 	std::bitset<MEM_SIZE> bits((std::string(memblock)));
// 	std::cout << "Raw memory Loaded:\n"<< bits << '\n';
// }
