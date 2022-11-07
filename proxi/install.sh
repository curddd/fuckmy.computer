#!/usr/bin/sh

ssh-keygen

ssh-copy-id root@localhost


mkdir /root/proxi
cp proxi.sh /root/proxi/proxi.sh

cp -f proxi.service /etc/systemd/system/

cp -f proxi.pac /var/www/html/

systemctl enable proxi
systemctl start proxi
