#include <stdio.h>
#include <string.h>

#include <iostream>
#include <iterator>
#include <bitset>

// This function was based on: http://stackoverflow.com/questions/16500480/how-do-you-print-out-the-binary-representation-of-a-file

int main() {
    std::istreambuf_iterator< char > in( std::cin ), in_end;
    std::ostream_iterator< std::bitset< 8 > > out( std::cout, " " );
    std::copy( in, in_end, out );
    std::cout << '\n';

		return 0;
}
