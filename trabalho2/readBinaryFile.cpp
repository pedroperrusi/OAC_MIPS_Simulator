#include <stdio.h>
#include <string.h>

#include <iostream>
#include <fstream>
#include <iterator>
#include <bitset>

int loadBinFile( std::string, char** );

int main( int argc, char* argv[] ) {

	char * memblock;

	int size;

	size = loadBinFile( argv[1], &memblock );

	std::cout << "Size: " << size << '\n';

	delete[] memblock;

	return 0;
}

int loadBinFile( std::string fileName, char ** memblock )
{
	std::ifstream myfile; // File stream for reading
	myfile.open ( fileName,  std::ios::in|std::ios::binary|std::ios::ate );

	std::streampos size;

	if( myfile.is_open() )
	{
		size = myfile.tellg();
    	*memblock = new char [size];
    	myfile.seekg (0, std::ios::beg);
    	myfile.read (*memblock, size);
    	myfile.close();
    	std::cout << "the entire file content is in memory\n";
	}
	else
	{
		std::cout << "Error when opening" << '\n';
		return 0;
	}
	return size;
}
