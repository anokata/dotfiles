pacman -Syu
pacman -S pptpclient grub efibootmgr os-prober

#makeinet

sudo pacman -S sudo tmux vim
sudo pacman -S ctags git tree htop
# X specific
sudo pacman -S i3 xorg-server xorg
sudo pacman -S xorg-xdm
sudo pacman -S xf86-video-intel
sudo pacman -S xterm
sudo pacman -S dmenu
sudo pacman -S xbindkeys
sudo pacman -S xorg-xmodmap
sudo pacman -S ttf-dejavu
sudo pacman -S i3 xorg-server xorg
sudo pacman -S xorg-xdm
sudo pacman -S xf86-video-intel
sudo pacman -S xterm
sudo pacman -S xcompmgr
sudo pacman -S transset-df
systemctl enable xdm
