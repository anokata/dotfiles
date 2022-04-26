#!/bin/bash
source $DOTFILES_SESSION/alias.sh
# echo -e "Installing nb..."
# sudo npm install -g nb.sh
# sudo "$(which nb)" completions install
# sudo "$(which nb)" env install
# echo " done."

# git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
#pip install ueberzug
#pip install pynvim
#sudo apt install python3-pynvim
#npm install -g neovim
#python2 -m pip install --user --upgrade pynvim
# sudo apt install libxkbfile-dev
# git clone https://github.com/grwlf/xkb-switch.git
#sudo pip install fzf-ueberzogen
#sudo npm install -g prettier-eslint-cli
# npm install -g neovim

echo -e "Installing apps: cli"
#for app in ${apps_cli[@]}; do
    #echo $app
    #sudo apt install $app
#done
#echo "done."

#cli only
sudo apt install tmux fzf fd-find bat gsmartcontrol htop jq libblkid1 mmv ncat ncdu nvme-cli ripgrep calcurse pwgen neovim -y
sudo apt install wget -y
sudo apt install imagemagick mpd mpc -y
sudo apt install tig wavemon aircrack-ng  -y
sudo apt install sshpass nmap whois arp-scan netdiscover -y
sudo apt install nodejs npm -y

# X cli
sudo apt install kitty -y

# X apps
sudo apt install xdotool xmacro xsel hsetroot gpick bspwm sxhkd polybar rofi lightdm-gtk-greeter lightdm -y
sudo apt install keepassxc transmission peek mpv flameshot scrot feh ffmpeg zathura zathura-djvu   -y
sudo apt install dunst libnotify-bin -y
#seahorse
#wireshark 

# sudo apt install nm-connection-editor nm-tool nm-applet laiph2Ch network-manager -y
# TODO nm in deb
# TODO in deb: sudo apt install vmstat nmon atop iotop iostat iftop -y


# need to load appimg/flatpack
#obs
#obsidian
#telegram
#slack
#dropbox

