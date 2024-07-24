#include <kernel.h>
#include <stdint.h>
#include <stddef.h>

extern int strncmp(const char *strin, const char *strcmp, size_t n);

extern size_t strlen(const char *str);

extern char *strrev(char *input, char *output);

extern char *u64toh(size_t value, char *buffer);

extern char *u64tos(size_t value, char *buffer);

extern void kernel_printf(const char *format, ...);
