#!/bin/sh
yum install -y irssi
yum install -y tmux




cd httpd
sh install.sh
cd ..

cd ssl
sh cert.sh
cd ..

cd registry
sh install.sh
cd ..

cd mail
sh install.sh
cd ..

cd nosec
sh opendoor.sh
cd ..

cp bashrc /etc/bashrc

