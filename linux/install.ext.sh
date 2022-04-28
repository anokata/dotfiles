#!/bin/bash
source $DOTFILES_LINUX/.env
cd $GITS_DIR
TMP_DIR=$(create-temp-ram-dir)

# LF (https://github.com/gokcehan/lf.git)
cd $TMP_DIR
LF_FILE='lf-linux-amd64.tar.gz'
wget https://github.com/gokcehan/lf/releases/download/r27/$LF_FILE
tar xf $LF_FILE
sudo mv lf /usr/bin/lf
rm $LF_FILE


# TODO: lfrun lfimg
cd $GITS_DIR
git clone https://github.com/cirala/lfimg.git
cd lfimg
make install
cd ..
rm -rf lfimg

# FZF
# fzf-euberzug
# archivemount
# cp-p

# gits list:

#npm install -g neovim
#pip install pynvim
#sudo apt install python3-pynvim
#python2 -m pip install --user --upgrade pynvim
# sudo apt install libxkbfile-dev
# git clone https://github.com/grwlf/xkb-switch.git
#sudo pip install fzf-ueberzogen
#sudo npm install -g prettier-eslint-cli
# npm install -g neovim


## rofi
##rofi-keepassx
##kaomoji-rofi
##rofi-emoji
