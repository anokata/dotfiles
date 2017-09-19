#!/bin/bash

alias ls='ls --color=auto -XF --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
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
alias free='free -m'
alias df='df -h'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias tdl='tree -dL'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias end='systemctl poweroff'
# Git aliases
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gs='git status -sb'
alias gst='git status'

alias clr='clear'
alias gl='git log --pretty=oneline '
alias wcl='wc -l'
