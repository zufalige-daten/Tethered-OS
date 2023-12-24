#include <kernel.h>
#include <stdint.h>

extern int strncmp(const char *strin, const char *strcmp, uint64_t n);

extern uint64_t strlen(const char *str);

extern char *strrev(char *input, char *output);

extern char *u64toh(uint64_t value, char *buffer);

extern char *u64tos(uint64_t value, char *buffer);

extern void kernel_printf(const char *format, ...);
