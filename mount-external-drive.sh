#!/bin/bash

echo "Run sudo fdisk -l to show all disk"
echo "Find your disk name. Example: /dev/sdb/ => enter: /dev/sdb"

read -p "Enter your device name: " DEVICE_NAME

# Set the device name of the HDD drive
DEVICE=$DEVICE_NAME

# Set the mount point directory
MOUNT_POINT=/mnt/hdd

# Create file system on HDD drive
sudo mkfs.ext4 $DEVICE

# Create the mount point directory
sudo mkdir $MOUNT_POINT

echo "Set up successfull"
echo "Mount the HDD drive to the mount point: sudo mount $DEVICE $MOUNT_POINT"
echo "To copy a file to device: sudo cp /path $MOUNT_POINT"
