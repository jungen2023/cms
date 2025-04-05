FROM seacms-app

#安装软件包,openrc开机自启动管理软件
RUN apk add nfs-utils

#挂载磁盘
RUN grep "/var/lib/mysql" /etc/fstab \
    if [ $? -ne 0 ];then \
       echo "nfs-server:/nfsshare/seacms/app /var/www/localhost/htdocs nfs ro,noatime,nofail,_netdev 0 0" >> /etc/fstab \
    fi 

#暴漏端口
EXPOSE 80

#docker运行时执行命令
#CMD ["sh","-c","/run.sh && tail -f /dev/null"]
