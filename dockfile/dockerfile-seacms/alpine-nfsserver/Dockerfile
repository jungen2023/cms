FROM alpine

#配置阿里apk源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update  #更新使源地址生效

#安装软件包,openrc开机自启动管理软件
RUN apk add openrc nfs-utils rpcbind


#上传脚本
ADD run.sh /run.sh
ADD nfsserver0.sh /nfsserver0.sh
RUN chmod +x /*.sh

#暴漏端口
EXPOSE 111 2049 4046

#docker运行时执行命令
CMD ["sh","-c","/run.sh && tail -f /dev/null"]
