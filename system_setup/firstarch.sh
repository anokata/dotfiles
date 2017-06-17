pacman -Syu
pacman -S pptpclient grub efibootmgr os-prober

#makeinet

pacman -S sudo tmux vim
pacman -S ctags git tree htop
# X specific
pacman -S xorg-server xorg xorg-xdm xf86-video-intel xterm dmenu xbindkeys xorg-xmodmap ttf-dejavu i3 xcompmgr transset-df xorg-xinit xorg-xconsole
systemctl enable xdm
pacman -S coreutils
