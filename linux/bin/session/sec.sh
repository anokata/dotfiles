#!/bin/bash

# Finds the first wireless interface in monitor mode
wifi_interfaces=$(iwconfig 2>/dev/null | grep -o "^[a-zA-Z0-9]*" | grep -E "^wlp|^wlan|^wifi")


for interface in $wifi_interfaces; do
if iwconfig "$interface" 2>/dev/null | grep -q "Mode:Monitor"; then
  WIFI_MONITOR="$interface"
  break # Stop after finding the first monitor interface
fi
done

export WIFI_MONITOR

alias wifi-dump="sudo airodump-ng $WIFI_MONITOR"
alias wifi-start="sudo airmon-ng start $WIFI_MONITOR"
alias wifi-stop="sudo airmon-ng stop $WIFI_MONITOR"

alias wifi-start-wlan1mon="sudo nmcli device set wlan1 managed no; sudo airmon-ng start wlan1; "
