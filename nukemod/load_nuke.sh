sudo rmmod nuke
sudo rm /dev/nuke_channel

make clean
make

sudo insmod nuke.ko
sudo mknod /dev/nuke_channel c 511 0