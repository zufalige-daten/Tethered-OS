# cd bootsector
# fasm bootsector.asm bootsector.bin || exit -1
# cd ..
rm -rf temp || exit -1
mkdir temp || exit -1
cp -a ../root/. temp/ || exit -1
rm output/boot.img || exit -1
touch output/boot.img || exit -1
fallocate -l 2048m output/boot.img || exit -1
mkfs.vfat -F 32 -n BOOT output/boot.img || exit -1 #--offset 1
../tools/mkfs.tufs output/boot.img -d temp -s 1920m -l system -S 204801 -r 2 || exit -1
LAST_AVL_LOOP=$(sudo losetup -f) || exit -1
sudo losetup $LAST_AVL_LOOP output/boot.img || exit -1 #--offset 512
mkdir tmp
sudo mount $LAST_AVL_LOOP tmp -o uid=1000,rw || exit -1
mkdir tmp/boot
mkdir tmp/boot/grub
cat grub.cfg > tmp/boot/grub/grub.cfg
cat ../bootmanager/bin/bootmanager.elf > tmp/boot/bootmanager.elf
sudo grub-install --target=i386-pc --root-directory=tmp --no-floppy --recheck --force $LAST_AVL_LOOP --boot-directory=tmp/boot || exit -1
sudo umount tmp
sudo losetup -d $LAST_AVL_LOOP
echo -n "$(sfdisk -q output/boot.img < Disk-tables.txt)" || exit -1
sfdisk -q -A output/boot.img 1 || exit -1
rm -rf tmp
# ./writeextra

