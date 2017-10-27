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
    source ~/dotfiles/work/alias.sh
fi
#source ~/dotfiles/bin/lib/*.sh #???

function _is_console() {
    echo $(tty) | grep tty
}

function _prompt() {
    read -p "$1 [y/N]? " -n 1
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo ""
    fi
}

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
            if [ -e ~/.home.sig ]; then
                _arch_net_connect
            fi
            setxkbmap -model pc105 -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle
            xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
            if _is_first_run; then
                # TODO if in X
                setxkbmap -model pc105 -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle
                xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
                # or loadkeys
                # in console only:
                if _is_console; then
                    setterm -blength 0
                fi
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
    #if _is_first_tty_run; then
        #startx&
    #fi
    if [ -e ~/.work.sig ]; then
        if _is_first_tty_run; then
            echo "Welcome to work!"
            mkdir /run/user/$(id -u)/Downloads || true
            rmdir ~/Downloads || true
            ln -s /run/user/$(id -u)/Downloads ~/ || true
            sudo ~/dotfiles/net/wistart
            ip link set $ETH up
            sudo dhcpcd
        fi
        if _is_first_run; then 
            xbacklight -set 20 || true
            work
        fi
        export WORK_DIR=~/work/support3
    elif [ -e ~/.home.sig ]; then
        #echo "Hi at home!"
        # TODO if_first_at_day
        if _is_first_run; then 
            echo "Hi new day!"
            amixer sset Headphone unmute
            amixer sset Headphone 100
            export WORK_DIR=~/doc
            (gnumeric&)
            (firefox&)
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

if _is_console; then
    _first_con_lock
else
    _first_lock # must be at end
fi
