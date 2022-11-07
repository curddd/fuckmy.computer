#!/bin/sh
yum -y install httpd

cp -f httpd.conf /etc/httpd/conf/httpd.conf
cp -f virt.host.conf /etc/httpd/conf.D
chown -R root:apache /var/www/
systemctl start httpd
systemctl enable httpd

sh deploy.sh
