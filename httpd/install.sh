#!/bin/sh
yum -y install httpd

cp -f httpd.conf /etc/httpd/conf/httpd.conf
chown -R root:apache /var/www/
systemctl start httpd
systemctl enable httpd

sh deploy.sh
