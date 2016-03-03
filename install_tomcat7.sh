#!/bin/bash
mkdir temp
cd temp
wget https://raw.githubusercontent.com/JeffXue/common_packages/master/apache-tomcat-7.0.67.tar.gz

tar xvzf apache-tomcat-7.0.67.tar.gz -C /usr/local/

cd ..
rm -rf temp
echo "Tomcat 7.0.67 have installed in /usr/local"
echo "Please make sure you have install JDK7"
