#!/bin/bash

sudo apt-get -y update

# Install Redis
sudo apt-get install redis-server -y

# Configure Redis to be supervised by systemd
sudo sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf

# Bind Redis to localhost only
sudo sed -i 's/bind 127.0.0.1 ::1/bind 127.0.0.1/' /etc/redis/redis.conf

echo "Redis installation complete."



