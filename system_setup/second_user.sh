#!/bin/bash
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"

git clone http://github.com/anokata/dotfiles.git
#./dotfiles/vans/ansible.sh
cp dotfiles/Linux/bin/ -r ~/

