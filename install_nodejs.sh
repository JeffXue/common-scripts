#!/bin/bash
wget --no-check-certificate https://raw.github.com/creationix/nvm/master/install.sh
chmod +x install.sh
./install.sh
echo "reopen terminal and run 'nvm install 4.3.2' to install nodejs"
rm -rf install.sh

