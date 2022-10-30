#!/bin/sh
yum install -y irssi
yum install -y tmux

cd httpd
sh install.sh
cd ..


cd registry
sh intall.sh
cd ..

systemctl stop firewalld
systemctl disable firewalld
systemctl enable httpd
systemctl start httpd


yum install -y postfix
yum install -y mailx
yum install -y dovecot

cp -f ./dovecot.conf /etc/dovecot/

systemctl enable dovecot
systemctl start dovecot
systemctl enable postfix
systemctl start postfix


cd proxi
sh install.sh
cd ..
