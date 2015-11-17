#!/bin/bash

dpkg -i mysql-5.6.16-debian6.0-x86_64.deb

apt-get install libaio1 libaio-dev -y

apt-get install mysql-client -y

ls -s /opt/mysql/server-5.6/ /usr/local/mysql

cd /opt/mysql/server-5.6

groupadd mysql

useradd -r -g mysql mysql

chown -R mysql .

chgrp -R mysql .

mv /etc/mysql/my.cnf /etc/mysql/my.cnf_backup

scripts/mysql_install_db --user=mysql

chown -R root .

chown -R mysql data

bin/mysqld_safe --user=mysql &

