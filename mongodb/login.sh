#!/bin/bash

echo "Login..."

read -p "Enter the username: " USERNAME
read -p "Enter the database: " DATABASE
echo ""

mongo --port 27017 -u $USERNAME --authenticationDatabase $DATABASE -p