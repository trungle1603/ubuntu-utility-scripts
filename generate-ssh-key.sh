#!/bin/bash

# Check if SSH key already exists
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "SSH key already exists"
else
    read -p "Prompt email: " email

    # Generate a new SSH key
    ssh-keygen -t ed25519 -C "$email"

    # Add the SSH key to the ssh-agent
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    echo "New SSH key generated"
fi
