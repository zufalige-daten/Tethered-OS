#include <kernel.h>
#include <stdint.h>
#include <arch/kernel_string.h>
#include <stdarg.h>
#include <arch/serial.h>

int strncmp(const char *strin, const char *strcmp, uint64_t n){
	for(uint64_t i = 0; i < n; i++){
		if(strin[i] != strcmp[i]){
			return 0;
		}
	}
	return 1;
}

uint64_t strlen(const char *str){
	uint64_t ret = 0;
	for(; *str; str++, ret++);
	return ret;
}

char *strrev(char *input, char *output){
	uint64_t len = strlen(input);
	uint64_t i = 0;
	uint64_t z = len;
	for(; i < len; i++){
		output[i] = input[z - 1];
		z--;
	}
	output[i] = '\0';
	return output;
}

const char *ntoh = "0123456789abcdef";

char *u64toh(uint64_t value, char *buffer){
	static char buffer_n[17];
	uint64_t i = 0;
	for(; value != 0; i++){
		buffer_n[i] = ntoh[(value % 16)];
		value /= 16;
	}
	if(i == 0){
		buffer_n[0] = '0';
		i++;
	}
	buffer_n[i] = '\0';
	strrev(buffer_n, buffer);
	return buffer;
}

char *u64tos(uint64_t value, char *buffer){
	static char buffer_n[21];
	uint64_t i = 0;
	for(; value != 0; i++){
		buffer_n[i] = ntoh[(value % 10)];
		value /= 10;
	}
	if(i == 0){
		buffer_n[0] = '0';
		i++;
	}
	buffer_n[i] = '\0';
	strrev(buffer_n, buffer);
	return buffer;
}

void kernel_printf(const char *format, ...){ // note: works over serial, todo: implement working through the display
	va_list args;
	va_start(args, format);
	uint64_t len = strlen(format);
	for(uint64_t i = 0; i < len; i++){
		switch(format[i]){
			case '%':
				i++;
				if(i >= len){
					serial_write_char('%');
					break;
				}
				switch(format[i]){
					case '%':
						serial_write_char('%');
						break;
					case 'c':
						char c = (char)va_arg(args, int);
						serial_write_char(c);
						break;
					case 's':
						char *s = va_arg(args, char *);
						serial_write_string(s);
						break;
					case 'u':
						uint64_t u = va_arg(args, uint64_t);
						char buffer_u[21];
						serial_write_string(u64tos(u, buffer_u));
						break;
					case 'x':
						uint64_t x = va_arg(args, uint64_t);
						char buffer_x[17];
						serial_write_string(u64toh(x, buffer_x));
						break;
					default:
						serial_write_char(format[i]);
						break;
				}
				break;
			default:
				serial_write_char(format[i]);
				break;
		}
	}
}
