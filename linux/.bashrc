set -o vi
source ~/dotfiles/linux/.env
# export TERM=screen-256color
# export TERM=xterm-256color

### Imports
source $DOTFILES_LINUX/bin/session/alias.sh
source $DOTFILES_LINUX/bin/session/color.sh
source $DOTFILES_LINUX/bin/session/tmux.sh
source $DOTFILES_LINUX/bin/session/bind.sh
source $DOTFILES_LINUX/bin/session/ndm.sh # work related aliases and variables
source $DOTFILES_LINUX/bin/session/sec.sh
LFCD="$DOTFILES_CONFIGS/lf/lfcd.sh"
[ -f "$LFCD" ] && source "$LFCD"
eval $(dircolors $DOTFILES_CONFIGS/.dir_colors)

### Bash config
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

### Plugins
#### FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden --hidden -g "!{node_modules/,.git/}"'
[ -f  /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
[ -f  /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
#### Completion
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

# pidof sxhkd >/dev/null || (nohup sxhkd >/dev/null 2>&1 & disown) # wm (bspwm) run sxhkd, no?

# setxkbmap -option caps:escape # make caps = escape
caps-escape # make caps = escape

# Create link to ram directory in home
function _ram() {
    mkdir /run/user/$(id -u)/ram 2>/dev/null || true
    rmdir ~/ram 2>/dev/null || true
    ln -s /run/user/$(id -u)/ram ~/  2>/dev/null || true
}

function git_dirty {
    local status=$(git status --porcelain 2>/dev/null) 
    if [[ $status != "" ]]; then echo -e "*"; fi
}

function git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="$GREY\w$B \$(git_branch)$R\$(git_dirty)$GRAY\$ $GRAY$RESET"


# ? use nvmrc from current directory on change directory
_nvmrc_hook() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi
  
  PREV_PWD=$PWD
  [[ -f ".nvmrc" ]] && nvm use
}

if ! [[ "${PROMPT_COMMAND:-}" =~ _nvmrc_hook ]]; then
  PROMPT_COMMAND="_nvmrc_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi


# Avoid running tmux session in vscode and webstorm
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    echo "vscode"
    # nvm use system
elif [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
    echo "webstorm"
    # nvm use system
else
    _tmux_run
fi

# wayland caps esc ?
export XKB_DEFAULT_OPTIONS=caps:escape
