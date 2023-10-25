#include "uart.h"
//we casted the address to avoid the warning of compiler think it is number not address
#define UART0DR *((volatile unsigned int* const)((unsigned int*)0x101f1000))
// the * in first to get the value without it give lvalue error
void uart_send_string (unsigned char* ptr_string){

	while(ptr_string != '\0'){

		UART0DR = (unsigned int)(*ptr_string);  //casting char
		ptr_string++;  // next char

	}
}
