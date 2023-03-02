#!/bin/bash

echo "Install PM2"

sudo npm install pm2@latest -g

# Configure PM2 to start automatically on system boot
pm2 startup systemd

# Save the current PM2 process list and start it again after system reboot
pm2 save

# Verify that PM2 was installed successfully and is running
pm2 status

echo "Successful"
