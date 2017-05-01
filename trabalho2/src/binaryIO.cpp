#include "binaryIO.hpp"

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

void allocateValueOnMemory( int32_t* memptr, size_t position, int32_t value )
{
	std::cout << "allocateValueOnMemory" << '\n';
	if( position < MEM_SIZE )
		memptr[ position ] = value;
	std::cout << "Done" << '\n';
}

int loadBinFile( std::string fileName, int32_t* memptr, size_t start, size_t end )
{
	std::cout << "Load Bin file" << '\n';
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
			std::cout << "Reading file" << '\n';
			// Read binary value from file.
			// Casting as a char* avoids warnings when passing pointer as reference
			myfile.read(reinterpret_cast<char *>(&binValue), WORD_SIZE);
			// ref: http://stackoverflow.com/questions/3595136/c-cout-hex-format

			allocateValueOnMemory( memptr, start + position, binValue );

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
