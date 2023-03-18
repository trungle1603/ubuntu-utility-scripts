#!/bin/bash

DB_NAME="base-app"
BACKUP_DIR="ubuntu-backups/mongodb"
TIMESTAMP=$(date "+%Y-%m-%d")


echo "Backing up MongoDB database..."

# Create a backup of the database with the given name and timestamp
mongodump --out="$BACKUP_DIR/$TIMESTAMP" --db=$DB_NAME

echo "MongoDB database backed up to $BACKUP_DIR/$TIMESTAMP"