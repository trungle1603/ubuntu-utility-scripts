# Get the name of connected network interface
NETWORK_INTERFACE=$(ip route get 1.1.1.1 | grep -oP '(?<=dev\s)\w+' | head -1)

# Get server ip address
SERVER_IP=$(ip -4 addr show $NETWORK_INTERFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# or just use: hostname -I
echo "${SERVER_IP}"
