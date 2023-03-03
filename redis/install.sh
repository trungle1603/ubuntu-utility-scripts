#!/bin/bash

# Install Redis
sudo apt-get update
sudo apt-get install redis-server -y

# Configure Redis to be supervised by systemd
sudo sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf

# Bind Redis to localhost only
sudo sed -i 's/bind 127.0.0.1 ::1/bind 127.0.0.1/' /etc/redis/redis.conf

# Generate a secure Redis password using OpenSSL
redis_password=$(openssl rand 60 | openssl base64 -A)

# Configure Redis to use a password
sudo sed -i "s/# requirepass foobared/requirepass $redis_password/" /etc/redis/redis.conf

# Restart Redis for the changes to take effect
sudo systemctl restart redis-server.service

# Save the Redis password to a file with restricted permissions
echo "$redis_password" | sudo tee /etc/redis/redis-password.txt > /dev/null
sudo chmod 400 /etc/redis/redis-password.txt

echo "Redis installation complete."
echo "The Redis password has been saved to /etc/redis/redis-password.txt."



