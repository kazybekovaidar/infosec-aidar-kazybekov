#!/bin/bash

# Script: count_word.sh
# Description: Takes two arguments (file name and word). 
#              Counts how many times the word appears in the file.

if [ $# -ne 2 ]; then
  echo "Usage: $0 <filename> <word>"
  exit 1
fi

filename=$1
search_word=$2

if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

count=$(grep -o "$search_word" "$filename" | wc -l)
echo "The word '$search_word' appears $count times in '$filename'."
