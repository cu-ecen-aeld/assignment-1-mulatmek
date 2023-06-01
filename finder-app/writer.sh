#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
  echo "Error: Missing arguments."
  echo "Usage: $0 writefile writestr"
  exit 1
fi

# Get the arguments
writefile="$1"
writestr="$2"

# Check if writefile is provided
if [ -z "$writefile" ]; then
  echo "Error: File path not specified."
  exit 1
fi

# Check if writestr is provided
if [ -z "$writestr" ]; then
  echo "Error: Text string not specified."
  exit 1
fi

# Create the directory path if it doesn't exist
directory=$(dirname "$writefile")
mkdir -p "$directory"

# Create the file with the provided content
echo "$writestr" > "$writefile"

# Check if the file was successfully created
if [ $? -ne 0 ]; then
  echo "Error: Failed to create the file."
  exit 1
fi

# Print success message
echo "File created: $writefile"
