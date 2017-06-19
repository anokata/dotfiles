#!/bin/bash
readonly RESET="\[\033[0;37m\]" 
readonly K="\[\033[0;30m\]"    # black
readonly R="\[\033[0;31m\]"    # red
readonly G="\[\033[0;32m\]"    # green
readonly Y="\[\033[0;33m\]"    # yellow
readonly B="\[\033[0;34m\]"    # blue
readonly M="\[\033[0;35m\]"    # magenta
readonly C="\[\033[0;36m\]"    # cyan
readonly W="\[\033[0;37m\]"    # white
# emphasized (bolded) colors
readonly BK="\[\033[1;30m\]"
readonly BR="\[\033[1;31m\]"
readonly BG="\[\033[1;32m\]"
readonly BY="\[\033[1;33m\]"
readonly BB="\[\033[1;34m\]"
readonly BM="\[\033[1;35m\]"
readonly BC="\[\033[1;36m\]"
readonly BW="\[\033[1;37m\]"

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
