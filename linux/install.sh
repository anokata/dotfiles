#!/bin/bash
# +make?
source ~/dotfiles/linux/.bashrc
sudo apt install git
echo 'source ~/dotfiles/linux/.bashrc' >> ~/.bashrc
echo 'source ~/dotfiles/linux/.env' >> ~/.profile
./install.apps.sh
./install.dirs.sh
./install.config.sh -p
./install.ext.sh
./install.vim.sh
