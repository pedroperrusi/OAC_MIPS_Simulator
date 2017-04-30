#ifndef CORE_HPP
#define CORE_HPP

#include "headers.hpp"

#define MEM_SIZE 		0x0002ffc
#define WORD_SIZE 		4

#define MEM_TEXT_BEGIN 	0x00000000
#define MEM_TEXT_END 	0x00000084
#define MEM_DATA_BEGIN 	0x00002000
#define MEM_DATA_END 	0x0002ffc

#define CLEAR "clr" 						//Utilize clr caso sistema seja unix
//#define CLEAR "clear"						//Utilize clear caso sistema seja windows

#endif
