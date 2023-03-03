#!/bin/bash

# Prompt the user for the MongoDB admin credentials
read -p "Enter the MongoDB admin username: " mongo_admin_username
read -s -p "Enter the MongoDB admin password: " mongo_admin_password

# Prompt the user for the MongoDB user to update and the new password
read -p "Enter the MongoDB user to update: " mongo_username
read -s -p "Enter the new password for the MongoDB user: " mongo_password

# Authenticate with the MongoDB admin credentials
mongo --username $mongo_admin_username --passwordPrompt --authenticationDatabase admin <<EOF
use admin
db.auth("$mongo_admin_username", "$(< /dev/stdin)")

# Change the password for the MongoDB user
use dbName # Replace dbName with the name of the user's database
db.changeUserPassword("$mongo_username", "$mongo_password")

quit()
EOF

echo "MongoDB user password updated."

