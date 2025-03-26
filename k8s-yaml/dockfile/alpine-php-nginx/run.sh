#!/bin/sh

if [ -f "/run/nginx" ];then
   php-fpm5 --daemonize
   nginx
fi
