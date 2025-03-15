# cms

#### 介绍
内容管理系统（Content Management System，CMS）是一种用于创建、编辑、管理和发布数字内容的软件系统，尤其适用于网站建设。

#### 软件架构
软件架构说明：lnmp/lamp


#### 安装教程

1.  将docker基础镜像导入本地
    `docker load < docker-images/alpine.v3.6.tar.gz`
    查看导入结果
    `docker images` 
2.  执行dockerfile，生成lnmp镜像   
    `cd dockfile/dockerfile-seacms/alpine-php5-lnmp/ && docker build -t alpine-php5-lnmp ./`  
    查看结果:`docker images`  
    清理构建缓存:`docker builder prune`
3.  运行容器  
    `docker run -d -t -p 2006:3306 -p 2080:80 -v /data/mdb:/var/lib/mysql -v /data/app:/var/www/localhost/htdocs --name seacms alpine-php5-lnmp /bin/sh`
    查看容器运行状态：`docker ps -a` 
    没问题后执行下一步 
4.  初始化容器  
    登录容器：`docker exec -it seacms /bin/sh` 
    初始化：`run.sh` 
    记录mysql的用户密码  
5.  将app包解压到/data/app中 
    `cd www/ && unzip seacms-13.zip`  
    将upload文件夹里的文件全部复制到/data/app下  
    `chmod -R 777 /data/app`  
6.  安装SeaCms  
    - 运行http://域名/install/index.php进行程序安装，填写mysql用户密码 
    - 安装完毕后为了安全请删除安装目录（install） 

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  [SeaCMS官方指南](https://www.seacms.com/doc.htm)


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
