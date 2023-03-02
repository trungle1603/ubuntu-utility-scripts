#!/bin/bash

echo "Install Node.js LTS"

# Check if Node.js is already installed
if command -v node &> /dev/null
then
    echo "Node.js is already installed."
else
    # Add the Node.js PPA
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs build-essential

    # Confirm that Node.js is installed
    node -v
fi

# Install yarn, typescript, nestjs
sudo corepack enable
sudo npm install -g typescript @nestjs/cli

echo "Successfull"
