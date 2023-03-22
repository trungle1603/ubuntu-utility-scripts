#!/bin/bash

sudo apt-get update

sudo apt-get install -y clamav clamav-daemon

sudo systemctl stop clamav-freshclam

sudo freshclam

sudo systemctl start clamav-freshclam