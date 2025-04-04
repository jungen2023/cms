#!/bin/sh

#创建共享目录并设置权限
mkdir /nfsshare
chmod -R 777 /nfsshare
echo '/nfsshare   10.0.0.0/8(rw,sync,no_root_squash)' >> /etc/exports

#启动服务
rc-status     #检查openrc已安装，生成目录/run/openrc
touch /run/openrc/softlevel
rc-update add rpcbind   #设置开机自启动
rc-update add nfs
rc-service rpcbind start #启动服务
rc-service nfs start
