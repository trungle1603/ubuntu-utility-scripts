#!/bin/bash

sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx

read -p "Enter a domain name: " DOMAIN_NAME

sudo certbot --nginx -d $DOMAIN_NAME