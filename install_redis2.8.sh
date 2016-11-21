#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/redis-2.8.24.tar.gz

tar xzf redis-2.8.24.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/redis-2.8.24
make

mkdir /usr/local/redis
cp redis.conf sentinel.conf /usr/local/redis
cd src
cp redis-benchmark redis-server redis-cli redis-sentinel /usr/local/redis
