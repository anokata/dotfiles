#!/bin/bash
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"
cp dotfiles/bin/ -r ~/

sudo localectl --no-convert set-x11-keymap ru,us pc104 ,qwerty grp:alt_shift_toggle
setxkbmap -model pc104 -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle
