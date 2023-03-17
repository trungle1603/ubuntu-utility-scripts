#!/bin/bash

read -p "SSH port number: " ssh_port
read -p "SSH user: " ssh_user
read -p "SSH host: " ssh_host

type $env:USERPROFILE\.ssh\id_rsa.pub | ssh -p $ssh_port $ssh_user@$ssh_host "cat >> .ssh/authorized_keys"