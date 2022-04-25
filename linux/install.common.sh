#!/bin/bash

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
