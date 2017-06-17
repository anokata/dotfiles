pacman -Syu
pacman -S pptpclient grub efibootmgr os-prober

#makeinet

pacman -S sudo tmux vim
pacman -S ctags git tree htop
# X specific
pacman -S xorg-server xorg xorg-xdm xf86-video-intel xterm dmenu xbindkeys xorg-xmodmap ttf-dejavu i3 xcompmgr transset-df xorg-xinit xorg-xconsole
systemctl enable xdm
pacman -S coreutils
pacman -S openssh
pacman -S wget
pacman -S transmission-gtk
pacman -S ncdu
# netstat lsof tcpdump vifm tree
# DEV gcc g++ libncurses libcurl gdb valgrind  freeglut3  lxc
# lxc lxc-templates systemd-services cgroup-bin   bridge-utils debootstrap
# aircrack-ng  TODO(arch crack? kali list)
# mplayer ?mpv cmus ?mupdf youtube-dl(python) netsurf fbreader valac at dialog sdcv mtpaint ?gimp gnumeric scrot ffmpeg xdotool
# python pip
# ?localepurge
# zip unzip rar
# viber yandexdisk/dropbox
# xbacklight iostat meminfo mpstat nmon

