#!/bin/bash

# source $DOTFILES_LINUX/bin/session/alias.sh
source $DOTFILES_LINUX/.env
cd $GITS_DIR

# gits list:
# LF
# git clone https://github.com/gokcehan/lf.git
# https://github.com/gokcehan/lf/releases
LF_FILE='lf-linux-amd64.tar.gz'
wget https://github.com/gokcehan/lf/releases/download/r27/$LF_FILE
tar xf $LF_FILE
sudo mv lf /usr/bin/lf
# lfrun lfimg
# FZF
# archivemount
# cp-p
# lfimg


## rofi
##rofi-keepassx
##kaomoji-rofi
##rofi-emoji
