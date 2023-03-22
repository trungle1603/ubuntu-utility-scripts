#!/bin/bash

read -p "Enter port to find: " PORT
sudo netstat -tlnp | grep :$PORT

# sudo apt install net-tools