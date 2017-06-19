#!/bin/bash


function _net_arch_pptp() {
    echo 'welcome home (ppp)'
    pon atel
    for i in 1 2 3 4 5; do
    if ip link show ppp0 >/dev/null 2>/dev/null ; then
        break
    fi
    echo "$i) Wait sec for ppp0..."
    sleep 1
    done
    sleep 1
    dhcpcd 
    sleep 1
    ip route add default dev ppp0
}

function _net_create_pptp() {

}
