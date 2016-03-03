#!/bin/bash
mkdir temp
cd temp
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/nginx-1.8.1.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/pcre-8.10.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/zlib-1.2.7.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/openssl-1.0.1p.tar.gz

tar xvzf nginx-1.8.1.tar.gz -C /usr/local/
tar xvzf pcre-8.10.tar.gz -C /usr/local/
tar xvzf zlib-1.2.7.tar.gz -C /usr/local/
tar xvzf openssl-1.0.1p.tar.gz -C /usr/local/

cd ..
rm -rf temp

cd /usr/local/nginx-1.8.1
./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module --with-http_gzip_static_module --with-pcre=/usr/local/pcre-8.10 --with-openssl=/usr/local/openssl-1.0.1p --with-zlib=/usr/local/zlib-1.2.7
make && make install
