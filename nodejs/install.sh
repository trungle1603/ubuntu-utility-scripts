#!/bin/bash

echo "Install Node.js LTS"

sudo apt-get -y update

# Add the Node.js PPA
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential

# Confirm that Node.js is installed
node -v

# Enable yarn
sudo npm install --global yarn pm2@latest
