# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# my config
source ~/dotfiles/bashconf.sh
