#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
set -o vi
shopt -s histappend
shopt -s checkwinsize
stty -ixon # for not stop draw at C-s (C-q restore)
export PATH=$PATH:"/home/ksi/bin"
export PATH=$PATH:"/home/ksi/dotfiles/bin"
export PATH=$PATH:"/home/ksi/dotfiles/work"
export ANSIBLE_NOCOWS=1
export CLICOLOR="YES"
export TERM=xterm-256color
if [ -x ~/dotfiles/ ]; then
    source ~/dotfiles/lib.sh
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
export PS1="${DIST_SHORT}$BC\u$W@$BB\A$W\w$R\$(git_dirty)$W\$ "


if [ -f ~/dotfiles/xterm_trans ]; then
   ~/dotfiles/xterm_trans > /dev/null
fi

#loadkeys us-caps
#TEST
LINEOS_DIR=~/lineos
export PATH="$LINEOS_DIR/bin:$PATH"
#====

_try_tmux_run

