#!/bin/bash
# Define the paths and file patterns to delete
paths=( "/var/log/*.log" "/home/user/log/*.log" )
# Loop through each path
for path in "${paths[@]}"
do
  # Find and delete files older than 5 days
  find "$path" -mtime +5 -type f -delete
done
# Notify the user that the script is complete
echo "Log files deleted successfully."
