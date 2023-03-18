#!/bin/bash

# Set the backup directory and timestamp
DB_NAME="base-app"
BACKUP_DIR="~/ubuntu-backups/mongodb"
TIMESTAMP="YYYY-MM-DD"
# TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")


echo "Backing up MongoDB database..."

# Create a backup of the database with the given name and timestamp
mongodump --out="$BACKUP_DIR/$TIMESTAMP" --db=DB_NAME

echo "MongoDB database backed up to $BACKUP_DIR/$TIMESTAMP"