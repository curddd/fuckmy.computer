#!/bin/sh
yum install -y irssi
yum install -y tmux

cd httpd
sh install.sh


cd ..
cp .bashrc /root/.bashrc

systemctl stop firewalld
systemctl disable firewalld
systemctl enable httpd
systemctl start httpd
