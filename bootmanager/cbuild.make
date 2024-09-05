'bootmanager'

project_root = './'
binary_out = 'bin/bootmanager.elf'
source_dir = 'src'
object_dir = 'obj'
include_dir = 'include'
object_ext = 'o'
object_main = 'multiboot.o'

{
	include_type = 'root'
	include_root = '%%include "%s"'
	source_ext = 'asm'
	compiler_command = 'nasm -F dwarf -g -felf32 -o {output} {input}'
}

{
	include_type = 'lib local'
	include_local = '#include "%s"'
	include_lib = '#include <%s>'
	source_ext = 'c'
	compiler_command = 'i686-elf-gcc -g -c -m32 -o {output} {input} -I {include} -nostdlib -fno-stack-protector -ffreestanding -O2 -Wall -Wextra -fno-exceptions -masm=intel -Wno-unused-parameter'
}

linker_command = 'ld -m elf_i386 -T linker.ld -o {output} {input} -nostdlib'

