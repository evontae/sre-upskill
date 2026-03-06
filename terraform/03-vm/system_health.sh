#!/bin/bash

echo "*********  System Health Report  *********"
echo
SYS_UPTIME=$(uptime) 
echo "Current system uptime: $SYS_UPTIME"
echo
MEM_USAGE=$(free -h | grep 'Mem')
echo "Memory usage: $MEM_USAGE"
echo
DISK_USAGE=$(df -h | grep 'root')
echo "Disk usage: $DISK_USAGE"
echo
CPU_USAGE=$(top -bn1 | grep "Cpu(s)")
echo "CPU usage: $CPU_USAGE"
echo
HIGHEST_CPU_USAGE=$(ps aux --sort=-%cpu | head -n 5)
echo "Top 5 processes by CPU:"
echo "$HIGHEST_CPU_USAGE"
