echo "-------- bootmanager --------"
cd bootmanager
cbuild || exit -1
cd ..

echo "-------- kernel --------"
cd kernel
cbuild || exit -1
cd ..

echo "-------- setting up root --------"
cp kernel/bin/kernel.bin root/system/kernel.bin || exit -1

echo "-------- makeimage.sh --------"
cd image
sh makeimage.sh || exit -1
cd ..

echo "-------- done --------"

