#!/bin/bash
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"
cp dotfiles/bin/ -r ~/

sudo localectl --no-convert set-x11-keymap ru,us pc104 ,qwerty grp:alt_shift_toggle
setxkbmap -model pc104 -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle
sudo pacman -S --needed base-devel
sudo pacman -S pwgen
sudo pacman -S zathura xpdf
sudo pacman -S unzip
sudo pacman -S gvim
sudo pacman -S sdcv
sudo pacman -S scrot
pacman -S xclip
#https://github.com/powerline/fonts
sudo pacman -S gtypist
