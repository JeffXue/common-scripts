#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/redis-2.8.17.tar.gz

tar xvzf redis-2.8.17.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/redis-2.8.17
make

mkdir /usr/local/redis
cp redis.conf /usr/local/redis
cd src
cp redis-benchmark redis-server redis-cli  /usr/local/redis
