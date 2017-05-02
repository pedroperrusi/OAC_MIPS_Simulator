#ifndef BINARYIO_HPP
#define BINARYIO_HPP

#include "headers.hpp"
#include "MIPS_core.hpp"

void printAddressValues( int32_t, int32_t, char format = 'h' );

void allocateValueOnMemory( int32_t*, size_t, int32_t );

int loadBinFile( char*, int32_t*, size_t, size_t );

#endif
