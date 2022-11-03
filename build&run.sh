echo "Building Kernel"
cd kernel
nasm -felf32 multiboot.asm -o multiboot.o
g++ -m32 -c kernel.cpp -o kernel.o -ffreestanding -nostdlib -nostdinc -masm=intel -fno-builtin -I../include
ld -m elf_i386 multiboot.o kernel.o -T kernel.ld -o toskern.elf -nostdlib
cd ..
echo "Writing Kernel"
cp kernel/toskern.elf bootdev/root/toskern/toskern.elf
echo "Creating Initial Boot Iso"
cd bootdev
sh makeiso.sh
echo "Writing Tosfs Files"
cd ../
cd tosfsmaker
rm -r imgroot
mkdir imgroot
cp -a ../files/. imgroot/
echo "Creating TOSFS Image"
sh mktosfs.sh
echo "Merging Images"
cd ../
cat bootdev/boot.iso tosfsmaker/tosfs.iso > TetheredOS.iso
echo "Running With Qemu"
qemu-system-x86_64.exe -m 4g -drive file=TetheredOS.iso,format=raw -boot c