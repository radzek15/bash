#!/usr/bin/env bash

ifconfig | awk '/^eth/ { print; while (getline line) { if (line ~ /^[[:space:]]/) print line; else break; } }' |
grep 'inet ' | sed 's/^[[:space:]]*//' | awk '{print "Private IPv4: " $2 ", Mask: " $4 ", Broadcast: " $6}'

echo "Public IP: $(curl -s https://api.ipify.org)"

echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"

ethtool eth0 2>/dev/null | grep -E "Speed|Duplex|Link" | sed -e 's/^[[:space:]]*//' | tr '\n' ' '

echo -e "\nOpen Ports: $(netstat -nutl |  awk '{print $4}' | awk -F: '{print $NF}' | tail -n +3 | tr '\n' ' ')"

if ping -c 1 8.8.8.8 2&> /dev/null; then
    echo "Internet connection is active."
else
    echo "No internet connection."
fi
