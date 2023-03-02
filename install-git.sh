#!/bin/bash

echo "Install Git"

sudo apt-get -y install gitit --version

git --version

# Configure git
read -p "Enter your email: " git_email
read -p "Enter your username: " git_name

git config --global user.name $git_name
git config --global user.email $git_email

git config --list
