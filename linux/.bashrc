#xmodmap -e "clear lock" #disable caps lock switch
#xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
#setxkbmap -option caps:swapescape
#/usr/bin/setxkbmap -option "caps:swapescape"
setxkbmap -option caps:escape

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

source ~/dotfiles/linux/lib.sh

export PS1="$GREY\u$GRAY@$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"
