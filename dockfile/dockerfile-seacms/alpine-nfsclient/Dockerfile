FROM alpine

#配置阿里apk源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    mkdir /nfsshare && \
    chmod -R 777 /nfsshare && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add nfs-utils

#docker运行时执行命令
CMD ["sh","-c","tail -f /dev/null"]
