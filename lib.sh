#!/bin/bash
# vim: filetype=sh
source ~/dotfiles/bin/lib/color.sh
source ~/dotfiles/bin/lib/distro.sh
source ~/dotfiles/bin/lib/tmux.sh
source ~/dotfiles/bin/lib/alias.sh
source ~/dotfiles/bin/lib/ssh.sh
source ~/dotfiles/bin/lib/net.sh
source ~/dotfiles/bin/lib/first_run.sh
if [ -e ~/.work.sig ]; then
    source ~/dotfiles/bin/lib/work.sh
fi
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
    if ip link show ppp0 >/dev/null 2>/dev/null; then return; fi
    if ! _is_first_run; then return; fi

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
        # if exist
        #TODO
    fi
}

function _ubuntu() {
    echo ''
}

function _debian() {
    echo ''
}

function _distro_specific() {
    case $DIST_SYM in
        A) 
            if [ -e ~/.mobile.sig ]; then
                return
            fi
            _arch_net_connect
            xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
            if _is_first_run; then
                # TODO if in X
                xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
                setxkbmap -model pc105 -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle
                # or loadkeys
            fi
            ;;
        D) _debian;;
        U) _ubuntu
            
            if _is_first_run; then
                xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
            fi
            ;;
    esac
}

function _first_general() {
    if [ -e ~/.work.sig ]; then
        if _is_first_run; then 
            echo "Welcome to work!"
            #startone&
        fi
        export WORK_DIR=~/workprojects/refactor_support_django
    elif [ -e ~/.home.sig ]; then
        echo "Hi at home!"
        # TODO if_first_at_day
        if _is_first_run; then 
            echo "Hi new day!"
            amixer sset Headphone unmute
            amixer sset Headphone 100
            export WORK_DIR=~/doc
            (gnumeric&)
            (exec ~/dotfiles/bin/forecast&)
            gitpullall
        fi
    elif [ -e ~/.mobile.sig ]; then
        echo "Welcome mobile!"
    fi
}


# TODO OWN Conky at bash in terminal
# TODO simple scripts to aliases
# TODO CONKY who, distro?
#Other autostart need: 
# - weather, show in con, write to stat
# - currency
# - open gnumeric if first
###  end
_distro_specific
_first_general

_first_lock # must be at end
