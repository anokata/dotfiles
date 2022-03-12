# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/sernam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
#
# традиционный стиль перенаправлений fd
unsetopt MULTIOS
# поддержка ~… и file completion после = в аргументах
setopt MAGIC_EQUAL_SUBST
# не обрабатывать escape sequence в echo без -e
setopt BSD_ECHO
# поддержка комментариев в командной строке
setopt INTERACTIVE_COMMENTS
# поддержка $(cmd) в $PS1 etc.
setopt PROMPT_SUBST
