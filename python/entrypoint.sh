#! /bin/bash
cd /home/container

# Make internal docker ip address available to processes.
TZ=${TZ:-UTC}
export TZ
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

echo "Python Version:"
python --version

# replace startup variables
PARSED=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Run the server
eval $PARSED