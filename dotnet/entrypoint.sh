#!/bin/bash
cd /home/container

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

export DOTNET_ROOT=/usr/share/

echo -e "Dotnet Version:\n"
dotnet --version

PARSED=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Run the server
eval ${PARSED}