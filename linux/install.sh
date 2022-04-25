#!/bin/bash
PROD=0
[ "$1" = "-p" ] && PROD=1

if [ $PROD -eq 1 ]; then
    DOTS=$(ls -d .* | grep -v / | grep '^\.')
    DIRS=$(ls -d */)
    FILES=$(ls -p | grep -v /)
else
    DOTS='.xbindkeysrc .vifm'
    DIRS='mypaint'
    FILES='configs.list'
    FILES=$(ls -p | grep -v /)
fi

cd $DOTFILES_CONFIGS
CONFIG_DIR="$HOME/.config"

function makeIfNotExists() {
    echo "creating $1"
    mkdir "$1" 2>/dev/null
}

function linkRemovingExisting() {
    path="$1"
    file="$2"
    echo "link $file to $path"
    # delete if exist
    [ -f "$path/$file" ] && rm "$path/$file"
    ln "$file" "$path"
}

function linkAllRemovingExisting() {
    path="$1"
    dir="$2"
    echo "link to $2/* in $path"
    # delete all if exist
    [ -d "$path" ] && rm "$path"/* 2>/dev/null
    ln "$dir"/* "$path"
}

echo ">>> Creating and linking dot files in HOME"
for file in $DOTS; do 
    #filter . ..
    [ "$file" = '.' ] || [ "$file" = '..' ] && continue

    if [[ -d "$file" ]]; then
        # Dir
        makeIfNotExists "$HOME/$file"
    elif [[ -f "$file" ]]; then
        # each .file ln in HOME
        linkRemovingExisting "$HOME" "$file"
    fi
done

echo ">>> Creating and linking dot files in .config"
for dir in $DIRS; do 
    if [[ -d "$dir" ]]; then
        # each dir create in ~/.config/
        makeIfNotExists "$HOME/.config/$dir"
        # each dir files ln in  ~/.config/dir
        linkAllRemovingExisting "$CONFIG_DIR/$dir" "$dir"
    fi
done

echo ">>> Creating and linking files in .config"
echo $FILES
for file in $FILES; do 
    if [[ -f "$file" ]]; then
        # each file ln in .confg
        linkRemovingExisting "$CONFIG_DIR" "$file"
    fi
done

echo "=== done ==="
