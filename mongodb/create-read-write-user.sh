#!/bin/bash

# Enter username and password for the user
read -s -p "Enter username: " mongo_username
read -s -p "Enter password: " mongo_pwd
read -s -p "Enter db grant for user: " mongo_db

mongo admin --eval "db.createUser({ user: '${mongo_username}', pwd: '$mongo_pwd', roles: [ { role: 'readWrite', db: '${mongo_db}' } ] })"

echo "Successful"
