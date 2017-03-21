#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/apache-tomcat-7.0.68.tar.gz

tar xzf apache-tomcat-7.0.68.tar.gz -C /usr/local/

cd ..
rm -rf temp
echo "Tomcat 7.0.68 have installed in /usr/local"
echo "Please make sure you have install JDK7"
