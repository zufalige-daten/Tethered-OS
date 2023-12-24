#pragma once

#include <kernel.h>
#include <x86_64/x86io.h>

extern uint32_t pcistd_readconfig_reg(uint8_t offset, uint8_t bus, uint8_t slot, uint8_t function);

extern uint32_t pcistd_checkvendor(uint8_t bus, uint8_t slot);

extern void pcistd_checkdevice(uint8_t bus, uint8_t device);

extern void pcistd_checkbuses(void);

extern void pcistd_checkbus(uint8_t bus);

extern void pcistd_checkfunction(uint8_t bus, uint8_t device, uint8_t function);
