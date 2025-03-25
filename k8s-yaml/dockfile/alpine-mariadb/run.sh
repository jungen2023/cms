#!/bin/sh

if [ -f "/run/openrc/softlevel" ];then
   rc-service mariadb restart
fi
