#!/bin/bash
source $DOTFILES_LINUX/.env
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
wget -O yandex.deb https://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
sudo apt install ./yandex.deb -y
# TODO auth

echo "Mega..."
# i megasync
wget -O megacmd.deb https://mega.nz/linux/repo/Debian_11/amd64/megacmd_1.5.0-10.1_amd64.deb
wget -O megasync.deb https://mega.nz/linux/repo/Debian_11/amd64/megasync_4.6.6-2.1_amd64.deb
wget -O megathunar.deb https://mega.nz/linux/repo/Debian_11/amd64/thunar-megasync_4.3.0+4.3_amd64.deb
sudo apt install ./megacmd.deb -y
sudo apt install ./megasync.deb -y
sudo apt install ./megathunar.deb -y
# TODO auth


echo "Telegram..."
wget https://telegram.org/dl/desktop/linux -O tg.tar.xz
tar xf tg.tar.xz
# ln Telegram $HOME/bin

echo "Slack..."

apts wine64
apts gnugo
apts gparted
apts ncmpcpp
apts rsync

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
# atpi snapd
# sudo snap install slack
# sudo snap set system refresh.retain=2
#pureref

# xnview
cd $GITS_DIR
wget -O xnviewmp.deb https://download.xnview.com/XnViewMP-linux-x64.deb
sudo apt install ./xnviewmp.deb -y

# NVM
# TODO

# duf
cd $GITS_DIR
wget -O duf.deb https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo apt install ./duf.deb -y

# obs
sudo apt install v4l2loopback-dkms
sudo apt install obs-studio

cd $GITS_DIR
git clone https://github.com/bigH/git-fuzzy.git

# virtualbox

# rofi-emoji / kaomoji-rofi
pip install --user rofimoji
# rofi-keepassx
### 
# pip3 install instaloader

# sudo adduser sernam
# sudo mkdir -p /home/sernam/.ssh
# sudo cp ~/.ssh/id_rsa* /home/sernam/.ssh/
# sudo chown -R sernam:sernam /home/sernam/*

#https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
#sudo apt install ibus-chewing
#fcitx5
#	noto-fonts-cjk
# poppler-utils # pdftotext
# opencc
