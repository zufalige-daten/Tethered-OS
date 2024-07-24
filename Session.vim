let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/Tethered\ OS
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 kernel/src/kernel.c
badd +4 compile_flags.txt
badd +37 kernel/include/memory/pmemalloc.h
badd +1 kernel/src/memory/pmemalloc.c
badd +1 kernel/src/arch/boot.asm
badd +90 kernel/src/arch/arch_setup.c
badd +19 ~/.vimrc
badd +1 kernel/src/memory/pmemalloc.c.old
badd +1 kernel/include/memory/vmemalloc.h
badd +1 kernel/include/arch/paging.h
badd +12 kernel/src/arch/paging.c
badd +5 kernel/include/arch/fast_memcpy.h
badd +35 kernel/include/kernel.h
badd +378 bootmanager/src/boot.c
badd +1 bootmanager/include/x86_64/pio.h
badd +1 bootmanager/src/pio.c
badd +1 bootmanager/src/tufs.c
badd +72 bootmanager/include/filesystem/tufs.h
badd +1 bootmanager/src/multiboot.asm
badd +1 bootmanager/src/
badd +34 kernel/include/x86_64/idt.h
badd +1 kernel/src/arch/interupts.h
badd +1 kernel/src/arch/interupts.c
badd +1 kernel/include/arch/interupts.h
badd +29 kernel/src/x86_64/idt.c
badd +50 kernel/src/x86_64/isr_wrappers.asm
badd +265 kernel/include/x86_64/isr_wrappers.h
badd +37 kernel/include/x86_64/gdt.h
badd +1 kernel/src/arch/interrupts.c
badd +19 kernel/include/arch/interrupts.h
badd +26 kernel/cbuild.make
badd +1 kernel/src/arch/syscalls.c
badd +1 kernel/include/arch/syscalls.h
badd +1 kernel/include/arch/arch_setup.h
badd +1 kernel/include/x86_64/tss.h
badd +1 kernel/src/x86_64/tss.c
badd +1 kernel/src/x86_64/gdt.c
badd +12 kernel/src/arch/tasksw.c
badd +35 kernel/src/x86_64/task.asm
badd +1 kernel/include/arch/task.h
badd +1 kernel/include/arch/tasksw.h
badd +1 kernel/src/memory/vmemalloc.c
badd +1 kernel/src/arch/testuf.asm
badd +0 term://~/Desktop/Tethered\ OS//5290:/bin/bash
badd +0 term://~/Desktop/Tethered\ OS//8027:/bin/bash
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit kernel/src/kernel.c
argglobal
let s:l = 61 - ((40 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 61
normal! 0
tabnext
argglobal
if bufexists(fnamemodify("term://~/Desktop/Tethered\ OS//5290:/bin/bash", ":p")) | buffer term://~/Desktop/Tethered\ OS//5290:/bin/bash | else | edit term://~/Desktop/Tethered\ OS//5290:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~/Desktop/Tethered\ OS//5290:/bin/bash
endif
balt term://~/Desktop/Tethered\ OS//5290:/bin/bash
let s:l = 6289 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6289
normal! 0
tabnext
argglobal
if bufexists(fnamemodify("term://~/Desktop/Tethered\ OS//8027:/bin/bash", ":p")) | buffer term://~/Desktop/Tethered\ OS//8027:/bin/bash | else | edit term://~/Desktop/Tethered\ OS//8027:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~/Desktop/Tethered\ OS//8027:/bin/bash
endif
balt term://~/Desktop/Tethered\ OS//8027:/bin/bash
let s:l = 575 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 575
normal! 050|
tabnext
edit kernel/src/arch/tasksw.c
argglobal
balt kernel/src/kernel.c
let s:l = 12 - ((11 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 03|
tabnext
edit kernel/src/arch/testuf.asm
argglobal
balt kernel/src/arch/tasksw.c
let s:l = 4 - ((3 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 09|
tabnext
edit kernel/include/arch/tasksw.h
argglobal
balt kernel/src/arch/tasksw.c
let s:l = 6 - ((5 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 0
tabnext
edit kernel/include/x86_64/gdt.h
argglobal
let s:l = 43 - ((42 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 43
normal! 0
tabnext
edit kernel/src/arch/interrupts.c
argglobal
balt kernel/src/arch/interupts.c
let s:l = 176 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 176
normal! 0
tabnext
edit kernel/src/arch/syscalls.c
argglobal
balt kernel/src/arch/interrupts.c
let s:l = 14 - ((13 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
tabnext
edit kernel/src/arch/arch_setup.c
argglobal
balt kernel/src/kernel.c
let s:l = 90 - ((44 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 90
normal! 0
tabnext
edit kernel/src/x86_64/tss.c
argglobal
balt kernel/src/arch/arch_setup.c
let s:l = 11 - ((10 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 0
tabnext
edit kernel/include/x86_64/tss.h
argglobal
let s:l = 36 - ((35 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 36
normal! 0
tabnext
edit kernel/src/arch/boot.asm
argglobal
balt kernel/include/memory/pmemalloc.h
let s:l = 35 - ((34 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 35
normal! 0
tabnext 4
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
