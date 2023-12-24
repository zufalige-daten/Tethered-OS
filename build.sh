echo "-------- bootmanager --------"
cd bootmanager
cbuild || exit
cd ..

echo "-------- kernel --------"
cd kernel
cbuild || exit
cd ..

echo "-------- setting up root --------"
cp kernel/bin/kernel.bin root/system/kernel.bin

echo "-------- makeimage.sh --------"
cd image
sh makeimage.sh
cd ..

echo "-------- done --------"
