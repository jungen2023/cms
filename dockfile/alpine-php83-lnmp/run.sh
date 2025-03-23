#!/bin/sh

if [ -f "/run/openrc/softlevel" ];then
   rc-service mariadb restart
   rc-service php-fpm83 restart
   rc-service nginx restart
fi
