#!/bin/sh

if [ ! -f "/run/openrc/softlevel" ];then
   /init-mysql.sh
   /init-php_nginx.sh
else
   killall nginx php-fpm5
   rc-service mariadb restart
   php-fpm5 --daemonize
   nginx
fi
