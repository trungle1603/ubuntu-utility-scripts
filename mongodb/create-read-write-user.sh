#!/bin/bash

# Enter username and password for the user
read -s -p "Enter username: " mongo_rw_username
read -s -p "Enter db grant for user: " mongo_rw_db

echo "Enter password: "
sudo sh -c 'read -s mongo_rw_password && echo $mongo_rw_password > /root/.mongo_rw_password'
echo

# Create a read-write user with the provided username and password
mongo admin --eval "db.createUser({ user: '$mongo_rw_username', pwd: '$(cat /root/.mongo_rw_password)', roles: [ { role: 'readWrite', db: '$mongo_rw_db' } ] })" -u admin -p "$(cat /root/.mongo_admin_password)" --authenticationDatabase admin --host localhost

sudo rm /root/.mongo_rw_password

echo "Successful"
