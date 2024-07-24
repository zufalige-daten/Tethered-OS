#include <kernel.h>
#include <stdint.h>
#include <arch/kernel_string.h>
#include <stdarg.h>
#include <arch/serial.h>
#include <stddef.h>

int strncmp(const char *strin, const char *strcmp, size_t n){
	for(size_t i = 0; i < n; i++){
		if(strin[i] != strcmp[i]){
			return 0;
		}
	}
	return 1;
}

size_t strlen(const char *str){
	size_t ret = 0;
	for(; *str; str++, ret++);
	return ret;
}

char *strrev(char *input, char *output){
	size_t len = strlen(input);
	size_t i = 0;
	size_t z = len;
	for(; i < len; i++){
		output[i] = input[z - 1];
		z--;
	}
	output[i] = '\0';
	return output;
}

const char *ntoh = "0123456789abcdef";

char *u64toh(size_t value, char *buffer){
	static char buffer_n[17];
	size_t i = 0;
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

char *u64tos(size_t value, char *buffer){
	static char buffer_n[21];
	size_t i = 0;
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
	size_t len = strlen(format);
	for(size_t i = 0; i < len; i++){
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
						size_t u = va_arg(args, size_t);
						char buffer_u[21];
						serial_write_string(u64tos(u, buffer_u));
						break;
					case 'x':
						size_t x = va_arg(args, size_t);
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
