git clone http://github.com/anokata/dotfiles.git
mkdir -p ~/.vim/autoload
cp dotfiles/Linux/configs/.vim/autoload/plug.vim ~/.vim/autoload/
cp dotfiles/.vimrc ~/
sudo pacman -S ctags
git config --global user.name "anokata"
git config --global user.email "anokata8@mail.ru"
cat dotfiles/bashadd >> ~/.bashrc 
cp dotfiles/.tmux.conf ~/
sudo pacman -S dmenu
cp dotfiles/Linux/bin/ -r ~/
