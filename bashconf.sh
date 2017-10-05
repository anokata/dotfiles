#!/bin/bash

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
set -o vi
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
stty -ixon # for not stop draw at C-s (C-q restore)
# for C-z do fg
#stty susp undef
#bind '"\C-z":"fg\015"'
bind -x '"\C-o"':"fg"

export PATH=$PATH:"/home/$(whoami)/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/work"
export PATH=~/.local/bin:$PATH
export ANSIBLE_NOCOWS=1
export WORK_DIR=~/
export CLICOLOR="YES"
#export TERM=xterm-256color
export TERM=screen-256color
if [ ! -z $(which java 2&>/dev/null) ]; then
    export JAVA_HOME=$(dirname $(dirname $(dirname $(readlink -f $(which java)))))
fi
if [ -x ~/dotfiles/ ]; then
    source ~/dotfiles/lib.sh
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#export PS1="${DIST_SHORT}$XX\u$W@$OX\A$W\w$R\$(git_dirty)$W\$ "
export PS1="$XX\u$W@$OX\A$W\w$R\$(git_dirty)$W\$ "


#if [ -f ~/dotfiles/xterm_trans ]; then
   #~/dotfiles/xterm_trans > /dev/null
#fi

#loadkeys us-caps
#TEST ==========================
LINEOS_DIR=~/lineos
export PATH="$LINEOS_DIR/bin:$PATH"

#PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && ls; __new_wd=$PWD' # ls after cding
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
shopt -s extglob
shopt -s cmdhist 
shopt -s dotglob     
shopt -s histappend
shopt -s cdspell
# make open cmd with switch by ext 
# if [ -f "$1" ] ; then
source /usr/share/git/completion/git-completion.bash
#==============================

if _is_console; then
    echo 
else
    _try_tmux_run
fi

