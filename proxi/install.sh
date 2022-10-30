#!/usr/bin/sh

adduser proxi
mkdir /home/proxi/.ssh
ssh-keygen -N '' -f proxi
cp -f proxi.pub /home/proxi/.ssh/authorized_hosts

mkdir /root/proxi
cp proxi.sh /root/proxi/proxi.sh
cp -f proxi /root/proxi/proxi

cp proxi.service /etc/systemd/system/

cp PAC /var/www/html/

systemctl enable proxi
systemctl start proxi
