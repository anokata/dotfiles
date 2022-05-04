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
sudo apt install wget -y
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
i 7z pv

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

