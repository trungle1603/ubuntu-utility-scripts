#!/bin/bash

sudo service mongod stop

sudo apt-get -y purge mongodb-org*
sudo apt-get -y autoremove mongodb-org*
sudo apt-get -y remove mongodb-org*

sudo rm -r /var/log/mongodb /var/lib/mongodb
