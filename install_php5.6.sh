#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/curl-7.45.0.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/freetype-2.4.0.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/jpegsrc.v9a.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/libpng-1.6.18.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/libmcrypt-2.5.8.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/libiconv-1.14.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/openssl-1.0.1p.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/php-5.6.0.tar.gz

tar -xzf curl-7.45.0.tar.gz -C /usr/local
tar -xzf freetype-2.4.0.tar.gz -C /usr/local
tar -xzf jpegsrc.v9a.tar.gz -C /usr/local
tar -xzf libpng-1.6.18.tar.gz -C /usr/local
tar -xzf libmcrypt-2.5.8.tar.gz -C /usr/local
tar -xzf libiconv-1.14.tar.gz -C /usr/local
tar -xzf openssl-1.0.1p.tar.gz -C /usr/local
tar -xzf php-5.6.0.tar.gz -C /usr/local

cd ..
rm -rf temp

cd /usr/local/curl-7.45.0
./configure --prefix=/usr/local/curl745 --with-ssl
make && make install

cd /usr/local/freetype-2.4.0
./configure --prefix=/usr/local/freetype240
make && make install

cd /usr/local/jpeg-9a
./configure --prefix=/usr/local/jpeg9a
make && make install

cd /usr/local/libpng-1.6.18
./configure --prefix=/usr/local/libpng1618
make && make install

cd /usr/local/libmcrypt-2.5.8
./configure --prefix=/usr/local/libmcrypt258
make && make install

cd /usr/local/libiconv-1.14
./configure --prefix=/usr/local/libiconv114
make && make install

cd /usr/local/openssl-1.0.1p
./config --prefix=/usr/local/openssl101p  -fPIC no-gost
make depend
make && make install

apt-get install libxml2-dev libz-dev -y

cd /usr/local/php-5.6.0
./configure --prefix=/usr/local/php --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib --with-freetype-dir=/usr/local/freetype240 --with-jpeg-dir=/usr/local/jpeg9a --with-png-dir=/usr/local/libpng1618 --enable-fpm --enable-cgi --enable-static --enable-maintainer-zts --enable-inline-optimization --enable-sockets --enable-wddx --enable-zip --enable-calendar --enable-bcmath --enable-ftp --enable-soap --enable-mbstring --disable-ipv6 --disable-debug --with-curl=/usr/local/curl745 --with-mcrypt=/usr/local/libmcrypt258 --with-openssl=/usr/local/openssl101p --with-iconv-dir=/usr/local/libiconv114 --with-apxs2=/usr/local/apache/bin/apxs
make && make install

cp php.ini-production /usr/local/php/lib/php.ini

cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf

groupadd nobody
