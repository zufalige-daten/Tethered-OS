# cd bootsector
# fasm bootsector.asm bootsector.bin || exit
# cd ..
rm -rf temp
mkdir temp
cp -a ../root/. temp/
rm output/boot.img
touch output/boot.img
fallocate -l 2048m output/boot.img
sudo mkfs.vfat -F 32 -n BOOT output/boot.img #--offset 1
../tools/mkfs.tufs output/boot.img -d temp -s 1920m -l system -S 204801 -r 2
LAST_AVL_LOOP=$(sudo losetup -f)
sudo losetup $LAST_AVL_LOOP output/boot.img #--offset 512
mkdir tmp
sudo mount $LAST_AVL_LOOP tmp -o uid=1000,rw
sudo mkdir tmp/boot
sudo mkdir tmp/boot/grub
sudo cat grub.cfg > tmp/boot/grub/grub.cfg
sudo cat ../bootmanager/bin/bootmanager.elf > tmp/boot/bootmanager.elf
sudo grub-install --target=i386-pc --root-directory=tmp --no-floppy --recheck --force $LAST_AVL_LOOP --boot-directory=tmp/boot
sudo umount tmp
sudo losetup -d $LAST_AVL_LOOP
sudo sfdisk output/boot.img < Disk-tables.txt
sudo sfdisk -A output/boot.img 1
sudo sfdisk -l output/boot.img
rm -rf tmp
# ./writeextra
