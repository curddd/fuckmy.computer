#!/bin/sh
cd /root/proxi
while [ 1 ]
do
	ssh -i proxi -N -D 1080 proxi@localhost
done
