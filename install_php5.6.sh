#!/bin/bash
mkdir temp
cd temp
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/curl-7.45.0.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/freetype-2.4.0.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/jpegsrc.v9a.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/libpng-1.6.18.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/libmcrypt-2.5.8.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/libiconv-1.14.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/openssl-1.0.1p.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/php-5.6.0.tar.gz

tar -xvzf curl-7.45.0.tar.gz -C /usr/local
tar -xvzf freetype-2.4.0.tar.gz -C /usr/local
tar -xvzf jpegsrc.v9a.tar.gz -C /usr/local
tar -xvzf libpng-1.6.18.tar.gz -C /usr/local
tar -xvzf libmcrypt-2.5.8.tar.gz -C /usr/local
tar -xvzf libiconv-1.14.tar.gz -C /usr/local
tar -xvzf openssl-1.0.1p.tar.gz -C /usr/local
tar -xvzf php-5.6.0.tar.gz -C /usr/local

cd ..
rm -rf temp

cd /usr/local/curl-7.45.0
./configure --prefix=/usr/local/curl --with-ssl
make && make install

cd /usr/local/freetype-2.4.0
./configure --prefix=/usr/local/freetype
make && make install

cd /usr/local/jpeg-9a
./configure --prefix=/usr/local/jpeg
make && make install

cd /usr/local/libpng-1.6.18
./configure --prefix=/usr/local/libpng
make && make install

cd /usr/local/libmcrypt-2.5.8
./configure --prefix=/usr/local/libmcrypt
make && make install

cd /usr/local/libiconv-1.14.tar.gz
./configure --prefix=/usr/local/libiconv
make && make install

cd /usr/local/openssl-1.0.1p
./config --prefix=/usr/local/openssl  -fPIC no-gost
make depend
make && make install

apt-get install libxml2-dev libz-dev -y

cd /usr/local/php-5.6.0
./configure --prefix=/usr/local/php --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib --with-freetype-dir=/usr/local/freetype --with-jpeg-dir=/usr/local/jpeg --with-png-dir=/usr/local/libpng --enable-fpm --enable-cgi --enable-static --enable-maintainer-zts --enable-inline-optimization --enable-sockets --enable-wddx --enable-zip --enable-calendar --enable-bcmath --enable-ftp --enable-soap --enable-mbstring --disable-ipv6 --disable-debug --with-curl=/usr/local/curl --with-mcrypt=/usr/local/libmcrypt --with-openssl=/usr/local/openssl --with-iconv-dir=/usr/local/libiconv --with-apxs2=/usr/local/apache/bin/apxs
make && make install

cp php.ini-production /usr/local/php/lib/php.ini

cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf

groupadd nobody
