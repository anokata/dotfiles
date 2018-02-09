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
#export WORK_DIR=~/work/portal
export CLICOLOR="YES"
#export TERM=xterm-256color
export TERM=screen-256color
if [ ! -z $(which java 2&>/dev/null) ]; then
    export JAVA_HOME=$(dirname $(dirname $(dirname $(readlink -f $(which java)))))
fi
if [ -x ~/dotfiles/ ]; then
    source ~/dotfiles/lib.sh
fi

#export PS1="${DIST_SHORT}$XX\u$W@$OX\A$W\w$R\$(git_dirty)$W\$ "
export PS1="$GREY\u$GRAY@$GREY\A$GRAY\w$R\$(git_dirty)$GRAY\$ $RESET$B"


#if [ -f ~/dotfiles/xterm_trans ]; then
   #~/dotfiles/xterm_trans > /dev/null
#fi

#loadkeys us-caps
#TEST ==========================
#PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && ls; __new_wd=$PWD' # ls after cding
shopt -s extglob
shopt -s cmdhist 
shopt -s dotglob     
shopt -s histappend
shopt -s cdspell
# make open cmd with switch by ext 
# if [ -f "$1" ] ; then
#==============================

if _is_console; then
    echo 
else
    if [ -e ~/.home.sig -o -e ~/.work.sig ]; then 
        _try_tmux_run
    fi
fi

# make For small scripts - alias, functions
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

if _is_console; then
    (sleep 3; startx)
fi
