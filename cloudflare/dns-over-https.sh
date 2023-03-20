#!/bin/bash

# Check if script is being run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install cloudflared
apt-get update
apt-get install -y cloudflared

cloudflared --version

