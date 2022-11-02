dnf install epel-release
dnf install opendkim opendkim-tools perl-Getopt-Long
mkdir /etc/opendkim/keys/schizo.life
opendkim-genkey -b 2048 -d schizo.life -D /etc/opendkim/keys/schizo.life -s 20200308 -v
chown opendkim:opendkim /etc/opendkim/keys/ -R

cp -f TrustedHosts /etc/opendkim/
cp -f KeyTable /etc/opendkim/
cp -f SigningTable /etc/opendkim/
cp -f opendkim.com /etc/

echo "set up your key records now and hit enter"
read

opendkim-testkey -d schizo.life -s 20200308 -vvv
systemctl start opendkim
systemctl enable opendkim
gpasswd -a postfix opendkim

systemctl restart postfix
