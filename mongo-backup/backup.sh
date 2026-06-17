#!/bin/bash
set -e

BACKUP_DIR=/backups/$(date +%Y%m%d_%H%M%S)
mongodump \
  --host mongo \
  --username "$MONGO_USER" \
  --password "$MONGO_PWD" \
  --authenticationDatabase admin \
  --db amber \
  --out "$BACKUP_DIR"

# Compress the backup
tar -czf "${BACKUP_DIR}.tar.gz" -C /backups "$(basename "$BACKUP_DIR")"
rm -rf "$BACKUP_DIR"

# Retain backups for the configured number of days (default: 7)
find /backups -maxdepth 1 -name "*.tar.gz" -mtime +"${BACKUP_RETAIN_DAYS:-7}" -delete

echo "[$(date)] Backup completed: ${BACKUP_DIR}.tar.gz"
