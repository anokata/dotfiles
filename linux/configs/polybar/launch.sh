#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log ===>
source ~/dotfiles/linux/.env
if [ -z $MONITOR_1 ]; then
    polybar bottom -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
else 
    polybar bottom-2 -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown
fi
# polybar bottom-tray -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
