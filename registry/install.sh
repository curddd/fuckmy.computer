mkdir /root/registry
cp -R . /root/registry
cd /root/registry
mv /root/registry/register.service /etc/systemd/system/
systemctl start register
systemctl enable register 
