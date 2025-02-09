#!/bin/bash

# Script: delete_empty_files.sh
# Description: Takes a directory as an argument, finds all empty files,
#              and deletes them while printing out the names.

if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory=$1

if [ ! -d "$directory" ]; then
  echo "Error: '$directory' is not a valid directory."
  exit 1
fi

# Loop through files in the directory
for file in "$directory"/*; do
  if [ -f "$file" ] && [ ! -s "$file" ]; then
    echo "Deleting empty file: $file"
    rm "$file"
  fi
done
