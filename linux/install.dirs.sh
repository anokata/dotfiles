#!/bin/bash
# make all dirs from .env
source ~/dotfiles/linux/.env

echo -e "Making dirs..."
mkdir $HOME/Dropbox 2>/dev/null
mkdir $HOME/bin 2>/dev/null
mkdir $HOME/dirs 2>/dev/null
mkdir $GITS_DIR 2>/dev/null
mkdir $HOME/.vim 2>/dev/null
mkdir $HOME/.config 2>/dev/null
echo "done"

