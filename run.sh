qemu-system-x86_64 -drive file=image/output/boot.img,format=raw -m 8g -boot c -chardev stdio,id=char0,logfile=serial_output.log,signal=off -serial chardev:char0 -d int,cpu_reset --no-reboot -M hpet=on # -smp 8

