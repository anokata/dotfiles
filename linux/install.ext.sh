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
sudo apt install ./yandex.deb
# TODO auth

echo "Mega..."
# i megasync
wget -O megacmd.deb https://mega.nz/linux/repo/Debian_11/amd64/megacmd_1.5.0-10.1_amd64.deb
wget -O megasync.deb https://mega.nz/linux/repo/Debian_11/amd64/megasync_4.6.6-2.1_amd64.deb
wget -O megathunar.deb https://mega.nz/linux/repo/Debian_11/amd64/thunar-megasync_4.3.0+4.3_amd64.deb
sudo apt install ./megacmd.deb ./megasync.deb ./megathunar.deb
# TODO auth


echo "Telegram..."
wget https://telegram.org/dl/desktop/linux -O tg.tar.xz
tar xf tg.tar.xz
# ln Telegram $HOME/bin

echo "Slack..."

# rofi-emoji / kaomoji-rofi
# rofi-keepassx
# sudo snap set system refresh.retain=2
