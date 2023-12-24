'kernel'

project_root = './'
binary_out = 'bin/kernel.bin'
source_dir = 'src'
object_dir = 'obj'
include_dir = 'include'
object_ext = 'o'
object_main = 'arch/boot.o'

{
	include_type = 'lib local'
	include_local = '#include "%s"'
	include_lib = '#include <%s>'
	source_ext = 'c'
	compiler_command = 'x86_64-elf-gcc -g -c -m64 -o {output} {input} -I {include} -nostdlib -fno-stack-protector -ffreestanding -O2 -Wall -Wextra -fno-exceptions -masm=intel -mcmodel=large -Wno-unused-parameter --param=min-pagesize=0 -mno-red-zone'
}

{
	include_type = 'root'
	include_root = '%%include "%s"'
	source_ext = 'asm'
	compiler_command = 'nasm -F dwarf -g -felf64 -o {output} {input}'
}

linker_command = 'ld -m elf_x86_64 -T linker.ld -o {output} {input} -nostdlib && ld -m elf_x86_64 -T debug.ld -o {output}.debug.elf {input} -nostdlib'
