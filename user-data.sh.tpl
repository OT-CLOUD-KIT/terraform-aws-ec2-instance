#!/bin/bash
file -s ${device_name}
yes | mkfs -t ext4 ${device_name}
mkdir -p ${mount_point}
mount ${device_name} ${mount_point}