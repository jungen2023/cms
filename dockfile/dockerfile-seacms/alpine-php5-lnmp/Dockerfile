FROM alpine:3.6

#配置阿里apk源
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add openrc pwgen \
            mariadb mariadb-client \
            nginx \
            php5 php5-fpm php5-pdo_mysql php5-opcache php5-ctype php5-curl php5-dom php5-iconv php5-gd php5-json php5-mysqli php5-openssl php5-pdo php5-pdo_sqlite php5-sqlite3 php5-xml php5-xmlreader php5-zlib php5-phar php5-posix php5-bz2 php5-zip  #安装php及其拓展

#上传配置文件
ADD nginx_default.conf /etc/nginx/conf.d/default.conf

#上传脚本
ADD run.sh /run.sh
ADD init-mysql.sh /init-mysql.sh
ADD init-php_nginx.sh /init-php_nginx.sh
RUN chmod +x /*.sh

#暴漏端口
EXPOSE 80 3306

#docker运行时执行命令
CMD ["tail", "-f", "/dev/null"]
