#mons -s || true
#amixer sset Headphone unmute || true
#amixer sset Headphone 100 || true
#tabletrev 15

setxkbmap -option caps:escape

### PATH
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:"/home/$(whoami)/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/bin"
export PATH=$PATH:"/home/$(whoami)/dotfiles/linux/bin"
export DOC=https://anokata@bitbucket.org/anokata/doc.git
export DOTFILES="/home/$(whoami)/dotfiles"
export DEFAULT_REFLIST="reflist.list"
export SCREENS_BASE="/home/$(whoami)/data/screens/"
export SCREENS_DIR="/home/$(whoami)/data/screens/scr2022/"
export SCREENS_DIR_MEDIA="/home/$(whoami)/data/screens/scr2022/media/"
# TODO: to list, and gen aliases and update. or use node
export REF_BASE="/home/$(whoami)/data/draw"
export REF_ANIME="${REF_BASE}/refAnimePrn"
export REF_TOME="${REF_BASE}/ref_0ForMeHuman"
export REF_ART="${REF_BASE}/ref_art"
export REF_PAINT="${REF_BASE}/ref_paintings"
export REF_PHOTO="${REF_BASE}/ref_photo"
export REF_PRN="${REF_BASE}/ref_prnphoto"
export REF_STILL="${REF_BASE}/ref_still_life"
export REF_STUDY="${REF_BASE}/ref_study"
export REF_FORME="${REF_BASE}/ref_0ForMe"
export REF_MANGA="${REF_BASE}/ref_art_MangaJap"
export REF_PPREF="${REF_BASE}/PPref"

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
    #pidof xbindkeys >/dev/null || xbindkeys&
    tablet-small
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

