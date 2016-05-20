#!/bin/bash
mkdir temp
cd temp
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/Python-2.7.10.tgz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/setuptools-18.5.tar.gz
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/pip-7.1.2.tar.gz

tar xvzf Python-2.7.10.tgz -C /usr/local/
tar xvzf pip-7.1.2.tar.gz -C /usr/local/
tar xvzf setuptools-18.5.tar.gz -C /usr/local/

cd ..
rm -rf temp

apt-get install libssl-dev -y
apt-get install openssl -y
apt-get install python-openssl -y

cd /usr/local/Python-2.7.10
./configure --with-ssl
make && make install

cd /usr/local/setuptools-18.5
python setup.py install

cd /usr/local/pip-7.1.2
python setup.py install



