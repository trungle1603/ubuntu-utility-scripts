#!/bin/bash

# Use bash to open this file

# Prompt the user to enter a password for the admin user
read -s -p "Enter a username for admin user" mongo_admin_username

echo "Enter a password for admin user:"
sudo sh -c 'read -s mongo_admin_password && echo $mongo_admin_password > /root/.mongo_admin_password'
echo

# Check if authentication is enabled by trying to authenticate as the admin user
if mongo admin --eval "db.auth('admin', '$(cat /root/.mongo_admin_password)')" >/dev/null 2>&1; then
    # Create an admin user with the provided password
    mongo admin --eval "db.createUser({ user: $mongo_admin_username, pwd: '$(cat /root/.mongo_admin_password)', roles: [ { role: 'root', db: 'admin' } ] })"
else
    # Create an admin user without authentication if it's not enabled yet
    mongo admin --eval "db.createUser({ user: $mongo_admin_username, pwd: '$(cat /root/.mongo_admin_password)', roles: [ { role: 'root', db: 'admin' } ] })" --authenticationDatabase "" --host localhost
fi

# Create an admin user with the provided password

# Remove the password file
sudo rm /root/.mongo_admin_password

# Secure MongoDB by enabling authentication and disabling remote root access
sudo sed -i 's/#security:/security:\n  authorization: enabled/g' /etc/mongod.conf
#sudo sed -i 's/#disableRemoteManagement: false/disableRemoteManagement: true/g' /etc/mongod.conf

# Restart the MongoDB service to apply the configuration changes
sudo systemctl restart mongod
