#!/bin/bash
cd ~/.n9/1b9c31/.pref/
name=`uuidgen`
touch $name
head -c 1M </dev/urandom >"$name"
mkfs -t ext4 "$name"


echo $name
ls -lah $name
