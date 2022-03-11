#mons -s || true
#amixer sset Headphone unmute || true
#amixer sset Headphone 100 || true
#tabletrev 15

setxkbmap -option caps:escape

### PATH
export PATH=$PATH:"/home/$(whoami)/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/linux/bin"
export DOC=https://anokata@bitbucket.org/anokata/doc.git
export DOTFILES="/home/$(whoami)/dotfiles"
export DEFAULT_REFLIST="reflist.list"
export SCREENS_DIR="/home/$(whoami)/data/screens/scr2022/"
export SCREENS_DIR_MEDIA="/home/$(whoami)/data/screens/scr2022/media/"

### Bash config
set -o vi
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s extglob
shopt -s cmdhist 
shopt -s dotglob     
shopt -s histappend
shopt -s cdspell
stty -ixon # for not stop draw at C-s (C-q restore)
HISTCONTROL=ignoreboth

### Plug
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

source ~/dotfiles/linux/bin/session/alias.sh
source ~/dotfiles/linux/bin/session/color.sh
source ~/dotfiles/linux/bin/session/tmux.sh
source ~/dotfiles/linux/bin/session/first_run.sh
if [ -e ~/.work.sig ]; then
    source ~/dotfiles/work/alias.sh
fi

if _is_first_run; then
    echo first
    #xbindkeys&
fi


function _ram() {
    mkdir /run/user/$(id -u)/ram 2>/dev/null || true
    rmdir ~/ram 2>/dev/null || true
    ln -s /run/user/$(id -u)/ram ~/  2>/dev/null || true
}

function git_dirty {
    local status=$(git status --porcelain 2>/dev/null) 
    if [[ $status != "" ]]; then echo -e "*"; fi
}

export PS1="$GREY\u$GRAY@$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"

#_ram

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    echo "hi vscode"
else
    _tmux_run
fi

