#!/bin/bash
# make all dirs from .env
source ~/dotfiles/linux/.env

echo -n "- Making dirs..."
mkdir $HOME/Dropbox 2>/dev/null
mkdir $HOME/bin 2>/dev/null
mkdir $HOME/dirs 2>/dev/null
mkdir $GITS_DIR 2>/dev/null
mkdir $HOME/.vim 2>/dev/null
mkdir $HOME/.config 2>/dev/null
mkdir $HOME/ydisk 2>/dev/null
mkdir $WORK_DIR 2>/dev/null
echo "... directories made [ok]"

