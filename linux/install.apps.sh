#!/bin/bash

echo -e "Installing nb..."
sudo npm install -g nb.sh
sudo "$(which nb)" completions install
sudo "$(which nb)" env install
echo " done."


mkdir $HOME/dirs
mkdir $HOME/Dropbox

# git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
pip install ueberzug
pip install pynvim
sudo apt install python3-pynvim
npm install -g neovim
python2 -m pip install --user --upgrade pynvim
sudo apt install libxkbfile-dev
git clone https://github.com/grwlf/xkb-switch.git
