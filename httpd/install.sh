#!/bin/sh
su
yum -y install httpd
cp httpd.conf /etc/httpd/conf/httpd.conf
source deploy.sh
