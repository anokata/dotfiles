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
BL="\[\033[$_FORE;11m\]"
UC="\[\033[$_FORE;40m\]"
YX="\[\033[$_FORE;185m\]"
XX="\[\033[$_FORE;179m\]"
GRAY="\[\033[$_FORE;244m\]"
GREY="\[\033[$_FORE;250m\]"

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
