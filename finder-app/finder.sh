#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
  echo "Error: Missing arguments."
  echo "Usage: $0 filesdir searchstr"
  exit 1
fi

# Get the arguments
filesdir="$1"
searchstr="$2"

# Check if filesdir is provided
if [ -z "$filesdir" ]; then
  echo "Error: Directory path not specified."
  exit 1
fi

# Check if searchstr is provided
if [ -z "$searchstr" ]; then
  echo "Error: Text string not specified."
  exit 1
fi

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' is not a valid directory."
  exit 1
fi

# Find matching lines in files
matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Count the number of files
num_files=$(find "$filesdir" -type f | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $matching_lines"
