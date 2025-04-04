#!/bin/sh

if [ ! -f "/run/openrc/softlevel" ];then
   /nfsserver0.sh
else
   rc-service rpcbind restart
   rc-service nfs restart
fi
