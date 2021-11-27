set -o vi
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
#ZSH_DISABLE_COMPFIX="true"

if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
#compinit
compinit -i
fi

autoload bashcompinit && bashcompinit

#zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

if [ -f ~/.git-completion.zsh ]; then
#  . ~/.git-completion.zsh
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\[\033[0;31m\]\$(date +%H:%M) \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

source ~/.bash_aliases
