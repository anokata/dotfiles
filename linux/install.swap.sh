#!/bin/bash

# swap
sudo fallocate -l4G M /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
# sudo swapon /swapfile
sudo swapon --discard /swapfile # for ssd
sudo echo "/swapfile none swap defaults,discard 0 0" >> /etc/fstab
