#!/bin/sh

#挂载磁盘
echo "nfs-server:/nfsshare/seacms/app /var/www/localhost/htdocs nfs ro,noatime,nofail,_netdev 0 0" >> /etc/fstab
mount -a
