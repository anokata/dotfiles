#!/bin/bash
RESET="\[\033[0;37m\]" 
K="\[\033[0;30m\]"    # black
R="\[\033[0;31m\]"    # red
G="\[\033[0;32m\]"    # green
Y="\[\033[0;33m\]"    # yellow
B="\[\033[0;34m\]"    # blue
M="\[\033[0;35m\]"    # magenta
C="\[\033[0;36m\]"    # cyan
W="\[\033[0;37m\]"    # white
# emphasized (bolded) colors
BK="\[\033[1;30m\]"
BR="\[\033[1;31m\]"
BG="\[\033[1;32m\]"
BY="\[\033[1;33m\]"
BB="\[\033[1;34m\]"
BM="\[\033[1;35m\]"
BC="\[\033[1;36m\]"
BW="\[\033[1;37m\]"

_FORE="38;5"
_BACK="48;5"
OX="\[\033[$_FORE;214m\]"
YX="\[\033[$_FORE;185m\]"
XX="\[\033[$_FORE;179m\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -XF --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
