#!/bin/bash
source $DOTFILES_LINUX/.env
source $DOTFILES_SESSION/alias.sh
cd $GITS_DIR
TMP_DIR=$(create-temp-ram-dir)

# LF (https://github.com/gokcehan/lf.git)
cd $TMP_DIR
LF_FILE='lf-linux-amd64.tar.gz'
wget https://github.com/gokcehan/lf/releases/download/r27/$LF_FILE
tar xf $LF_FILE
sudo mv lf /usr/bin/lf
rm $LF_FILE


# TODO: lfrun lfimg
cd $GITS_DIR
git clone https://github.com/cirala/lfimg.git
cd lfimg
make install
cd ..
rm -rf lfimg

# cp-p
git clone https://github.com/Naheel-Azawy/cp-p.git
cd cp-p
sudo make install
cd ..
rm -rf cp-p

# dropbox

cd $GITS_DIR

# echo "Please log in chrome account"
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

cd $GITS_DIR
# i yandex-disk
# wget  -O yandex.deb https://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
# sudo apt install ./yandex.deb -y
# TODO auth

# echo "Mega..."
# i megasync
# wget -O megacmd.deb https://mega.nz/linux/repo/Debian_11/amd64/megacmd_1.5.0-10.1_amd64.deb
# wget -O megasync.deb https://mega.nz/linux/repo/Debian_11/amd64/megasync_4.6.6-2.1_amd64.deb
# wget -O megathunar.deb https://mega.nz/linux/repo/Debian_11/amd64/thunar-megasync_4.3.0+4.3_amd64.deb
# sudo apt install ./megacmd.deb -y
# sudo apt install ./megasync.deb -y
# sudo apt install ./megathunar.deb -y
# TODO auth


echo "Telegram..."
wget https://telegram.org/dl/desktop/linux -O tg.tar.xz
tar xf tg.tar.xz
# ln Telegram $HOME/bin

apts gparted
apts ncmpcpp
apts rsync

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp


cd $GITS_DIR
git clone https://github.com/bigH/git-fuzzy.git

# TODO
# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
#	noto-fonts-cjk
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
#sudo powertop --auto-tune
#localepurge


# rofi-keepassx

# pip3 install instaloader
#https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
# poppler-utils # pdftotext
# opencc
# stardict
# sdcv
#apt install printer-driver-all cups
#Power
#sudo apt remove power-profiles-daemon
#network-manager-pptp-gnome
#translate-shell


# Not use now
# apts wine64
# apts gnugo
# atpi snapd
# sudo snap install slack
# sudo snap set system refresh.retain=2
# pureref
# xnview
# cd $GITS_DIR
# wget -O xnviewmp.deb https://download.xnview.com/XnViewMP-linux-x64.deb
# sudo apt install ./xnviewmp.deb -y
# pip install --user rofimoji
# apti ibus-typing-booster
# duf / can apt
# cd $GITS_DIR
# wget -O duf.deb https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
# sudo apt install ./duf.deb -y

