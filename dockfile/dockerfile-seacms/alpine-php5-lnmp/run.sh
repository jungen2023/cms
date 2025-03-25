#!/bin/sh

if [ -f "/run/openrc/softlevel" ];then
   rc-service mariadb restart
   php-fpm5 --daemonize
   nginx
fi
