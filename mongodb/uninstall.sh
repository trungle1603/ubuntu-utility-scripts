#!/bin/bash

sudo service mongod stop

sudo apt-get -y purge mongodb-org*

sudo rm -r /var/log/mongodb /var/lib/mongodb

sudo rm /var/cache/apt/archives/mongodb-*

sudo rm /etc/apt/sources.list.d/mongodb-*

sudo apt-get -y autoremove
