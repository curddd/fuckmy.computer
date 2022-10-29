#!/bin/sh
yum -y install httpd
systemctl start httpd
cp httpd.conf /etc/httpd/conf/httpd.conf
sh deploy.sh
