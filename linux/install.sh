#!/bin/bash
# +make?
source ~/dotfiles/linux/.bashrc
sudo apt install git
echo 'source ~/dotfiles/linux/.bashrc' >> ~/.bashrc
echo 'source ~/dotfiles/linux/.env' >> ~/.profile

git config --global user.name anokata
git config --global user.email $WORK_EMAIL

cd ~/dotfiles
git config user.email $KSI_EMAIL
cd -

# TODO: ssh keys

./install.apps.sh
./install.dirs.sh
source ~/dotfiles/linux/.env
./install.configs.sh -p
./install.ext.sh
./install.vim.sh -p
