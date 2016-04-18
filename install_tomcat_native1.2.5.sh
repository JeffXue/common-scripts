#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/apr-1.4.5.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/openssl-1.0.2g.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/tomcat-native-1.2.5-src.tar.gz

tar xvzf apr-1.4.5.tar.gz -C /usr/local/
tar xvzf openssl-1.0.2g.tar.gz -C /usr/local/
tar xvzf tomcat-native-1.2.5-src.tar.gz -C /usr/local/

cd ..
rm -rf temp

apt-get install libapr1-dev libssl-dev -y

cd /usr/local/apr-1.4.5
./configure --prefix=/usr/local/apr
make && make install

cd /usr/local/openssl-1.0.2g
./config --prefix=/usr/local/openssl102g  -fPIC no-gost
make depend
make && make install

cd /usr/local/tomcat-native-1.2.5-src/native
./configure --with-apr=/usr/local/apr --with-ssl=/usr/local/openssl102g --with-java-home=/usr/local/jdk1.7.0_79 --prefix=/usr/local/apache-tomcat-7.0.68
make && make install

cp /usr/local/apache-tomcat-7.0.68/lib/libtcnative-1.* /usr/lib/

