#!/bin/bash

mount -t ext4 /dev/sda3 /mnt/ssd
fsck -t ext4 /dev/sdb1
mount -t ext /dev/sda3 /mnt/1tb_hdd