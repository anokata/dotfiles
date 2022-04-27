#!/bin/bash
source $DOTFILES_LINUX/.env
source $DOTFILES_LINUX/.bashrc
cd $GITS_DIR
TMP_DIR=$(create-tmp-ram-dir)

# LF (https://github.com/gokcehan/lf.git)
cd $TMP_DIR
LF_FILE='lf-linux-amd64.tar.gz'
wget https://github.com/gokcehan/lf/releases/download/r27/$LF_FILE
tar xf $LF_FILE
sudo mv lf /usr/bin/lf
rm $LF_FILE

# TODO: lfrun lfimg

cd $GITS_DIR
# FZF
# archivemount
# cp-p
# lfimg

# gits list:

## rofi
##rofi-keepassx
##kaomoji-rofi
##rofi-emoji
