#!/bin/bash

part=`df -h | grep mmcblk0p`
if [[ $part == *"mmcblk0p2"* ]]; then
    # Raspberry
    growpart /dev/mmcblk0 2
    resize2fs -p /dev/mmcblk0p2
else
    # Orange
    growpart /dev/mmcblk0 1
    resize2fs -p /dev/mmcblk0p1
fi