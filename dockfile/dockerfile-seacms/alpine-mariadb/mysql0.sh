#!/bin/sh

#初始化mysql，指定安装用户及数据库文件目录
rc-status     #检查openrc已安装，生成目录/run/openrc
rc-update add mariadb   #设置开机自启动
touch /run/openrc/softlevel
mysql_install_db --user=mysql --ldata=/var/lib/mysql


#启动mysql
rc-service mariadb start
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

#创建数据库mdb
mysql -uroot -e "create database if not exists mdb"
#设置admin数据库用户密码
PASS=${MYSQL_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${MYSQL_PASS} ] && echo "preset" || echo "random" )
echo "=> Creating MySQL admin user with ${_word} password"
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
mysql -uroot -e "CREATE USER 'admin'@'127.0.0.1' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'127.0.0.1' WITH GRANT OPTION"

#安全的关闭mysql
#mysqladmin -uroot shutdown

#打印admin密码，docker logs CONTAINERID查看设置的admin密码
echo "=> Done!"
echo "========================================================================"
echo "You can now connect to this MySQL Server using:"
echo ""
echo "    mysql -uadmin -p$PASS -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MySQL user 'root' has no password but only allows local connections"
echo "========================================================================"
