#!/bin/bash
source $DOTFILES_SESSION/alias.sh
function i() {
    sudo apt install $@ -y
}

echo -e "Installing apps: cli tools..."

#cli only
sudo apt install tmux fzf fd-find bat gsmartcontrol htop jq libblkid1 mmv ncat ncdu nvme-cli ripgrep calcurse pwgen neovim rdfind -y
sudo apt install wget gpg -y
sudo apt install imagemagick mpd mpc -y
sudo apt install tig wavemon aircrack-ng  -y
sudo apt install sshpass nmap whois arp-scan netdiscover -y
sudo apt install nodejs npm -y
i prettyping archivemount exa
i atop
i exuberant-ctags
i p7zip-full pv
i cpulimit 
i cmake curl

# X cli
sudo apt install kitty -y

# X apps
sudo apt install xdotool xmacro xsel hsetroot gpick bspwm sxhkd polybar rofi lightdm-gtk-greeter lightdm picom -y
sudo apt install keepassxc transmission transmission-cli peek mpv flameshot scrot feh ffmpeg zathura zathura-djvu   -y
sudo apt install dunst libnotify-bin -y
i pavucontrol
i fonts-firacode 
i sxiv
i guake

# fm for dragNdrop
i thunar 

# cli ext
## ueberzug
cd $(create-temp-ram-dir)
i bash-completion
i gcc libx11-dev libxext-dev libxres-dev
i python3 python3-pip
sudo pip3 install ueberzug
sudo pip3 install fzf-ueberzogen
sudo apt install python3-pynvim
sudo pip3 install pynvim



# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update -y
#sudo apt install code -y
# sudo apt-get install testdisk

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

i nethogs
i ninja-build meson
i nnn
i pwgen
i tcpdump
i tree
i screenkey
i ifmetric
#i duf

### Hat:Secure
# wireshark 
# tor
#curl wget gnupg2
#netcat

# i toilet
# obs
# i krita
# i pcmanfm 
# i seahorse
i proxycheck
i bc numlockx
i attr libncurses-dev gawk libjson-perl subversion
i net-tools
i telnet

i network-manager network-manager-pptp network-manager-ssh
i network-manager-gnome network-manager-pptp-gnome network-manager-ssh-gnome

i software-properties-common
i dnsutils
i ntp ntpstat
i linux-cpupower fancontrol
i ufw
i tftpd-hpa
# WARN: Only on Debian
# sudo apt-add-repository non-free
# apt-get update

# WINE
# winetricks -q mdac28
#env WINEPREFIX=~/.winecsp WINEARCH=win64 wineboot -u
#sudo winetricks --self-update
#sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -sc) main"
#atmlib corefonts d3dx10 d3dx11_42 d3dx11_43 d3dx9 gdiplus mfc140 msxml3 msxml6 vcrun2010 vcrun2012 vcrun2013 vcrun2015
#winetricks --optout --force -q msxml6
#winetricks arch=64 prefix=wine2 -q --force atmlib corefonts d3dx10 d3dx11_42 d3dx11_43 d3dx9 gdiplus mfc140 msxml3 msxml6 vcrun2010 vcrun2012 vcrun2013 vcrun2015
#winetricks arch=64 prefix=wine2 -q --force allfonts
# wget -nc https://dl.winehq.org/wine-builds/winehq.key
# sudo apt-key add winehq.key
#sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
#sudo apt install --install-recommends winehq-stable

# cdma 3g modem
# usb-modeswitch wvdial kppp modemmanager modem-manger-gui

# BT bluetooth: 
#i libspa-0.2-bluetooth pipewire blueman bluez
#pipewire-audio-client-libraries
#USERHID /etc/bluetooth/input.conf
