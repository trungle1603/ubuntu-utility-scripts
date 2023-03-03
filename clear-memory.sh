#!/bin/bash

echo "Before: "
free -m

sync; echo 1 > /proc/sys/vm/drop_caches

echo "After: "
free -m
