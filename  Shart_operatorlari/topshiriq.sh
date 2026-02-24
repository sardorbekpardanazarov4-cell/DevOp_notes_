#!/bin/bash
SRC="/data"
DEST="/backup"
[ ! -d "$SRC" ] && { echo "Source not found"; exit 1; }
[ ! -d "$DEST" ] && mkdir -p "$DEST"
tar -czf "$DEST/backup.tar.gz" "$SRC"
if [ $? -eq 0 ]; then
    echo "Backup success"
else
    echo "Backup failed"
fi
