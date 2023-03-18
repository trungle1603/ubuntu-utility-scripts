#!/bin/bash

sudo apt-get -y remove nodejs
sudo apt-get -y purge nodejs
sudo apt-get -y autoremove

sudo rm /etc/apt/sources.list.d/node*
sudo rm /var/cache/apt/archives/nodejs*