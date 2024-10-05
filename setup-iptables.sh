#!/bin/bash

# Flush existing rules
sudo iptables -F

# Set default policy to drop all incoming traffic
sudo iptables -P INPUT DROP

# Allow TCP traffic on port 7031
sudo iptables -A INPUT -p tcp --dport 7031 -j ACCEPT

# Allow UDP traffic on port 7031
sudo iptables -A INPUT -p udp --dport 7031 -j ACCEPT

# Allow established and related connections
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow loopback traffic
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow all outgoing traffic
sudo iptables -P OUTPUT ACCEPT

# Save iptables rules
sudo sh -c "iptables-save > /etc/iptables/rules.v4"

echo "iptables rules applied and saved."
