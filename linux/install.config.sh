#!/bin/bash
# ln all
# make all dirs from .env
echo -e "Making dirs..."
mkdir $HOME/Dropbox 2>/dev/null
mkdir $HOME/bin 2>/dev/null
mkdir $HOME/dirs 2>/dev/null
mkdir $HOME/gits 2>/dev/null
mkdir $HOME/.vim 2>/dev/null
mkdir $HOME/.config 2>/dev/null
echo "done"

echo -e "Copy configs..."
cp ~/dotfiles/linux/.@(!(.|))  ~/
#cp ~/dotfiles/linux/* ~/.config # TODO: not dot
#ln configs: tmux bspcwmrc ...
# configs/vimsetup

echo "done"

