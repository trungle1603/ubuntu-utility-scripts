#!/bin/bash

read -p "Enter a domain name: " DOMAIN_NAME

sudo certbot certonly --standalone --rsa-key-size 4096 --agree-tos --preferred-challenges http -d $DOMAIN_NAME