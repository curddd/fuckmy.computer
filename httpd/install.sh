#!/bin/sh
yum -y install httpd
systemctl start httpd
cp httpd.conf /etc/httpd/conf/httpd.conf
cp config /etc/selinux/config
sh deploy.sh
