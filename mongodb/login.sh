#!/bin/bash

echo "Login..."

read -p "Enter the username: " username

# Read the password without echoing to the terminal
read -p "Enter the database: " database
echo ""

mongo --port 27017 -u $username --authenticationDatabase $database -p