#!/usr/bin/env bash

polybar-msg cmd quit
# killall -q polybar

# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log ===>
source ~/dotfiles/linux/.env
if [ -z $MONITOR_1 ]; then
    polybar bottom -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
else 
    polybar bottom -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar bottom-2 -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown
fi
# polybar bottom-tray -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
