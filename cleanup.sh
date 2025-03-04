#!/bin/bash

# Set the journal log size limit to 100MB
journalctl --vacuum-size=100M

# Remove all compressed log files in /var/log
rm -rf /var/log/*.gz /var/log/**/*.gz

# Delete log files older than 7 days
find /var/log -type f -mtime +7 -exec rm -f {} \;

# Truncate the OpenVPN log file
truncate -s 0 /var/log/openvpn/openvpn.log

# Remove the btmp log file (records failed login attempts)
rm -rf /var/log/btmp

# Show disk space usage after cleanup
df -h
