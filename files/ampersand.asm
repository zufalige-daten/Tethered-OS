use32
org 0x4105840

jmp _hstart
_funlist: dd 0
_ret: dd 0
_hstart:
pop eax
pop dword [_funlist] ; pop needed function list
pop dword [_ret] ; pop needed return address
jmp _start

_msg: db "Hello World!", 10, 0
puts equ (3*4)

_start:
    sub esp, 8
    push 0
    push _msg
    mov esi, dword [_funlist]
    mov eax, dword [esi+puts]
    call eax
    add esp, 16
    mov eax, dword [_ret]
    jmp eax