#!/bin/bash

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Get the filename from the argument
original_filename="$1"

# Get the current date in YYYY-MM-DD format
date_suffix=$(stat -c %y -- "$original_filename" | cut -d ' ' -f 1)

# Create the new filename by appending the date to the original filename
# (before the extension if it exists)
filename_no_ext="${original_filename%.*}"
extension="${original_filename##*.}"

if [ "$filename_no_ext" == "$original_filename" ]; then
  # No extension case
  new_filename="${original_filename}_$date_suffix"
else
  # With extension case
  new_filename="${filename_no_ext}_$date_suffix.${extension}"
fi

# Print the new filename
echo "New filename: $new_filename"
mv -- $original_filename $new_filename
