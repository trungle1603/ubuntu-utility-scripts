#!/bin/bash

DB_NAME="base-app"
BACKUP_DIR="ubuntu-backups/mongodb"
TIMESTAMP=$(date "+%Y-%m-%d")

echo "Restoring MongoDB database..."

# Restore the database from the backup with the given name and timestamp
mongorestore "$BACKUP_DIR/$TIMESTAMP"

echo "MongoDB database restored from $BACKUP_DIR/$TIMESTAMP"
