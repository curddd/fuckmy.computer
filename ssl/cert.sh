yum -y install epel-release
yum -y install certbot
yum -y install python3-certbot-apache

echo "Enter Admin Email:"
read v_email
echo "Enter domain name for certificate"
read v_domain

cp virt.host.conf /etc/httpd/conf.d/$v_domain.conf
systemctl restart httpd

certbot certonly -a apache --agree-tos --staple-ocsp --email $v_email -d $v_domain



postconf "smtpd_tls_cert_file = /etc/letsencrypt/live/$v_domain/fullchain.pem"

postconf "smtpd_tls_key_file = /etc/letsencrypt/live/$v_domain/privkey.pem"

systemctl restart postfix
