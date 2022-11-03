loopdev=loop2
sudo cp blank.iso boot.iso
sudo losetup /dev/${loopdev} boot.iso
sudo mkfs.vfat -F 32 /dev/${loopdev}
sudo mount -o uid=1000,gid=1000 /dev/${loopdev} temp
cp -a root/. temp/
sudo grub-install --root-directory=temp --no-floppy --recheck --force /dev/${loopdev} --boot-directory=temp
sudo umount temp
sudo losetup -d /dev/${loopdev}