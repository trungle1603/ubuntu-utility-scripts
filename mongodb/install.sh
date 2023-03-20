#!/bin/bash

sudo apt-get -y update

# Import the MongoDB public GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Update the package list and install MongoDB
sudo apt-get install -y mongodb-org

# Grant permission for mongodb user
cd ~
sudo chown -R mongodb:mongodb /var/lib/mongodb/
sudo chown mongodb:mongodb /tmp/mongodb-27017.sock

# Start the MongoDB service
sudo systemctl start mongod.service

# Enable the MongoDB service to start on boot
sudo systemctl enable mongod.service

# Checking status
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
