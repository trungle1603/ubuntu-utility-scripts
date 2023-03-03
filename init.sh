#!/bin/bash

echo "Initial server"

echo "The default services are installed: git, nodejs, yarn, pm2"

echo "Choose option services: "

echo "mongodb"

echo "redis"

read -p "Enter service you choose, separated by spaces: " services

sudo bash ./git/install.sh
sudo bash ./nodejs/install.sh
sudo bash ./pm2/install.sh


for service in $services
do
  sudo bash ./$service/install.sh
done
