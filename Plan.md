# Kernel

## Process Manager

### High Level Proccess Manager -> proc/process.h

Sources:
    proc/process.c
    arch/CFG_ARCH/proc/process_switching.asm

Headers:
    proc/process.h

Can create new processes.
Supports automatic memory deallocation.
Can kill old processes.
Can save register state for a specific process.
Can switch out of a process.

proc/process.c, proc/process.h:
    extern ProcessID proc_process(ProcessID parent, ProcessSections process_sections, ProcessFlags flags);
    extern void proc_kill(ProcessID pid);
    extern void proc_enter(ProcessID pid);
    extern void proc_cleanup(ProcessID pid);

arch/CFG_ARCH/proc/process_switching.asm, proc/process.h:
    extern void proc_leave();
    extern void proc_save_state();

### Task Manager -> arch/CFG_ARCH/proc/tss.h, arch/CFG_ARCH/proc/tasks.h.

Sources:
    arch/CFG_ARCH/proc/tss.c
    arch/CFG_ARCH/proc/tss_def.asm
    arch/CFG_ARCH/proc/tasks.c
    arch/CFG_ARCH/proc/tasks_switching.asm

Headers:
    arch/CFG_ARCH/proc/tasks.h
    arch/CFG_ARCH/proc/tss.h

## Memory Manager

### Physical Memory Manager -> mem/palloc.h

Sources:
    mem/palloc.c

Headers:
    mem/palloc.h

Can reserve regions.
Can allocate new page-arrays of a desired size.
Can store allocated page-arrays within a hash map.
Can query the hash map, to allocate new page-arrays within unused gaps, to deallocate old page-arrays.

mem/palloc.c, mem/palloc.h:
    extern PAllocArea *palloc_reserve(void *pptr);
    extern void palloc_delete(PAllocArea *palloc_area);
    extern PAllocArea *palloc_area(size_t n);

### Virtual Memory Manager -> arch/CFG_ARCH/mem/valloc.h

Sources:
    arch/CFG_ARCH/mem/valloc.c

Headers:
    arch/CFG_ARCH/mem/valloc.h

Can reserve regions.
Can allocate new pages of desired size within selected page table.
Can store allocated pages within a hash map.
Can query the hash map, to allocate new pages within unused areas, to deallocated old pages.

arch/CFG_ARCH/mem/valloc.c, arch/CFG_ARCH/mem/valloc.h:
    extern VAllocArea *valloc_reserve(void *vptr, PAllocArea *area, PageTable page_table, VAllocFlags flags);
    extern void valloc_delete(VAllocArea *valloc_area);
    extern VAllocArea *valloc_area(PAllocArea *area, PageTable page_table, VAllocFlags flags);

### Combined Memory Manager -> mem/pvalloc.h

Sources:
    mem/pvalloc.c

Headers:
    mem/pvalloc.h

Can allocate contiguous pages, for a given page table, using flags.

mem/pvalloc.c, mem/pvalloc.h:
    extern void *pvalloc(size_t n, PageTable page_table, VAllocFlags flags);
    extern void pvfree(void *vptr);

### Kernel Memory Manager -> mem/hmalloc.h

Sources:
    mem/hmalloc.c

Headers:
    mem/hmalloc.h

Can allocate arbitrary sized data within kernel page table.
Can allocate arbitrary sized data within some given usermode page table.

mem/hmalloc.c, mem/hmalloc.h:
    extern void *malloc(size_t size);
    extern void *umalloc(size_t size, ProcessID pid);
    extern void free(void *ptr);
    extern void ufree(void *ptr, ProcessID pid);
    extern void *realloc(void *ptr, size_t size);
    extern void *urealloc(void *ptr, size_t size, ProcessID pid);
    extern void *reallocarray(void *ptr, size_t n, size_t size);
    extern void *ureallocarray(void *ptr, size_t n, size_t size, ProcessID pid);

