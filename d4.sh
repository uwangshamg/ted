#!/bin/sh

fdisk -l | grep /dev/
df -h | grep /dev/

echo 'data  ebs1'

read -p "输入 挂载目录 挂载设备:" num1 num2
dddir=$num1
dddev=$num2

cd /
mkfs.ext4  /dev/${dddev}
mkdir /${dddir} -p
mount /dev/${dddev} /${dddir}
cd /${dddir}
mount | grep /${dddir}
echo hsadgaksjdhaskj > 123
cat 123
cp /etc/fstab /etc/fstab.bak
echo "/dev/${dddev}       /${dddir}        ext4              defaults    0  0"       >> /etc/fstab

df -h | grep /dev/
mount -a
echo ###############################
df -h | grep /dev/

