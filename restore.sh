#!/usr/bin/env sh

PGRESTORE_CMD=`python /usr/local/bin/pguri`

# Download backup
aws s3 cp "s3://${S3_BUCKET}/${BACKUP_NAME}" "/backup/${BACKUP_NAME}"

# Decompress backup with progress
cd /backup/ && pv $BACKUP_NAME | tar xzf - -C .

# Restore backup
eval $PGRESTORE_CMD

# Delete temp files
rm -rf /backup/latest.dump
