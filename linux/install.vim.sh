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


# :CocInstall coc-tsserver
