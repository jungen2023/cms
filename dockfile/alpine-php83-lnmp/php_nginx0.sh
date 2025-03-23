#!/bin/sh

#配置动态资源文件
#cat > /var/www/localhost/htdocs/info.php << EOF
#<?php
#phpinfo();
#?>
#EOF

#创建第一个网页"hello world"
#echo "hello world" > /var/www/localhost/htdocs/index.html

adduser -D -g 'www' www
chown -R www:www /etc/nginx
chown -R www:www /var/www
chmod -R 777 /var/www
sed -i 's/user nginx/user www/g' /etc/nginx/nginx.conf
#sed -i 's/;always_populate_raw_post_data/always_populate_raw_post_data/g' /etc/php83/php.ini  #这个配置选项不再被支持,从配置文件中移除

#重启PHP及nginx
killall nginx php-fpm83
#php-fpm83 --daemonize
#nginx
rc-update add php-fpm83  #开机自启动php-fpm
rc-update add nginx     #开机自启动nginx
rc-service php-fpm83 start
rc-service nginx start
