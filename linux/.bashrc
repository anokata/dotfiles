#set -e
### PATH/ENV
set -o vi
source ~/dotfiles/linux/.env
# export TERM=screen-256color
# export TERM=xterm-256color

### Imports
source $DOTFILES_LINUX/bin/session/alias.sh
source $DOTFILES_LINUX/bin/session/color.sh
source $DOTFILES_LINUX/bin/session/tmux.sh
source $DOTFILES_LINUX/bin/session/bind.sh
source $DOTFILES_LINUX/bin/session/first_run.sh
source $DOTFILES_LINUX/bin/session/ndm.sh #work
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

### Plug
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden --hidden -g "!{node_modules/,.git/}"'
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash
if [ -e ~/.work.sig ]; then
    source ~/dotfiles/work/alias.sh
fi
[ -f  /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
[ -f  /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

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

function git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# export PS1="$GREY\u$GRAY@$GREY\w$R\$(git_dirty)$GRAY\$ $RESET"
export PS1="$GREY\w$B \$(git_branch)$R\$(git_dirty)$GRAY\$ $GRAY$RESET"
# export PS1="\[\033[1;32m\]\342\224\200\[\[\033[1;37m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\w\[\033[1;32m\]]\n\[\033[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274 [\[\e[01;33m\]$(date +%D-%r)\[\e[01;32m\]]\\$ \[\e[0m\]"

caps-escape

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


if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    echo "vscode"
    # nvm use system
elif [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
    echo "webstorm"
    # nvm use system
else
    _tmux_run
fi

