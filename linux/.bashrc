#set -e
### PATH/ENV
source ~/dotfiles/linux/.env
export TERM=screen-256color

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
# Move
bind -x '"\e[1;5A":"cd .."' # c-up
bind -x '"\e[1;5A":"cd -"' # c-left

# FM
bind -x '"\eOS":"ranger"' # F4
bind -x '"\e[1;5S":"ranger"' # C-F4
bind -x '"\e[1;6S":"tmux new-window ranger"' # C-S-F4
bind -x '"\e[15;5~":"fff"' # C-F5
bind -x '"\e[15~":"fff"' # F5
# list
#bind -x '"\e[15~":"ls"' # a-l 

# tmux
# bind -x '"\C-w":"tmux kill-pane"' # c-w
bind -x '"\C-n":"tmux new-window"' # c-n
bind -x '"\e[20;6~":"tmux new-window cmus"' # C-S-F9

## vim
bind -x '"\e[1;6P":"$EDITOR $DOTFILES"' # C-S-F1
bind -x '"\e[1;5P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # C-F1
bind -x '"\e[1;5Q":"$EDITOR $DOTFILES_LINUX/.bashrc"' # C-F2
bind -x '"\eOP":"$EDITOR"' # F1
bind -x '"\e[1;3P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # alt-F1
bind -x '"\C-f":"$EDITOR $(fzf)"' # C-e fzf and open in vim
bind -x '"\C-o":"$EDITOR $(fzf)"' # C-e fzf and open in vim

# Fav dirs
bind '"\e[1;5F":"cd $HDD1\C-m"' # C-num-1
bind '"\e[2;5~":"cd $HDD2\C-m"' # C-num-0
bind '"\e[1;5B":"cd $SSD\C-m"' # C-num-2
bind '"\e[6;5~":"cd $DOTFILES\C-m"' # C-num-3
# bind '"\e[1;":"cd $DOTFILES_LINUX\C-m"' # C-num-0
# bind '"\e[1;":"cd $DOTFILES_BIN\C-m"' # C-num-0
# bind '"\e[1;":"cd $DOTFILES_CONFIGS\C-m"' # C-num-0
# bind '"\e[1;":"cd $NOTES_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $WORK_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $BACKUPS\C-m"' # C-num-0
# bind '"\e[1;":"cd $LINKS_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $DRAW_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $SCREENS_BASE\C-m"' # C-num-0
# bind '"\e[1;":"cd $REF_BASE\C-m"' # C-num-0


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

