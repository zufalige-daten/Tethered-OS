#pragma once

#include <kernel.h>
#include <x86_64/tss.h>

extern void switch_task(regs_t *regs);
