#!/bin/sh

#挂载磁盘
echo "nfs-server:/nfsshare/seacms/mdb /var/lib/mysql nfs ro,noatime,nofail,_netdev 0 0" >> /etc/fstab
mount -a
