#!/bin/bash

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto -XF --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias youtube="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias youtubehi="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
alias youtubehq="youtube-dl -f 'bestvideo[height>=1080]+bestaudio/best[height>=1080]'"
alias youtubebest="youtube-dl -f 'bestvideo[height>=720]+bestaudio/best[height>=720]'"
alias youtuben="youtube-dl -f 'bestvideo[height>=72]+bestaudio/best[height>=720]' -o '%(title)s.%(ext)s' --restrict-filenames"
alias nano='nano -u -x'
alias sloc='cat *.c *.h | uniq | wc -l'
alias lk='ll | grep / | grep " \."'
alias dush='du -sh'
alias dushgm='du -sh | grep M'
alias dushgg='du -sh | grep G'
alias lld='ll -d */'
alias free='free -m'
alias df='df -h'
alias dh='df -h -x squashfs -x tmpfs'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias tdl='tree -dL'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias end='systemctl poweroff'
# Git aliases
alias ga='git add'
alias gcm='git commit -m'
#alias gp='git push'
alias gd='git diff'
alias gs='git status -sb'
alias gst='git status'
alias gpom='git push origin master'

alias clr='clear'
alias gl='git log --pretty=oneline '
alias wcl='wc -l'
alias psef='ps -ef'
alias psfe='ps -ef'
alias psa='ps aux'
alias psg='ps aux | grep '
alias adbstart='sudo adb start-server'
alias adbs='sudo adb start-server'

alias files='find | wc -l'
alias shot='sleep 1 && scrot'
alias psm='ps -ef | less'
alias psf='ps -ef | fzf'
alias lf='ls -lah | less'
alias lz='ls -lah | fzf'

# work
alias lognge='sudo tail -f /var/log/nginx/error.log'
alias lognga='sudo tail -f /var/log/nginx/access.log'
alias pdfone='pdfunite *.pdf one.pdf'

function djt() {
    djvutxt $1 | less
}
alias watchtime="watch -tc -n0.1 date +%T.%2N"
alias watchtm="watch -tc -n0.1 timed"
alias update="sudo pacman -Syu"
# feh image view
alias feh='feh -FYr --action1 ";save-file-copy $PWD/%N" --action2 ";clipboard-set $PWD/%N"'
alias fef='feh -f '
alias fer="feh -f $DEFAULT_REFLIST"
alias ref_anime="cd $REF_ANIME; fer"
alias ref_scr="cd $SCREENS_BASE; fer"
alias ref_scr2022="cd $SCREENS_DIR; fer"
alias ref_me="cd $REF_TOME; fer"
alias ref_art="cd $REF_ART; fer"
alias ref_paint="cd $REF_PAINT; fer"
alias ref_photo="cd $REF_PHOTO; fer"
alias ref_prn="cd $REF_PRN; fer"
alias ref_still="cd $REF_STILL; fer"
alias ref_study="cd $REF_STUDY; fer"
alias ref_forme="cd $REF_FORME; fer"
alias ref_manga="cd $REF_MANGA; fer"
alias ref_ppref="cd $REF_PPREF; fer"

alias m='mpv --opengl-es=yes'
alias p='ping ya.ru'
#alias gp='gp-2.11 ~/doc/gp'
alias gimp='gimp -f'
alias mpvsp='mpv --save-position-on-quit'
alias fehs="feh -D30 -z ."

# sys config
alias vimbash="vim ~/dotfiles/linux/.bashrc"

# links
alias lns="ln -s "

# sound
alias audio-devices="pacmd list-sinks | grep name:"
alias audio-switch-0="pacmd set-default-sink 0"
alias audio-switch-1="pacmd set-default-sink 1"
alias audio-switch-2="pacmd set-default-sink 2"
