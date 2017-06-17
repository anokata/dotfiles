#!/bin/bash
RED='\033[01;31m'
WHITE='\033[01;00m'

function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
}
function git_dirty {
    status=$(git status --porcelain) 
    if [[ $status != "" ]]; then echo -e " $RED*$WHITE"; fi
}

