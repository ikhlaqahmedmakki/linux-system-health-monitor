#!/bin/bash

# Disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

# Memory usage
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", ($2-$7)/$2*100}')

# System load
LOAD_AVG=$(awk '{print $1}' /proc/loadavg)

# Process count
PROCESS_COUNT=$(ps -e --no-headers | wc -l)

# Disk status
if [ "$DISK_USAGE" -gt 80 ]; then
    DISK_STATUS="WARNING"
else
    DISK_STATUS="OK"
fi

echo "Timestamp: $(date)"
echo "Disk: ${DISK_USAGE}% [$DISK_STATUS]"
echo "Memory: ${MEM_USAGE}%"
echo "Load Average: $LOAD_AVG"
echo "Running Processes: $PROCESS_COUNT"
echo "--------------------------"
OUTPUT_FILE="${1:-logs/health.log}"

mkdir -p "$(dirname "$OUTPUT_FILE")"

{
    echo "Timestamp: $(date)"
    echo "Disk: ${DISK_USAGE}% [$DISK_STATUS]"
    echo "Memory: ${MEM_USAGE}%"
    echo "Load Average: $LOAD_AVG"
    echo "Running Processes: $PROCESS_COUNT"
    echo "--------------------------"
} >> "$OUTPUT_FILE"

