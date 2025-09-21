#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "=== System Health Report ==="

# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
echo "CPU Usage: $CPU_USAGE%"
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "WARNING: CPU usage above $CPU_THRESHOLD%"
fi

# Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%d", $3/$2 * 100)}')
echo "Memory Usage: $MEM_USAGE%"
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "WARNING: Memory usage above $MEM_THRESHOLD%"
fi

# Disk usage
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Disk Usage: $DISK_USAGE%"
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage above $DISK_THRESHOLD%"
fi

# Top 5 memory consuming processes
echo "Top 5 Memory consuming processes:"
ps aux --sort=-%mem | awk 'NR<=5{printf "%-10s %-8s %-8s %s\n",$1,$3,$4,$11}'

echo "=== End of Report ==="
