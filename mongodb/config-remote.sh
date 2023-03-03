#!/bin/bash

interface=$(ip route get 1.1.1.1 | grep -oP '(?<=dev\s)\w+' | head -1)

server_ip=$(ip -4 addr show $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Enter trusted ip
read -p "Enter your trusted ip address: " trusted_ip

# Add trusted ip to firewall rule
sudo ufw allow from $trusted_ip to any port 27017

# Configure MongoDB to listen on the server's ip address
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: 127.0.0.1,$server_ip/g" /etc/mongod.conf

# Restart mongod
sudo systemctl restart mongod
sudo systemctl status mongod
