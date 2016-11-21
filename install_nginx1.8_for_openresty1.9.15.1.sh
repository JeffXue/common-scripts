#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/nginx-1.8.1.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/pcre-8.10.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/zlib-1.2.7.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/openssl-1.0.1p.tar.gz

tar xzf nginx-1.8.1.tar.gz -C /usr/local/
tar xzf pcre-8.10.tar.gz -C /usr/local/
tar xzf zlib-1.2.7.tar.gz -C /usr/local/
tar xzf openssl-1.0.1p.tar.gz -C /usr/local/

cd ..
rm -rf temp

mv /usr/local/openresty/nginx /usr/local/openresty/nginx_backup

export LUAJIT_LIB=/usr/local/openresty/luajit/lib
export LUAJIT_INC=/usr/local/openresty/luajit/include/luajit-2.1

cd /usr/local/nginx-1.8.1

./configure --prefix=/usr/local/openresty/nginx --with-cc-opt=-O2 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/ngx_devel_kit-0.3.0 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/echo-nginx-module-0.59 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/xss-nginx-module-0.05 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/ngx_coolkit-0.2rc3 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/set-misc-nginx-module-0.30 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/form-input-nginx-module-0.12 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/encrypted-session-nginx-module-0.05 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/srcache-nginx-module-0.31 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/ngx_lua-0.10.5 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/ngx_lua_upstream-0.05 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/headers-more-nginx-module-0.30 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/array-var-nginx-module-0.05 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/memc-nginx-module-0.17 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/redis2-nginx-module-0.13 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/redis-nginx-module-0.3.7 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/rds-json-nginx-module-0.14 \
  --add-module=/usr/local/openresty-1.9.15.1/bundle/rds-csv-nginx-module-0.07 \
  --with-ld-opt=-Wl,-rpath,/usr/local/openresty/luajit/lib \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-http_gzip_static_module \
  --with-pcre=/usr/local/pcre-8.10 \
  --with-openssl=/usr/local/openssl-1.0.1p \
  --with-zlib=/usr/local/zlib-1.2.7 \
  --with-http_realip_module \

make && make install
