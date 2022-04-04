#set -e
### PATH/ENV
source ~/dotfiles/linux/.env
#export TERM=screen-256color

### Imports
source ~/dotfiles/linux/bin/session/alias.sh
source ~/dotfiles/linux/bin/session/color.sh
source ~/dotfiles/linux/bin/session/tmux.sh
source ~/dotfiles/linux/bin/session/first_run.sh
source ~/dotfiles/linux/bin/session/ndm.sh #work

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
bind -m vi-command '"v": abort'

# Bindings
# FM
bind -x '"\eOS":"ranger"' # F4
bind -x '"\e[1;5S":"ranger"' # C-F4
bind -x '"\e[1;6S":"tmux new-window ranger"' # C-S-F4
bind -x '"\e[15;5~":"nnn"' # C-F5
bind -x '"\e[15~":"nnn"' # F5

bind -x '"\e[20;6~":"tmux new-window cmus"' # C-S-F9

## vim
bind -x '"\e[1;6P":"$EDITOR $DOTFILES"' # C-S-F1
bind -x '"\e[1;5P":"$EDITOR"' # C-F1
bind -x '"\eOP":"$EDITOR"' # F1
bind -x '"\e[1;3P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # alt-F1
bind -x '"\C-f":"$EDITOR $(fzf)"' # C-e fzf and open in vim
bind -x '"\C-o":"$EDITOR $(fzf)"' # C-e fzf and open in vim

#


### Plug
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/,.git/}"'
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash
if [ -e ~/.work.sig ]; then
    source ~/dotfiles/work/alias.sh
fi

#if _is_first_run; then
#fi

pidof sxhkd >/dev/null || (nohup sxhkd >/dev/null 2>&1 & disown)
setxkbmap -option caps:escape

function _ram() {
    mkdir /run/user/$(id -u)/ram 2>/dev/null || true
    rmdir ~/ram 2>/dev/null || true
    ln -s /run/user/$(id -u)/ram ~/  2>/dev/null || true
}

function git_dirty {
    local status=$(git status --porcelain 2>/dev/null) 
    if [[ $status != "" ]]; then echo -e "*"; fi
}

# export PS1="$GREY\u$GRAY@$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"
export PS1="$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"


if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    echo "vscode"
else
    _tmux_run
fi

