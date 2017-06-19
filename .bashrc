#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#MY
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export TERM=xterm-256color
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias youtube="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias nano='nano -u -x'
alias sloc='cat *.c *.h | uniq | wc -l'
alias lk='ll | grep / | grep " \."'
alias dush='du -sh'
alias dushgm='du -sh | grep M'
alias dushgg='du -sh | grep G'
alias lld='ll -d */'

RED='\[\033[01;31m\]'
REDne='\033[01;31m'
WHITE='\[\033[01;00m\]'
GREEN='\[\033[01;32m\]'
GREENne='\033[01;32m'
BLUE='\[\033[01;34m\]'
MG='\033[01;33m'
export PS1="$GREEN\u$WHITE@$BLUE\A$WHITE\w\$ "
set -o vi
shopt -s cdspell

#export PATH="/home/`whoami`/bin/:$PATH"
export PATH="/home/human/bin/:$PATH"

if [[ ! $(pgrep -f xbindkeys) ]]; then
	xbindkeys
fi


