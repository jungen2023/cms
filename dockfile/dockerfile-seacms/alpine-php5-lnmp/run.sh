#!/bin/sh

rc-service mariadb restart
php-fpm5 --daemonize
nginx
