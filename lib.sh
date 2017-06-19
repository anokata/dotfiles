#!/bin/bash
source ~/dotfiles/bin/lib/color.sh

function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
}

#OS=$(lsb_release -si)
#http://linuxmafia.com/faq/Admin/release-files.html
DIST_COLOR=$W
DIST_SHORT=-
get_distro_name () {
    if [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        DIST_SHORT='U'
        DIST_COLOR=$BC
    elif [ -f /etc/debian_version ]; then
        DISTRO=debian
        DIST_SHORT='D'
        DIST_COLOR=$BM
    elif [ -f /etc/redhat-release ]; then
        DISTRO="Red Hat"
        DISTRO=$(cat /etc/redhat-release | cut -d" " -f 1)
        DIST_SHORT='C'
        DIST_COLOR=$BR
    # for arch
    elif [ -f /etc/arch-release ]; then 
        DISTRO="ARCH"
        DIST_SHORT='A'
        DISTRO=$(cat /etc/arch-release)
        DIST_COLOR=$BG
    fi
}
get_distro_name
DIST_SHORT=[${DIST_COLOR}$DIST_SHORT$W]

TMUX_SESSION_NAME=base
function _tmux_run () {
    if [ -z $TMUX ]; then
        echo 'not in tmux'
        if tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null; then
            echo 'attach'
            tmux attach -t $TMUX_SESSION_NAME
        else
            echo 'create'
            tmux new -s $TMUX_SESSION_NAME
        fi
    fi
}

_try_tmux_run () {
    if which tmux 1>/dev/null 2>/dev/null; then
        _tmux_run
    fi
}

if_which_and_not_run () {
    if which $1 > /dev/null 2>/dev/null; then 
        if ! pidof $1 > /dev/null 2>/dev/null; then 
            $1
        fi 
    fi 
}

function git_dirty {
    local status=$(git status --porcelain 2>/dev/null) 
    if [[ $status != "" ]]; then echo -e "*"; fi
}

getlast() { # Need in shell, not rename with _
    fc -ln "$1" "$1" | sed '1s/^[[:space:]]*//'
}
