#!/bin/sh

if [ -f "/run/nginx" ];then
   php-fpm5 --daemonize
   nginx
else
   /php_nginx0.sh
fi
