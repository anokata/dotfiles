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
alias cdref="cd $REF_FORME"
alias cdscr="cd $SCREENS_DIR"
alias cdg="cd $HOME/gits"
alias c="pushd "

# color
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Files info
alias l='ls --color=auto -CXF --group-directories-first'
alias la='ls -A'
alias lF='ls -lah | less'
alias lk='ll | grep / | grep " \."'
alias ll='ls -alFh'
alias lld='ll -d */'
alias lz='ls | fzf'
alias dush='du -sh'
alias dushgm='du -sh | grep M'
alias dushgg='du -sh | grep G'
alias df='df -h'
alias dfu='duf --only fuse'
alias dh='df -h -x squashfs -x tmpfs'
alias tdl='tree -dL'
alias sloc='cat *.c *.h | uniq | wc -l'
alias wcl='wc -l'
alias files='find | wc -l'
alias dd='dd status=progress bs=64K conv=noerror,sync '
alias bat="batcat"
alias fzf="fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:70%:wrap"
alias fzfi="fzf-ueberzogen.sh"
alias vim="nvim"
alias notes='vim `fzf`'
alias ksi-notes="cd $NOTES_DIR && $TERMINAL -e $EDITOR +\":Prosession $NOTES_DIR\""
alias ksi-config="cd $DOTFILES_LINUX && $TERMINAL -e $EDITOR +\":Prosession $DOTFILES_LINUX\""
alias lfc='tmux split -h lf; lf'
alias lf='lfrun'

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
alias pping='prettyping'
alias p='pping ya.ru'
alias sys-ram='sudo dmidecode -t 17'

# Finding
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias fd='fdfind'
alias fde='fd -e '
alias fdh='fd -H '

# Video/Audio download
alias youtube-low="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias youtube-normal="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
alias youtube-hq="youtube-dl -f 'bestvideo[height>=1080]+bestaudio/best[height>=1080]'"
alias youtubebe-ok="youtube-dl -f 'bestvideo[height>=720]+bestaudio/best[height>=720]'"
alias youtube-name="youtube-dl -f 'bestvideo[height>=72]+bestaudio/best[height>=720]' -o '%(title)s.%(ext)s' --restrict-filenames"
alias yt-audio-only="yt-dlp -f 'ba'"
alias yt-audio-mp3="yt-dlp -f 'ba' -x --audio-format mp3"

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
alias gco='git checkout'
alias gu='git pull'
alias gm='git merge'
alias gb='git branch'
alias gcl='git clone'
alias gclp='git clone $(clipboard-get)'
alias gbc='git branch --show-current'
alias gpc='git push origin $(git branch --show-current)'
alias gpa='git push --all'
alias git-merge-master='git checkout master && git pull && git checkout - && git merge master && git push'

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
alias config-inputrc="$EDITOR $DOTFILES_LINUX/.inputrc && bashrc-reload"
alias config-ranger="$EDITOR $DOTFILES_CONFIGS/ranger/"
alias config-env="$EDITOR $DOTFILES_LINUX/.env && bashrc-reload"
alias config-draw-mypaint-brushes="$EDITOR $MYPAINT_BRUSHES"
alias config-draw-mypaint="$EDITOR $MYPAINT"
alias config-kitty="$EDITOR $DOTFILES_CONFIGS/kitty/kitty.conf"
alias config-rofi="$EDITOR $DOTFILES_CONFIGS/rofi/config.rasi"
alias config-mpd="$EDITOR $DOTFILES_CONFIGS/mpd/mpd.conf"

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
alias xkitty='kitty --start-as fullscreen'
alias icat="kitty +kitten icat"
alias st="st -g 180x50 tmux a"
alias mpd-restart="mpd --kill && mpd"
alias mpd-update="mpc update"
alias mpc="mpc -p $MPD_PORT"
alias mpc-play="mpc play"
alias mpc-pause="mpc pause"
alias mpc-next="mpc next"
alias mpc-prev="mpc prev"
alias mpc-all="mpc clear && mpc ls | mpc add"

# Org
alias vimdoc="$EDITOR $NOTES_DIR"

alias caps-toggle='xdotool key Caps_Lock'
alias caps-escape='setxkbmap -option caps:escape'
alias wm-window-name='xprop | grep WM_CLASS'
alias wm-window-class='xprop | grep WM_CLASS'

# Wm
alias wm-name="printf '%s' $XDG_CURRENT_DESKTOP"
alias wm-type="wmctrl -m"
alias wm-is-i3='[ "$(wm-name)" = "i3" ] && echo 1 || echo 0'

alias apti="sudo apt install"
alias apts="apt search"
alias aptr="sudo apt remove"
alias aptr="sudo apt purge"
alias apt-installed='apt list --installed'
alias aptsi="apt-installed | rg"
alias aptc="sudo apt autoremove && sudo apt clean"
alias clean="sudo apt autoremove && sudo apt clean; journalctl --vacuum-time=2d; sudo rm -rf /var/lib/snapd/cache/*"
alias dir-colors-update='eval $(dircolors $DOTFILES_CONFIGS/.dir_colors)'

# Curl sites
alias ip-info="curl ipinfo.io"
# alias weather="curl wttr.in/Moscow"
alias weather="finger moscow@graph.no"

function cheat() {
    curl "cheat.sh/$@"
}
function dict() {
    curl "dict.org/d:$@"
}

alias my-ip="curl icanhazip.com"
alias get-ip="wget -q -O - checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
