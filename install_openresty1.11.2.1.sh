#!/bin/bash
apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential -y

mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/openresty-1.11.2.1.tar.gz

tar xvzf openresty-1.11.2.1.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/openresty-1.11.2.1
./configure
make
make install

