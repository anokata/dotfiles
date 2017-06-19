#!/bin/bash
RED='\033[01;31m'
WHITE='\033[01;00m'
readonly RESET="\[\033[0;37m\]" 
readonly K="\[\033[0;30m\]"    # black
readonly R="\[\033[0;31m\]"    # red
readonly G="\[\033[0;32m\]"    # green
readonly Y="\[\033[0;33m\]"    # yellow
readonly B="\[\033[0;34m\]"    # blue
readonly M="\[\033[0;35m\]"    # magenta
readonly C="\[\033[0;36m\]"    # cyan
readonly W="\[\033[0;37m\]"    # white
# emphasized (bolded) colors
readonly BK="\[\033[1;30m\]"
readonly BR="\[\033[1;31m\]"
readonly BG="\[\033[1;32m\]"
readonly BY="\[\033[1;33m\]"
readonly BB="\[\033[1;34m\]"
readonly BM="\[\033[1;35m\]"
readonly BC="\[\033[1;36m\]"
readonly BW="\[\033[1;37m\]"

function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
}

function git_dirty {
    local status=$(git status --porcelain 2>/dev/null) 
    if [[ $status != "" ]]; then echo -e "*"; fi
}

#OS=$(lsb_release -si)
get_distro_name () {
    if [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
    elif [ -f /etc/debian_version ]; then
        DISTRO=debian
    elif [ -f /etc/redhat-release ]; then
        DISTRO="Red Hat"
        DISTRO=$(cat /etc/redhat-release | cut -d" " -f 1)
    fi
    # for arch
}

