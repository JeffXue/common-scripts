#!/bin/bash

echo "Default install mysql-5.6.16-debian6.0-x86_64.deb"
echo "If different, you have to modify the script"

time=`date +%Y%m%d%H%M`

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
