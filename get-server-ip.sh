# Get the name of connected network interface
network_interface=$(ip route get 1.1.1.1 | grep -oP '(?<=dev\s)\w+' | head -1)

# Get server ip address
server_ip=$(ip -4 addr show $network_interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

echo "${server_ip}"
