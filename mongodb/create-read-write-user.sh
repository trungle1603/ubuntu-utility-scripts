#!/bin/bash

echo "Creating MongoDB user..."

read -p "Enter the username: " username
read -p "Enter the database: " database

# Read the password without echoing to the terminal
echo -n "Enter the password: "
read -s password
echo ""

# Create the admin user with the given username and password
mongo $database --eval "db.createUser({ user: '$username', pwd: '$password', roles: [ { role: 'readWrite', db: '$database'} ] })"

echo "MongoDB user created."
