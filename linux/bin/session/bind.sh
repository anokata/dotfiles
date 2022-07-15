# Bindings
set -o vi
bind -m vi-command '"v": abort'
## vim
bind -x '"\e[1;6P":"$EDITOR"' # C-S-F1
# sessions
bind -x '"\eOP":"cd $DOTFILES; $EDITOR"' # F1 - open session: dotfiles
bind -x '"\eOQ":"cd $NOTES_DIR; $EDITOR"' # F2 - notes
bind -x '"\eOR":"cd $WORK_DIR_CURRENT; $EDITOR"' # F3 - ndm ndw3
bind -x '"\e[1;2R":"cd $WORK_DIR_CURRENT2; $EDITOR"' # S-F3 - ndw2
bind -x '"\eOS":"cd $DOTFILES_CONFIGS; $EDITOR"' # F4 - configs
bind -x '"\e[1;5S":"cd $VIM_DIR_CONFIGS; $EDITOR"' # C-F4 - vim

# configs
bind -x '"\e[1;5P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # C-F1
bind -x '"\e[1;5Q":"$EDITOR $DOTFILES_LINUX/.bashrc"' # C-F2

# fzf and vim
bind -x '"\C-f":"$EDITOR $(fzf)"' # C-e fzf and open in vim
# bind -x '"\C-h":"fzf"' # C- fzf 
bind -x '"\C-g":"fzf-ueberzogen.sh"' # image preview
bind -x '"\C-o":"cd $NOTES_DIR; $EDITOR $(fzf)"' # C-e fzf and open in vim

# Move
bind -x '"\e[1;5A":"cd .."' # c-up
bind -x '"\e[1;5A":"cd -"' # c-left

# FM
bind -x '"\e[15~":"lfrun"' # F5
bind -x '"\e[17~":"fff"' # F6
bind -x '"\e[18~":"~/gits/fmui/fmui"' # F7

# PS
bind '"\C-k":"pkill "' # 
bind -x '"\C-y":"htop "' # 
bind -x '"\e[19~":"tig"' # tig by <F8>
bind -x '"\e[20~":"htop "' # <F9>
bind -x '"\C-b":"bashrc-reload "' # 

# IDE
bind -x '"\eg":"tig"' # tig by c-s-g

# TODO
bind '"\C-n":"lfcd\C-m"'

bind -x '"\e[1;5S":"ranger"' # C-F4
bind -x '"\e[1;6S":"tmux new-window ranger"' # C-S-F4
bind -x '"\e[15;5~":"fff"' # C-F5
# list
#bind -x '"\e[15~":"ls"' # a-l 

# tmux
# bind -x '"\C-w":"tmux kill-pane"' # c-w
# bind -x '"\C-n":"tmux new-window"' # c-n
bind -x '"\e[20;6~":"tmux new-window cmus"' # C-S-F9

bind -x '"\e[1;3P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # alt-F1


# Fav dirs
# num not num
#bind '"\e[1;5F":"cd $HDD1\C-m"' # C-num-1
#bind '"\e[2;5~":"cd $HDD2\C-m"' # C-num-0
#bind '"\e[1;5B":"cd $SSD\C-m"' # C-num-2
#bind '"\e[6;5~":"cd $DOTFILES\C-m"' # C-num-3
#bind '"\C-i":"cd $NOTES_DIR\C-m$EDITOR $(fzf)\C-m"' # c-i
#bind '"\e[1;5D":"cd $NOTES_DIR\C-m$EDITOR $(fzf)\C-m"' # C-left

# bind '"\e[1;":"cd $DOTFILES_LINUX\C-m"' # C-num-0
# bind '"\e[1;":"cd $DOTFILES_BIN\C-m"' # C-num-0
# bind '"\e[1;":"cd $DOTFILES_CONFIGS\C-m"' # C-num-0
# bind '"\e[1;":"cd $WORK_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $BACKUPS\C-m"' # C-num-0
# bind '"\e[1;":"cd $LINKS_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $DRAW_DIR\C-m"' # C-num-0
# bind '"\e[1;":"cd $SCREENS_BASE\C-m"' # C-num-0
# bind '"\e[1;":"cd $REF_BASE\C-m"' # C-num-0

