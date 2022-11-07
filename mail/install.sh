
yum -y install postfix
cp -f postfix/master.cf /etc/postfix/
cp -f postfix/main.cf /etc/postfix

yum -y install dovecot
cp -f dovecot/10-* /etc/dovecot/conf.d/
cp -f dovecot/dovecot.conf /etc/dovecot/dovecot.conf

sh spf.sh

sh dkim.sh
