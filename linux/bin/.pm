#!/bin/bash

name="$1"
path="./data"

sudo mount -t ext4 -o loop $name $path
sudo chmod -R 777 $name
sudo chown -R ksi:ksi $name
read -p "Press enter to unload"
sudo sync
sudo umount -l $path
