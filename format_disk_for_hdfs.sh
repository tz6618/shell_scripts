#!/bin/bash  
#用于生产环境hdfs服务器
#OS version: CentOS7 x86_64
#edit time :2016年1月25日
#Email     :tz6618@163.com
#Used to fomat 10 disks
PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH
mkdir -p /home/hadoop/data_{c,d,e,f,g,h,i,j,k,l}/hdfs
disktags=(c d e f g h i j k l)
for i in ${disktags[*]}
do
echo $i
fdisk /dev/sd$i <<TZ
n
p
1


w
TZ
sleep 2s
mkfs.ext4 /dev/sd${i}1
sleep 2s
uuid=`blkid /dev/sd${i}1 | awk '{print $2}'|awk -F"\"" '{print $2}'`
cat << EXIT > /root/txt
UUID=$uuid /home/hadoop/data_${i} ext4 defaults(rw,noatime,nodiratime,nobarrier) 0 0 
EXIT
cat /root/txt >> /etc/fstab
done

mount -a
