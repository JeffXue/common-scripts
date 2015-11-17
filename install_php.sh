#!/bin/bash

tar -xvzf curl-7.45.0.tar.gz -C /usr/local
tar -xvzf freetype-2.4.0.tar.gz -C /usr/local
tar -xvzf jpegsrc.v9a.tar.gz -C /usr/local
tar -xvzf libpng-1.6.18.tar.gz -C /usr/local
tar -xvzf libmcrypt-2.5.8.tar.gz -C /usr/local
tar -xvzf php-5.6.0.tar.gz -C /usr/local

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

cd /usr/local/php-5.6.0
./configure --prefix=/usr/local/php --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib --with-freetype-dir=/usr/local/freetype --with-jpeg-dir=/usr/local/jpeg --with-png-dir=/usr/local/libpng --enable-fpm --enable-cgi --enable-static --enable-maintainer-zts --enable-inline-optimization --enable-sockets --enable-wddx --enable-zip --enable-calendar --enable-bcmath --enable-ftp --enable-soap --enable-mbstring --disable-ipv6 --disable-debug --with-curl=/usr/local/curl --with-mcrypt=/usr/local/libmcrypt --with-openssl=/usr/local/openssl --with-iconv-dir=/usr/local/libiconv --with-apxs2=/usr/local/apache/bin/apxs
make && make install

cp php.ini-development /usr/local/php/lib

cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf

