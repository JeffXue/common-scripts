#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/apr-1.4.5.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/apr-util-1.3.12.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/pcre-8.10.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/zlib-1.2.7.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/openssl-1.0.1p.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/httpd-2.4.3.tar.gz

tar xvzf apr-1.4.5.tar.gz -C /usr/local/
tar xvzf apr-util-1.3.12.tar.gz -C /usr/local/
tar xvzf pcre-8.10.tar.gz -C /usr/local/
tar xvzf zlib-1.2.7.tar.gz -C /usr/local/
tar xvzf openssl-1.0.1p.tar.gz -C /usr/local/
tar xvzf httpd-2.4.3.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/apr-1.4.5
./configure --prefix=/usr/local/apr145
make && make install

cd /usr/local/apr-util-1.3.12
./configure --prefix=/usr/local/apr-util1312 --with-apr=/usr/local/apr145
make && make install

cd /usr/local/pcre-8.10
./configure --prefix=/usr/local/pcre810
make && make install

cd /usr/local/zlib-1.2.7
./configure --prefix=/usr/local/zlib127
make && make install

cd /usr/local/openssl-1.0.1p
./config --prefix=/usr/local/openssl101p  -fPIC no-gost
make depend
make && make install

cd /usr/local/httpd-2.4.3
./configure --prefix=/usr/local/apache  --enable-mods-shared=all --enable-ssl --enable-proxy-http --enable-expires -enable-deflate --enable-dav --with-apr=/usr/local/apr145 --with-apr-util=/usr/local/apr-util1312 --with-z=/usr/local/zlib127 --with-pcre=/usr/local/pcre810 --with-ssl=/usr/local/openssl101p --with-mpm=event
make && make install

