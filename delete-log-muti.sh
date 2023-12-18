#!/bin/bash

# Set the paths to your log files
log_paths=("/path/to/first/log/files" "/path/to/second/log/files" "/path/to/third/log/files")
# Set the threshold for log file age in days
threshold_days=5
# Set the output file name
output_file="$(date +'%m-%d-%Y')_complete.txt"
# Iterate over log paths
for log_path in "${log_paths[@]}"; do
    # Find and delete files older than the threshold in each path
    find "$log_path" -type f -mtime +$threshold_days -exec rm {} \;
    echo "Deletion complete for files older than $threshold_days days in: $log_path"
done
# Notify completion
echo "Deletion process complete."
# Export information to a file
echo "Deletion summary $(date):" > "$output_file"
echo "Deleted files older than $threshold_days days from the following paths:" >> "$output_file"
for log_path in "${log_paths[@]}"; do
    echo "$log_path" >> "$output_file"
done
echo "Deletion process completed on $(date)." >> "$output_file"
# Notify completion
echo "Deletion summary exported to $output_file."
