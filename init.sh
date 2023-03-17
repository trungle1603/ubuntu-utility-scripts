#!/bin/bash

echo "Initial server"

echo "The Services Install:" 
echo "NodeJs, MongoDB, Redis"

sudo bash ./nodejs/install.sh

sudo bash ./mongodb/install.sh

sudo bash ./redis/install.sh
