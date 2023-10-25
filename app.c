#include "uart.h"
unsigned char string_buffer[100] = "learn-in-depth:<Youssef-Wahiid>";
unsigned const char string_buffer_const[100] = "Constant";  // .rodata appear in bash


void main (void){
	
	uart_send_string(string_buffer) ;
			
}
