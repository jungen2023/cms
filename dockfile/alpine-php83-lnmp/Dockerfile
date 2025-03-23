FROM alpine

#配置阿里apk源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add --no-cache \
            openrc pwgen \
            mariadb mariadb-client \
            nginx openssl openssl-dev \
            php php-common php-fpm php-opcache php-pdo php-pdo_mysql php-zip php-zlib php-fileinfo php-gd php-mbstring php-iconv php-curl php-openssl php-xml php-simplexml php-dom  #安装php及其拓展

#上传配置文件
ADD nginx_default.conf /etc/nginx/http.d/default.conf

#上传脚本
ADD run.sh /run.sh
ADD mysql0.sh /mysql0.sh
ADD php_nginx0.sh /php_nginx0.sh
RUN chmod +x /*.sh

#暴漏端口
EXPOSE 80 3306

#docker运行时执行命令
CMD ["sh","-c","/run.sh && tail -f /dev/null"]
