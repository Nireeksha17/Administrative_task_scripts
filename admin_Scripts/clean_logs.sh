#!/bin/bash

# Target directory for log cleanup
LOG_PATH="/var/log"

# Define the file age threshold (in days)
AGE_THRESHOLD=7

echo "Starting cleanup: Removing log files older than $AGE_THRESHOLD days from $LOG_PATH..."

# Search for .log files older than defined days and delete them
deleted_files=$(find "$LOG_PATH" -type f -name "*.log" -mtime +$AGE_THRESHOLD -print -delete)

# Output the result
if [ -n "$deleted_files" ]; then
    echo "Removed the following log files:"
    echo "$deleted_files"
else
    echo "No log files older than $AGE_THRESHOLD days were found."
fi

echo "Log cleanup finished."
