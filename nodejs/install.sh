#!/bin/bash

echo "Install Node.js LTS"

# Add the Node.js PPA
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential

# Confirm that Node.js is installed
node -v

# Install yarn, typescript, nestjs
sudo corepack enable
sudo npm install -g typescript @nestjs/cli pm2@latest

pm2 startup systemd
pm2 save
pm2 status
