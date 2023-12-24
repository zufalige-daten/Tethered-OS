qemu-system-x86_64 -drive file=image/output/boot.img,format=raw -m 8g -boot c -chardev stdio,id=char0,logfile=serial_output.log,signal=off -serial chardev:char0 -d cpu_reset -s -S -M hpet=on -smp 8
