cd src
nasm -fbin bootld.asm -o bootld.bin
g++ kernel.cpp -m64 -o kernel.elf -ffreestanding -nostdlib -nostdinc -masm=intel -fno-builtin
objcopy -O binary kernel.elf kernel.bin --set-start 0x7e00 --only-section=.text --only-section=.rodata --only-section=.data
cd ..
cat src/bootld.bin src/kernel.bin > bin/boot_nofs.img
fallocate -l 5KiB bin/boot_nofs.img
nasm -fbin paddingforfs.asm -o paddingforfs.bin
cat bin/boot_nofs.img paddingforfs.bin > bin/boot.img
qemu-system-x86_64.exe -drive file=bin/boot.img,format=raw -boot c -m 8g