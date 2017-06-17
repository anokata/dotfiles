#!/bin/bash
RED='\033[01;31m'
WHITE='\033[01;00m'
local RESET="\[\033[0;37m\]" 
local K="\[\033[0;30m\]"    # black
local R="\[\033[0;31m\]"    # red
local G="\[\033[0;32m\]"    # green
local Y="\[\033[0;33m\]"    # yellow
local B="\[\033[0;34m\]"    # blue
local M="\[\033[0;35m\]"    # magenta
local C="\[\033[0;36m\]"    # cyan
local W="\[\033[0;37m\]"    # white
# emphasized (bolded) colors
local BK="\[\033[1;30m\]"
local BR="\[\033[1;31m\]"
local BG="\[\033[1;32m\]"
local BY="\[\033[1;33m\]"
local BB="\[\033[1;34m\]"
local BM="\[\033[1;35m\]"
local BC="\[\033[1;36m\]"
local BW="\[\033[1;37m\]"

function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
}
function git_dirty {
    status=$(git status --porcelain) 
    if [[ $status != "" ]]; then echo -e " $RED*$WHITE"; fi
}

