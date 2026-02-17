#!/bin/bash

# Fix permissions recursively
# Directories: 775 (rwxrwxr-x)
# Files: 664 (rw-rw-r--)

# Check if a path is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the path exists
if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a directory"
    exit 1
fi

# Find all directories and set permissions to 775
find "$1" -type d -exec chmod 775 {} \;

# Find all files and set permissions to 664 
find "$1" -type f -exec chmod 664 {} \;

echo "Permissions fixed successfully"
