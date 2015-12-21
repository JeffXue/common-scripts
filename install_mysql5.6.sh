#!/bin/bash
time=`date +%Y%m%d%H%M`

ftp_server=192.168.1.113
ftp_user=admin
ftp_password=123456

ftp_response=`ftp -n -v << EOF 2>&1
open $ftp_server
user $ftp_user $ftp_password
get mysql-5.6.16-debian6.0-x86_64.deb
bye
EOF`

dpkg -i mysql-5.6.16-debian6.0-x86_64.deb

apt-get install libaio1 libaio-dev -y

apt-get install mysql-client -y

ln -s /opt/mysql/server-5.6/ /usr/local/mysql

mv /etc/mysql/my.cnf /etc/mysql/my.cnf_$time

cp my.cnf /usr/local/mysql/

cd /usr/local/mysql

groupadd mysql

useradd -r -g mysql mysql

chown -R mysql .

chgrp -R mysql .

scripts/mysql_install_db --user=mysql

chown -R root .

chown -R mysql data

./bin/mysqld_safe --user=mysql &

echo "please run the mysql_init.sql!"

