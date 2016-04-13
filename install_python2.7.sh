#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/Python-2.7.10.tgz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/setuptools-18.5.tar.gz
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common_packages/master/pip-7.1.2.tar.gz

tar xvzf Python-2.7.10.tgz -C /usr/local/
tar xvzf pip-7.1.2.tar.gz -C /usr/local/
tar xvzf setuptools-18.5.tar.gz -C /usr/local/

cd ..
rm -rf temp

apt-get install libssl-dev -y

cd /usr/local/Python-2.7.10
./configure
make && make install

cd /usr/local/setuptools-18.5
python setup.py install

cd /usr/local/pip-7.1.2
python setup.py install



