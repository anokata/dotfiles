#!/bin/bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdd="cd $DOTFILES"
alias cda="cd $HDD1"
alias cdb="cd $HDD2"
alias cds="cd $SSD"
alias cdc="cd $DOTFILES_CONFIGS"
alias cdl="cd $LINKS_DIR"
alias cdn="cd $WORK_DIR"
alias cdn3="cd $WORK_DIR/ndw3-without-isw/"

# Files info
alias l='ls -CF'
alias la='ls -A'
alias lf='ls -lah | less'
alias lk='ll | grep / | grep " \."'
alias ll='ls -alFh'
alias lld='ll -d */'
alias ls='ls --color=auto -XF --group-directories-first'
alias lz='ls -lah | fzf'
alias dush='du -sh'
alias dushgm='du -sh | grep M'
alias dushgg='du -sh | grep G'
alias df='df -h'
alias dh='df -h -x squashfs -x tmpfs'
alias tdl='tree -dL'
alias sloc='cat *.c *.h | uniq | wc -l'
alias wcl='wc -l'
alias files='find | wc -l'
alias dd='dd status=progress '
alias bat="batcat"
alias fzf="fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:70%:wrap"
alias vim="nvim"
alias notes='vim `fzf`'

# links
alias lns="ln -s "
alias lnsn="ln -s -n "
alias lnsnr="ln -s -n -r "

# System info
alias free='free -m'
alias psef='ps -ef'
alias psfe='ps -ef'
alias psa='ps aux'
alias psg='ps aux | grep '
alias psm='ps -ef | less'
alias psf='ps -ef | fzf'
alias p='ping ya.ru'
alias sys-ram='sudo dmidecode -t 17'

# Finding
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias fd='fdfind'
alias fde='fd -e '
alias fdh='fd -H '

# Video download
alias youtube="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias youtubehi="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
alias youtubehq="youtube-dl -f 'bestvideo[height>=1080]+bestaudio/best[height>=1080]'"
alias youtubebest="youtube-dl -f 'bestvideo[height>=720]+bestaudio/best[height>=720]'"
alias youtuben="youtube-dl -f 'bestvideo[height>=72]+bestaudio/best[height>=720]' -o '%(title)s.%(ext)s' --restrict-filenames"

# editors
alias nano='nano -u -x'
alias nv='nvim'

# Git aliases
alias ga='git add'
alias gcm='git commit -m'
alias gd='git diff'
alias gs='git status -sb'
alias gst='git status'
alias gpom='git push origin master'
alias gl='git log --pretty=oneline '
alias gph='git push'

# Dev
alias adbstart='sudo adb start-server'
alias adbs='sudo adb start-server'
alias lognge='sudo tail -f /var/log/nginx/error.log'
alias lognga='sudo tail -f /var/log/nginx/access.log'

alias pdfone='pdfunite *.pdf one.pdf'
alias djvu-txt='djvutxt $1 | less'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias watchtime="watch -tc -n0.1 date +%T.%2N"
alias watchtm="watch -tc -n0.1 timed"
alias update="sudo pacman -Syu"
alias end='systemctl poweroff'
alias clr='clear'

# feh image view and refs
alias fehs="feh -D30 -z ."
alias feh='feh -FYr --action1 ";save-file-copy %F" --action2 ";clipboard-set %F"'
alias fef='feh -f '
alias fer="feh -f $DEFAULT_REFLIST"
alias ref-anime="cd $REF_ANIME; fer"
alias ref-scr="cd $SCREENS_BASE; fer"
alias ref-scr2022="cd $SCREENS_DIR; fer"
alias ref-me="cd $REF_TOME; fer"
alias ref-art="cd $REF_ART; fer"
alias ref-paint="cd $REF_PAINT; fer"
alias ref-photo="cd $REF_PHOTO; fer"
alias ref-prn="cd $REF_PRN; fer"
alias ref-still="cd $REF_STILL; fer"
alias ref-study="cd $REF_STUDY; fer"
alias ref-forme="cd $REF_FORME; fer"
alias ref-manga="cd $REF_MANGA; fer"
alias ref-ppref="cd $REF_PPREF; fer"

# sys config
alias xresources-reload='xrdb ~/.Xresources'
alias config-bash="$EDITOR $DOTFILES/linux/.bashrc"
alias config-alias="$EDITOR $DOTFILES_BIN/session/alias.sh && bashrc-reload"
alias config-tmux="$EDITOR $DOTFILES_CONFIGS/.tmux.conf"
alias config-bspwm="$EDITOR $DOTFILES_CONFIGS/bspwm/bspwmrc"
alias config-sxhkd="$EDITOR $DOTFILES_CONFIGS/sxhkd/sxhkdrc"
alias config-polybar="$EDITOR $DOTFILES_CONFIGS/polybar/config.ini"
alias config-vim="$EDITOR $DOTFILES_CONFIGS/.vimrc"
alias config-nvim="$EDITOR $DOTFILES_CONFIGS/nvim/init.vim"
alias config-xresources="$EDITOR $DOTFILES_CONFIGS/.Xresources; xresources-reload"
alias config-sxhkd-reload="pkill -USR1 -x sxhkd"
alias config-polybar-reload="killall polybar ; polybar bottom &"
alias bashrc-reload="source ~/dotfiles/linux/.bashrc"
alias config-bashrc-reload="source $DOTFILES/linux/.bashrc"
alias config-bashlibs="$EDITOR $DOTFILES/linux/bin/session"
alias config-ranger="$EDITOR $DOTFILES_CONFIGS/ranger/"
alias config-env="$EDITOR $DOTFILES_LINUX/.env && bashrc-reload"
alias config-draw-mypaint-brushes="$EDITOR $MYPAINT_BRUSHES"
alias config-draw-mypaint="$EDITOR $MYPAINT"
alias config-kitty="$EDITOR $DOTFILES_CONFIGS/kitty/kitty.conf"


# sound
alias audio-devices="pacmd list-sinks | grep name:"
alias audio-switch-0="pacmd set-default-sink 0"
alias audio-switch-1="pacmd set-default-sink 1"
alias audio-switch-2="pacmd set-default-sink 2"
alias audio-switch-3="pacmd set-default-sink 3"

# apps
alias m='mpv --opengl-es=yes'
alias gimp='gimp -f'
alias mpvsp='mpv --save-position-on-quit'
alias gnome-terminal='gnome-terminal --full-screen'
alias gterm='gnome-terminal --full-screen'
alias rxvt='xresources-reload; urxvt'
alias draw="wine64bit ~/sdata/bin/ptsai2/sai2.exe"
alias ranger='. ranger'
alias kitty='kitty --start-as fullscreen'

alias caps-toggle='xdotool key Caps_Lock'
alias wm-window-name='xprop | grep WM_CLASS'

# Wm
alias wm-name="printf '%s' $XDG_CURRENT_DESKTOP"
alias wm-type="wmctrl -m"
alias wm-is-i3='[ "$(wm-name)" = "i3" ] && echo 1 || echo 0'

if [ ! wm-is-i3 ]; then
    alias term='xresources-reload; urxvt -e sh -c "sleep 0.1; wmctrl -x -r urxvt -b add,fullscreen; bash"'
else
    alias term='xresources-reload; urxvt -e tmux a'
fi


# work NDM
alias ndm-start-local="npm start 192.168.1.1"
alias ndm-start-mobile="npm start 192.168.22.14"
