#!/bin/sh
cd /root/proxi
while [ 1 ]
do
	ssh -g -N -D 1080 root@localhost
done
