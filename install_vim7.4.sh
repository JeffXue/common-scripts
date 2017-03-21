#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/ncurses-6.0.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/readline-6.3.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/lua-5.3.2.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/vim-7.4.tar.bz2

tar xzf ncurses-6.0.tar.gz -C /usr/local/
tar xzf readline-6.3.tar.gz -C /usr/local/
tar xzf lua-5.3.2.tar.gz -C /usr/local/
tar xjf vim-7.4.tar.bz2 -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/ncurses-6.0
./configure
make && make install

cd /usr/local/readline-6.3
./configure
make && make install

cd /usr/local/lua-5.3.2
make linux
make install

cd /usr/local/vim74
./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-luainterp --with-lua-prefix=/usr/local
make && make install

