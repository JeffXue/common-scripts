#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/LuaJIT-2.1.0-beta2.tar.gz

tar xzf LuaJIT-2.1.0-beta2.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/LuaJIT-2.1.0-beta2
make
make install

ln -sf /usr/local/bin/luajit-2.1.0-beta2 /usr/local/bin/luajit
