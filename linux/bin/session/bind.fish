# fish_key_reader
# to get key code(in bash): press ctrl-v and key; replace ^[ to \e
# and use fish_key_reader

# alt-h (or f1) shows the manual page for the current command, if one exists.
# alt-l lists the contents of the current directory,
# alt-w prints a short description of the command under the cursor
# alt-s Prepends sudo to the current commandline
# ctrl-n accepts the autosuggestion.

# File Managment: LF
# bind ctrl-n lf
# bind --mode insert ctrl-n lf
bind \e\[15~ lf # F5
bind -M insert \e\[15~ lf # F5

# F1 - open session: dotfiles
bind -k f1 'cd $DOTFILES; $EDITOR'
bind --mode insert -k f1 'cd $DOTFILES; $EDITOR'

# F2 - open notes
bind \eOQ 'cd $NOTES_DIR; $EDITOR'
bind --mode insert \eOQ 'cd $NOTES_DIR; $EDITOR' 

# Configs
# Ctrl-F1 vimrc config
bind  \e\[1\;5P '$EDITOR $DOTFILES_CONFIGS/.vimrc'
bind -M insert \e\[1\;5P '$EDITOR $DOTFILES_CONFIGS/.vimrc'

# Ctrl-F2 fishrc config
bind \e\[1\;5Q '$EDITOR $DOTFILES_LINUX/configs/fish/config.fish'
bind -M insert \e\[1\;5Q '$EDITOR $DOTFILES_LINUX/configs/fish/config.fish'

# TODO
# fzf and vim
# bind -x '"\C-f":"$EDITOR $(fzf)"' # C-e fzf and open in vim
# bind -x '"\C-g":"fzf-ueberzogen.sh"' # image preview
# bind -x '"\C-o":"cd $NOTES_DIR; $EDITOR $(fzf)"' # C-e fzf and open in vim

# PS
# bind '"\C-k":"pkill "' # 
# bind '"\C-k":"pkill "' # prepand pkill ; alt-k
# bind -x '"\C-y":"htop "' # 
# bind -x '"\e[20~":"htop "' # <F9>
# TODO btop s-tui 
# TODO bind to 'git status'  and git status; git diff --shortstat master  AND git pull

# IDE
# bind -x '"\eg":"tig"' # tig by c-s-g
# bind -x '"\e[19~":"tig"' # tig by <F8>

# TODO: lfcd (adapt script and bind)

bind ctrl-b fish-config-reload
bind --mode insert ctrl-b fish-config-reload

bind \e\[1\;5A 'cd ..' execute # ctrl-up
bind -M insert \e\[1\;5A 'cd ..' execute # ctrl-up

bind \e\[1\;5D 'cd -' execute # ctrl-left
bind -M insert \e\[1\;5D 'cd -' execute # ctrl-left
