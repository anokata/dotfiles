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
# Shift-F3 \e[1;2R
# Ctrl-F4 \e[1;5S
# Ctrl-shift-F9 \e[20;6~

bind '"\C-n":"lfcd\C-m"'
bind -x '"\C-b":"bashrc-reload "' # 

# vim sessions
bind -x '"\eOP":"cd $DOTFILES; $EDITOR"' # F1 - open session: dotfiles
bind -x '"\eOQ":"cd $NOTES_DIR; $EDITOR"' # F2 - notes
bind -x '"\eOS":"cd $DOTFILES_CONFIGS; $EDITOR"' # F4 - configs
bind -x '"\e[1;5S":"cd $VIM_DIR_CONFIGS; $EDITOR"' # C-F4 - vim

# configs
bind -x '"\e[1;5P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # C-F1
bind -x '"\e[1;5Q":"$EDITOR $DOTFILES_LINUX/.bashrc"' # C-F2

# fzf and vim
bind -x '"\C-f":"$EDITOR $(fzf)"' # C-e fzf and open in vim
bind -x '"\C-g":"fzf-ueberzogen.sh"' # image preview
bind -x '"\C-o":"cd $NOTES_DIR; $EDITOR $(fzf)"' # C-e fzf and open in vim

# PS
bind '"\C-k":"pkill "' # 
bind -x '"\C-y":"htop "' # 
# TODO btop s-tui 
bind -x '"\e[19~":"tig"' # tig by <F8>
bind -x '"\e[20~":"htop "' # <F9>
# TODO bind to 'git status'  and git status; git diff --shortstat master  AND git pull

# IDE
bind -x '"\eg":"tig"' # tig by c-s-g

bind '"\C-a":"tmux a\C-m"' # ??? tmux
bind -x '"\e[1;3P":"$EDITOR $DOTFILES_CONFIGS/.vimrc"' # 
