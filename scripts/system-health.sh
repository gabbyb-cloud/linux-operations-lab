#!/usr/bin/env bash

echo "===== Linux System Health ====="
echo

echo "Hostname:"
hostname
echo

echo "CPU Count:"
nproc
echo

echo "Uptime and Load:"
uptime
echo

echo "Memory:"
free -h
echo

echo "Root Disk:"
df -h /
echo

echo "Top Memory Processes:"
ps aux --sort=-%mem | head -n 6
echo

echo "Linux Lab Service:"
systemctl is-active linux-lab
