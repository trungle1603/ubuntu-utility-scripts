#!/bin/bash

# Generate a secure Redis password using OpenSSL
PASSWORD=$(openssl rand 60 | openssl base64 -A)

# Configure Redis to use a password
sudo sed -i "s/# requirepass foobared/requirepass $PASSWORD/" /etc/redis/redis.conf

# Restart Redis for the changes to take effect
sudo systemctl restart redis-server.service

# Save the Redis password to a file with restricted permissions
echo "$PASSWORD" | sudo tee /etc/redis/redis-password.txt > /dev/null
sudo chmod 400 /etc/redis/redis-password.txt

echo "The Redis password has been saved to /etc/redis/redis-password.txt."
