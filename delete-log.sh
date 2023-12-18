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

othe script

#!/bin/bash
# Set the path to your log files
log_path="/path/to/your/log/files"
# Set the threshold for log file age in days
threshold_days=5
# Set the output file name
output_file="$(date +'%m-%d-%Y')_complete.txt"
# Find and delete files older than the threshold
find "$log_path" -type f -mtime +$threshold_days -exec rm {} \;
# Notify completion
echo "Deletion process complete."
# Export information to a file
echo "Deletion summary $(date):" > "$output_file"
echo "Deleted files older than $threshold_days days in $log_path." >> "$output_file"
echo "Deletion process completed on $(date)." >> "$output_file"

# Notify completion
echo "Deletion summary exported to $output_file."
