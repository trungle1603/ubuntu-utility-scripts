#!/bin/bash

echo "Creating MongoDB admin user..."

read -p "Enter the admin username: " USERNAME

# Read the password without echoing to the terminal
echo -n "Enter the admin password: "
read -s PASSWORD
echo ""

# Create the admin user with the given username and password
mongo admin --eval "db.createUser({ user: '$USERNAME', pwd: '$PASSWORD', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] })"

echo "MongoDB admin user created."
