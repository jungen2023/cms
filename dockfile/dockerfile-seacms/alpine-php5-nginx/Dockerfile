FROM alpine:3.6

#配置阿里apk源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add openrc \
            nginx openssl openssl-dev \
            php5 php5-fpm php5-pdo_mysql php5-mysqli php5-iconv php5-openssl php5-curl php5-zip php5-opcache php5-gd php5-xml php5-json php5-zlib  #安装php及其拓展

#上传配置文件
ADD nginx_default.conf /etc/nginx/conf.d/default.conf

#上传脚本
ADD run.sh /run.sh
ADD php_nginx0.sh /php_nginx0.sh
RUN chmod +x /*.sh

#暴漏端口
EXPOSE 80

#docker运行时执行命令
CMD ["sh","-c","/run.sh && tail -f /dev/null"]
