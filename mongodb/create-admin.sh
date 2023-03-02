#!/bin/bash

# Use bash to open this file

# Prompt the user to enter a password for the admin user
read -s -p "Enter a password for the MongoDB admin user: " mongo_admin_password

# Create an admin user with the provided password
mongo admin --eval "db.createUser({ user: 'admin', pwd: '$mongo_admin_password', roles: [ { role: 'root', db: 'admin' } ] })"

# Secure MongoDB by enabling authentication and disabling remote root access
sudo sed -i 's/#security:/security:\n  authorization: enabled/g' /etc/mongod.conf
#sudo sed -i 's/#disableRemoteManagement: false/disableRemoteManagement: true/g' /etc/mongod.conf

# Restart the MongoDB service to apply the configuration changes
sudo systemctl restart mongod

