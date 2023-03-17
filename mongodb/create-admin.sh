#!/bin/bash

echo "Creating MongoDB admin user..."

read -p "Enter the admin username: " username

# Read the password without echoing to the terminal
echo -n "Enter the admin password: "
read -s password
echo ""

# Create the admin user with the given username and password
mongo admin --eval "db.createUser({ user: '$username', pwd: '$password', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] })"

echo "MongoDB admin user created."
