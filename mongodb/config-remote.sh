#!/bin/bash

INTERFACE=$(ip route get 1.1.1.1 | grep -oP '(?<=dev\s)\w+' | head -1)

SERVER_IP=$(ip -4 addr show $INTERFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Enter trusted ip
read -p "Enter your trusted ip address: " TRUSTED_IP

# Add trusted ip to firewall rule
sudo ufw allow from $TRUSTED_IP to any port 27017

# Configure MongoDB to listen on the server's ip address
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: 127.0.0.1,$SERVER_IP/g" /etc/mongod.conf

# Restart mongod
sudo systemctl restart mongod
sudo systemctl status mongod
