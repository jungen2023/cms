FROM alpine:3.6

#配置阿里apk源
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add openrc pwgen \
            mariadb mariadb-client \
            nginx openssl openssl-dev \
            php7 php7-fpm php7-pdo_mysql php7-mysqli php7-mbstring php7-iconv php7-openssl php7-curl php7-zip php7-opcache php7-gd php7-xml php7-simplexml php7-apcu php7-session php7-json php7-zlib  #安装php及其拓展
RUN apk clean

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
