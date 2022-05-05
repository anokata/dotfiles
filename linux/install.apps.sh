#!/bin/bash
source $DOTFILES_SESSION/alias.sh
function i() {
    sudo apt install $@ -y
}

echo -e "Installing apps: cli"
#for app in ${apps_cli[@]}; do
    #echo $app
    #sudo apt install $app
#done
#echo "done."

#cli only
sudo apt install tmux fzf fd-find bat gsmartcontrol htop jq libblkid1 mmv ncat ncdu nvme-cli ripgrep calcurse pwgen neovim -y
sudo apt install wget gpg -y
sudo apt install imagemagick mpd mpc -y
sudo apt install tig wavemon aircrack-ng  -y
sudo apt install sshpass nmap whois arp-scan netdiscover -y
sudo apt install nodejs npm -y
i prettyping archivemount
i atop
#BT: blueman bluez

# X cli
sudo apt install kitty -y

# X apps
sudo apt install xdotool xmacro xsel hsetroot gpick bspwm sxhkd polybar rofi lightdm-gtk-greeter lightdm -y
sudo apt install keepassxc transmission peek mpv flameshot scrot feh ffmpeg zathura zathura-djvu   -y
sudo apt install dunst libnotify-bin -y
cd $(create-temp-ram-dir)

# cli ext
## ueberzug
i gcc libx11-dev libxext-dev libxres-dev
i python3 python3-pip
sudo pip3 install ueberzug
sudo pip3 install fzf-ueberzogen
sudo apt install python3-pynvim
sudo pip3 install pynvim
#sudo npm install -g prettier-eslint-cli


i pavucontrol
i fonts-firacode 
i exuberant-ctags
i p7zip-full pv

# fm for dragNdrop
i thunar 
# i pcmanfm 

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y

#i cmake

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb -y

#wireshark 
#telegram
#slack
#obs
#TODO: dropbox

#seahorse
# sudo apt install nm-connection-editor nm-tool nm-applet laiph2Ch network-manager -y
# TODO in deb: sudo apt install vmstat nmon atop iotop iostat iftop -y
# TODO list all apps and select

# need to load appimg/flatpack
#obsidian

