
mkdir /etc/ssl/private
#TODO RIGHT CHMOD SO DOVECAT CAN ACCESS, or for postfix?
chmod 0777 /etc/ssl/private
openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/mail.key -out /etc/ssl/certs/mail.crt -nodes -days 36500


yum -y install postfix
cp master.cf /etc/postfix/
cp main.cf /etc/postfix

yum -y install dovecot
cp 10-* /etc/dovecot/conf.d/


