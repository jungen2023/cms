#!/bin/sh

if [ -f "/run/openrc/softlevel" ];then
   php-fpm5 --daemonize
   nginx
fi
