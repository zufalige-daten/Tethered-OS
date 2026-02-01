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
    extern pid_t pCreate(pid_t parent, psects_t process_sections, pflags_t flags);
    extern void pKill(pid_t pid);
    extern void pCleanup(pid_t pid);
    extern void pEnter(pid_t pid);

arch/CFG_ARCH/proc/process_switching.asm, proc/process.h:
    extern void pLeave();
    extern void pSave();
    extern void pLoad(pid_t pid);

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
    extern parea_t *paReserve(void *pptr);
    extern void paDelete(parea_t *palloc_area);
    extern parea_t *paAlloc(size_t len);

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
    extern varea_t *vaReserve(void *vptr, parea_t *area, ptab_t page_table, vaflags_t flags);
    extern void vaDelete(varea_t *valloc_area);
    extern varea_t *vaAlloc(parea_t *area, ptab_t page_table, vaflags_t flags);

### Combined Memory Manager -> mem/pvalloc.h

Sources:
    mem/pvalloc.c

Headers:
    mem/pvalloc.h

Can allocate contiguous pages, for a given page table, using flags.

mem/pvalloc.c, mem/pvalloc.h:
    extern void *pvAlloc(size_t len, ptab_t page_table, pvflags_t flags);
    extern void pvFree(void *vptr);

### Kernel Memory Manager -> mem/hmalloc.h

Sources:
    mem/hmalloc.c

Headers:
    mem/hmalloc.h

Can allocate arbitrary sized data within kernel page table.
Can allocate arbitrary sized data within some given usermode page table.

mem/hmalloc.c, mem/hmalloc.h:
    extern void *hMalloc(size_t size);
    extern void *hpMalloc(size_t size, pid_t pid);
    extern void hFree(void *ptr);
    extern void hpFree(void *ptr, pid_t pid);

