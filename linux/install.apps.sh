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
