#!/bin/sh

su
yum install -y irssi
yum install -y tmux

source httpd/install.sh



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
sudo -u 

