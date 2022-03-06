
HISTCONTROL=ignoreboth
stty -ixon # for not stop draw at C-s (C-q restore)

# PATH
export PATH=$PATH:"/home/$(whoami)/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/bin"

# conf
set -o vi
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s extglob
shopt -s cmdhist 
shopt -s dotglob     
shopt -s histappend
shopt -s cdspell

[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

source ~/dotfiles/lib.sh

export PS1="$GREY\u$GRAY@$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"
