#!/bin/bash
source ~/dotfiles/bin/lib/net_arch_pptp.sh

for d in $(/bin/ls -1 /sys/class/net); do 
    first=$(echo $d | head -c1)
    if [[ $first = 'e' ]]; then
        ETH=$d
        LAN=$d
        LAN_IP=$(~/dotfiles/bin/lan_ip)
    elif [[ $first = 'w' ]]; then
        WIFI=$d
    fi
done
