#!/bin/bash
#./install.config.sh
#./install.apps.sh
cd $DOTFILES_CONFIGS
DOTS=$(ls -d .* | grep -v / | grep '^\.')
DIRS=$(ls -d */)
CONFIG_DIR="$HOME/.config"
# echo $DIRS
# echo $DOTS
function makeIfNotExists() {
    echo "creating $file in $HOME"
    mkdir "$1" 2>/dev/null
}

function linkRemovingExisting() {
    echo "link to $1 in $HOME"
    ln "$1" $HOME
    # delete if exist
    # TODO
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

# each dir create in ~/.config/
# each dir files ln in  ~/.config/dir
