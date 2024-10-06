!/bin/bash

# Cek status interface eth1
STATUS=$(ip link show eth1 | grep "state UP")

if [ -n "$STATUS" ]; then
    echo "refresh.."
    sudo ifconfig eth1 down
else
    echo "refresh..."
    sudo ifconfig eth1 up
fi


