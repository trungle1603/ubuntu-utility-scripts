#!/bin/bash

read -p "SSH port number: " PORT
read -p "SSH user: " USER
read -p "SSH host: " HOST

cat ~/.ssh/id_rsa.pub | ssh -p $PORT $USER@$HOST "cat >> .ssh/authorized_keys"