#!/bin/bash
source ~/dotfiles/bin/lib/color.sh
source ~/dotfiles/bin/lib/distro.sh
source ~/dotfiles/bin/lib/tmux.sh
source ~/dotfiles/bin/lib/alias.sh
source ~/dotfiles/bin/lib/ssh.sh
source ~/dotfiles/bin/lib/net.sh
source ~/dotfiles/bin/lib/first_run.sh
#source ~/dotfiles/bin/lib/*.sh #???

function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
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

### Develop zone ###

function _arch_net_connect() {
    # https://wiki.archlinux.org/index.php/Getty#Virtual_console
    if ip link show ppp0 >/dev/null 2>/dev/null; then return; fi
    #if ! _is_first_run; then return; fi

    echo -n "Up $ETH..."
    sudo ip link set $ETH up
    sleep 0.1
    sudo dhcpcd 
    sleep 0.1
    echo 'ok'

    if ping -c1 inet.atel.me >/dev/null 2>/dev/null; then
        _net_arch_pptp
    else
        echo 'try wifi'
        #TODO
    fi
}

function _dev() {
    case $DIST_SYM in
        A) _arch_net_connect;;
        D) echo debian;;
        U) echo 'ubuntu';;
    esac
}
_dev

###  end
_first_lock # must be at end
