#!/bin/bash

# Check if MongoDB is already installed
if [ -x "$(command -v mongod)" ]; then
  echo "MongoDB is already installed on this system."
  exit 0
fi

# Import the MongoDB public GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Update the package list and install MongoDB
sudo apt-get update
sudo apt-get install -y mongodb-org

# Start the MongoDB service
#sudo systemctl start mongod

# Enable the MongoDB service to start on boot
#sudo systemctl enable mongod
#sudo systemctl status mongod
