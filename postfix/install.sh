#!/bin/bash

# Update the package list
apt-get -y update

# Install Postfix and its dependencies
DEBIAN_FRONTEND=noninteractive apt-get -y install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules

# Configure Postfix
echo "myhostname = $(hostname -f)" >> /etc/postfix/main.cf
echo "smtpd_banner = \$myhostname ESMTP" >> /etc/postfix/main.cf
echo "mydestination = localhost" >> /etc/postfix/main.cf
echo "mynetworks = 127.0.0.0/8" >> /etc/postfix/main.cf
echo "relayhost = " >> /etc/postfix/main.cf
echo "smtp_sasl_auth_enable = yes" >> /etc/postfix/main.cf
echo "smtp_sasl_security_options = noanonymous" >> /etc/postfix/main.cf
echo "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd" >> /etc/postfix/main.cf
echo "smtp_use_tls = yes" >> /etc/postfix/main.cf
echo "smtp_tls_security_level = encrypt" >> /etc/postfix/main.cf
echo "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt" >> /etc/postfix/main.cf

# Create the sasl_passwd file with your SMTP credentials
echo "[smtp.gmail.com]:587    your_username@gmail.com:your_password" > /etc/postfix/sasl_passwd

# Set the correct permissions on the sasl_passwd file
chmod 600 /etc/postfix/sasl_passwd

# Hash the sasl_passwd file for security
postmap /etc/postfix/sasl_passwd

# Restart Postfix
systemctl restart postfix


# change password: 
# - Edit sasl_passwd
# - sudo chmod 600 /etc/postfix/sasl_passwd
# - Hash sasl_passwd
# - Restart Postfix
# - If change username in sasl_passwd, update smtp_sasl_password_maps in /etc/postfix/main.cf 