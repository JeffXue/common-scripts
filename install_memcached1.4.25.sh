#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/libevent-2.0.22-stable.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/memcached-1.4.25.tar.gz

tar xzf libevent-2.0.22-stable.tar.gz -C /usr/local
tar xzf memcached-1.4.25.tar.gz -C /usr/local/

cd ..
rm -rf temp

apt-get install libsasl2-2 sasl2-bin libsasl2-2 libsasl2-dev libsasl2-modules -y

cd /usr/local/libevent-2.0.22-stable
./configure --prefix=/usr/local/libevent2022
make && make install

cd /usr/local/memcached-1.4.25
./configure --prefix=/usr/local/memcached --enable-sasl --with-libevent=/usr/local/libevent2022
make && make install

