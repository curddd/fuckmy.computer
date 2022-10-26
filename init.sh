#!/bin/sh

su
yum install -y irssi
yum install -y tmux

#httpd
yum install -y httpd
cp httpd.conf /etc/httpd/conf/
cp welcome.conf /etc/httpd/conf.d/

#rights (not needed)
addgroup webusers
TMUX=`whereis tmux | awk '{split($0,a," ");print a[2]}'`
IRSSI=`whereis irssi | awk '{split($0,a," ");print a[2]}'`

allowed_programs = (TMUX, IRSSI)

for prog in "${allowed_programs[@]}"
do
	chmod 750 $i
	chown root:webusers $i
done


#proxi
adduser -r proxi

