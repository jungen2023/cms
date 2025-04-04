#!/bin/sh

mkdir -p /var/lib/mysql /var/www/localhost/htdocs
mount -o ro -t nfs nfs-server:/nfsshare/seacms/app /var/www/localhost/htdocs
mount -o ro -t nfs nfs-server:/nfsshare/seacms/mdb /var/lib/mysql
