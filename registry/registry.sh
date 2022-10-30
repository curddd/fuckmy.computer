#!/bin/sh
cd /root/registry
while [ 1 ]
do
	perl reg-server.pl	
	sleep 1
done
