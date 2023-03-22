#!/bin/bash

# Postfix with TLS encryption and SMTP authentication

# Update the package list
apt-get -y update

# Install Postfix and its dependencies
 apt-get -y install postfix

#  Change default port 25 SMTP 
# /etc/postfix/master.cf
# 2525 inet n - - - - smtpd

# Only sendmail
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-20-04