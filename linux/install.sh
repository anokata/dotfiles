#!/bin/bash
# +make?
echo '- Starting install.sh...'
source ~/dotfiles/linux/.bashrc
sudo apt install git
echo -n '- add bash config run...'
echo 'source ~/dotfiles/linux/.bashrc' >> ~/.bashrc
echo 'source ~/dotfiles/linux/.env' >> ~/.profile
echo ' [ok]'

git config --global user.name anokata
git config --global user.email $WORK_EMAIL
#git config push.default current

cd ~/dotfiles
git config user.email $KSI_EMAIL
cd -

./install.apps.sh
./install.dirs.sh
source ~/dotfiles/linux/.env
./install.configs.sh -p
./install.ext.sh
./install.vim.sh -p
# TODO: ssh keys
./install.ssh.sh
# ./install.work.sh

echo '- install.sh... [ok]'
