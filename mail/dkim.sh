dnf install epel-release
dnf install opendkim opendkim-tools perl-Getopt-Long
mkdir /etc/opendkim/keys/schizo.life
opendkim-genkey -b 2048 -d schizo.life -D /etc/opendkim/keys/schizo.life -s 20200308 -v
chown opendkim:opendkim /etc/opendkim/keys/ -R


echo "set up your key records in your dns now and hit enter"
cat /etc/opendkim/keys/schizo.life/20200308.txt
read


echo "now a test:"

opendkim-testkey -d schizo.life -s 20200308 -vvv
systemctl start opendkim
systemctl enable opendkim
gpasswd -a postfix opendkim
