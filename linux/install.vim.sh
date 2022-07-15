#!/bin/bash
source $DOTFILES_LINUX/install.common.sh
PROD=0
[ "$1" = "-p" ] && PROD=1

cd $DOTFILES_CONFIGS/.vim
VIM_DIR="$HOME/.vim/"

if [ $PROD -eq 1 ]; then
    DIRS=$(ls -d */)
fi

echo ">>> Creating and linking vim dirs"
for dir in $DIRS; do 
    if [[ -d "$dir" ]]; then
        makeIfNotExists "$VIM_DIR/$dir"
        linkAllRemovingExisting "$VIM_DIR/$dir" "$dir"
    fi
done

nvim -c :PlugInstall
nvim -c :CocInstall coc-tsserver coc-json coc-html coc-css coc-eslint
#coc-angular
nvim -c :TSUpdate
nvim -c :TSInstall typescript javascript
nvim -c :TSInstall css scss json html
nvim -c :TSInstall markdown bash make vim

echo '>>> Remove vim/plugged/*/.git dirs'
cd $VIM_DIR/plugged
for dir in `ls -1 | rg /`; do
    rm -rf $dir/.git
done

# npm install -g neovim
# sudo npm install -g prettier-eslint-cli

echo '<<< Vim setup done'
