#!/bin/bash

echo "Initial server"
echo "The Services Install:" 
echo "NodeJs, MongoDB, Redis"

read -p "Enter a new SSH port number: " ssh_port

# Update the system
sudo apt-get update -y

# Disable root login
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
# Change default SSH port
sudo sed -i "s/#Port 22/Port $ssh_port/g" /etc/ssh/sshd_config
sudo systemctl restart sshd

# Install requires package
sudo apt-get install -y ufw fail2ban nginx nano

# Configure the firewall
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow "Nginx Full"

# Configure fail2ban - Anti brute-force attacks by blocking IP addresses
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i 's/bantime  = 10m/bantime  = 1h/g' /etc/fail2ban/jail.local
sudo systemctl restart fail2ban

sudo bash ./nodejs/install.sh
sudo bash ./mongodb/install.sh
sudo bash ./redis/install.sh
