#!/bin/bash
cd $DOTFILES_CONFIGS
# DOTS=$(ls -d .* | grep -v / | grep '^\.')
# TODO TEST
DOTS='.xbindkeysrc .vifm'
DIRS=$(ls -d */)
CONFIG_DIR="$HOME/.config"

function makeIfNotExists() {
    echo "creating $1"
    mkdir "$1" 2>/dev/null
}

function linkRemovingExisting() {
    echo "link to $HOME/$1"
    # delete if exist
    [ -f "$HOME/$1" ] && rm "$HOME/$1"
    ln "$1" $HOME
}

echo "Creating and linking dot files in HOME"
for file in $DOTS; do 
    #filter . ..
    [ "$file" = '.' ] || [ "$file" = '..' ] && continue

    if [[ -d "$file" ]]; then
        # Dir
        makeIfNotExists "$HOME/$file"
    elif [[ -f "$file" ]]; then
        # each .file ln in HOME
        linkRemovingExisting "$file"
    fi
done

echo "Creating and linking dot files in .config"
for dir in $DIRS; do 
    # each dir create in ~/.config/
    if [[ -d "$dir" ]]; then
        makeIfNotExists "$HOME/.config/$dir"
    fi
    # each dir files ln in  ~/.config/dir
    # TODO
done
