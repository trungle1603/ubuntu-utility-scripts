#!/bin/bash

read -p "Enter the databse: " DATABASE
read -p "Enter the username: " USERNAME

# Set the backup directory and timestamp
BACKUP_DIR="~/ubuntu-backups/mongodb"
TIMESTAMP="YYYY-MM-DD"

echo "Restoring MongoDB database..."

# Restore the database from the backup with the given name and timestamp
mongorestore --username=$USERNAME --authenticationDatabase=$DATABASE "$BACKUP_DIR/$TIMESTAMP"

echo "MongoDB database restored from $BACKUP_DIR/$TIMESTAMP"
