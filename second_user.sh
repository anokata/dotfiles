sudo pacman -S sudo tmux vim
sudo pacman -S ctags
sudo pacman -S git
sudo pacman -S tree htop
# X specific
sudo pacman -S dmenu
sudo pacman -S xbindkeys
sudo pacman -S xorg-xmodmap
sudo pacman -S ttf-dejavu
sudo pacman -S i3 xorg-server xorg
sudo pacman -S xorg-xdm
sudo pacman -S xf86-video-intel
sudo pacman -S xterm


xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"

git clone http://github.com/anokata/dotfiles.git
#./dotfiles/vans/ansible.sh
cp dotfiles/Linux/bin/ -r ~/

cat dotfiles/bashadd >> ~/.bashrc 
mkdir -p ~/.config/i3
mkdir -p ~/.vim/autoload
cp dotfiles/Linux/configs/.vim/autoload/plug.vim ~/.vim/autoload/
cp dotfiles/.vimrc ~/
cp dotfiles/.tmux.conf ~/
cp dotfiles/.xprofile ~/
cp dotfiles/.xbindkeysrc ~/
cp dotfiles/Linux/configs/i3/config ~/.config/i3/
