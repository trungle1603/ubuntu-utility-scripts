#!/bin/bash

# Prompt the user to enter the admin user credentials
echo "Please enter the credentials of the MongoDB admin user:"
read -p "Username: " admin_username
read -s -p "Password: " admin_password
echo

# Authenticate as the admin user and check if the authentication was successful
if mongo admin --eval "db.auth('$admin_username', '$admin_password')" >/dev/null 2>&1; then
    # Prompt the user to enter the username of the user to delete
    read -p "Please enter the username of the MongoDB user to delete: " user_username

    # Delete the user if it exists and is not the admin user
    if [[ "$user_username" != "$admin_username" ]] && mongo admin --eval "db.getUser('$user_username')" >/dev/null 2>&1; then
        mongo admin --eval "db.dropUser('$user_username')"
        echo "User '$user_username' has been deleted."
    else
        echo "User '$user_username' does not exist or cannot be deleted."
    fi
else
    echo "Authentication failed. Please check your credentials and try again."
fi

