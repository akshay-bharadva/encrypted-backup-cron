#!/bin/bash

# Define directories and filenames
SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar"
ENCRYPTED_FILE="${BACKUP_FILE}.gpg"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Create a compressed backup
tar -cvf "$BACKUP_FILE" "$SOURCE_DIR"

# Encrypt the backup
gpg --batch --yes --passphrase "B!tcoin@" --symmetric --cipher-algo AES256 --output "$ENCRYPTED_FILE" "$BACKUP_FILE"

# Remove the unencrypted backup file
rm -f "$BACKUP_FILE"

echo "Backup and encryption completed: $ENCRYPTED_FILE"
