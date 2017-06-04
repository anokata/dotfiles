sudo pacman -S ctags
sudo pacman -S dmenu
sudo pacman -S git
sudo pacman -S xbindkeys
sudo pacman -S xorg-xmodmap
sudo pacman -S ttf-dejavu

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"

git clone http://github.com/anokata/dotfiles.git
mkdir -p ~/.config/i3
mkdir -p ~/.vim/autoload
cp dotfiles/Linux/configs/.vim/autoload/plug.vim ~/.vim/autoload/
cp dotfiles/.vimrc ~/
cat dotfiles/bashadd >> ~/.bashrc 
cp dotfiles/.tmux.conf ~/
cp dotfiles/Linux/bin/ -r ~/
cp dotfiles/.xprofile ~/
cp dotfiles/.xbindkeysrc ~/
cp dotfiles/Linux/configs/i3/config ~/.config/i3/
