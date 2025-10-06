# Bindings
# to get key code: press ctrl-v and key; replace ^[ to \e
set -o vi
bind -m vi-command '"v": abort'
# F keys codes: 
# F1	\eOP	\e[11~
# F2	\eOQ	\e[12~
# F3	\eOR	\e[13~
# F4	\eOS	\e[14~
# F5	\e[15~	\e[15~
# F6	\e[17~	\e[17~
# F7	\e[18~	\e[18~
# F8	\e[19~	\e[19~
# F9	\e[20~	\e[20~
# F10	\e[21~	\e[21~
# F11	\e[23~	\e[23~
# F12	\e[24~	\e[24~
#
# bind -x '"\e[1;6P":"$EDITOR"' # C-S-F1
# vim sessions
bind -x '"\eOP":"cd $DOTFILES; $EDITOR"' # F1 - open session: dotfiles
bind -x '"\eOQ":"cd $NOTES_DIR; $EDITOR"' # F2 - notes
# bind -x '"\eOR":"cd $WORK_DIR_CURRENT; $EDITOR"' # F3 - ndm ndw3
# bind -x '"\e[17~":"cd $WORK_DIR_CURRENT_TRY; $EDITOR"' # F6 - ndm ndw3 try
# bind -x '"\e[1;2R":"cd $WORK_DIR_CURRENT2; $EDITOR"' # S-F3 - ndw2
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
# bind -x '"\e[15~":"lfrun"' # F5
#bind -x '"\e[17~":"fff"' # F6
# bind -x '"\e[18~":"~/gits/fmui/fmui"' # F7

# PS
bind '"\C-k":"pkill "' # 
bind -x '"\C-y":"htop "' # 
bind -x '"\e[19~":"tig"' # tig by <F8>
bind -x '"\e[20~":"htop "' # <F9>
bind -x '"\C-b":"bashrc-reload "' # 
bind -x '"\C-x":"gcom "' # 
bind -x '"\C-e":"gco - "' # 
bind -x '"\C-u":"gu "' # 

# IDE
bind -x '"\eg":"tig"' # tig by c-s-g

bind '"\C-n":"lfcd\C-m"'

bind -x '"\e[1;5S":"ranger"' # C-F4
bind -x '"\e[1;6S":"tmux new-window ranger"' # C-S-F4
bind -x '"\e[15;5~":"fff"' # C-F5
bind -x '"\e[21~":"ncmpcpp"' # F10

# tmux
bind '"\C-a":"tmux a\C-m"'
# bind -x '"\C-w":"tmux kill-pane"' # c-w
# bind -x '"\C-n":"tmux new-window"' # c-n
bind -x '"\e[20;6~":"tmux new-window cmus"' # C-S-F9

bind -x '"\e[1;3P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # alt-F1

