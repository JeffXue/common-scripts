#!/bin/bash
mkdir temp
cd temp
wget --no-check-certificate https://raw.githubusercontent.com/JeffXue/common-packages/master/apache-tomcat-6.0.44.tar.gz

tar xzf apache-tomcat-6.0.44.tar.gz -C /usr/local/

cd ..
rm -rf temp
echo "Tomcat 6.0.44 have installed in /usr/local"
echo "Please make sure you have install JDK6"
