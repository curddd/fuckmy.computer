yum -y install unbound
systemctl enable unbound
systemctl start unbound

cp -f resolv.conf /etc/resolv.conf
