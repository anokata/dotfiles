# fish_key_reader
# to get key code(in bash): press ctrl-v and key; replace ^[ to \e
# and use fish_key_reader

# alt-h (or f1) shows the manual page for the current command, if one exists.
# alt-l lists the contents of the current directory,
# alt-w prints a short description of the command under the cursor
# alt-s Prepends sudo to the current commandline
# ctrl-n accepts the autosuggestion.
# F4	\eOS	\e[14~
# FZF bindings
# Search Directory   |  Ctrl+Alt+F (F for file)
# Search Git Log     |  Ctrl+Alt+L (L for log)
# Search Git Status  |  Ctrl+Alt+S (S for status)
# Search History     |  Ctrl+R     (R for reverse)
# Search Processes   |  Ctrl+Alt+P (P for process)
# Search Variables   |  Ctrl+V     (V for variable)

# File Managment: LF
bind ctrl-n lfcd execute
bind --mode insert ctrl-n lfcd execute
bind \eOR lfcd execute # F3 
bind -M insert \e\OR lfcd execute # F3

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
bind ctrl-f '$EDITOR $(fzf)'
bind -M insert ctrl-f '$EDITOR $(fzf)'

# find other key
# bind alt-h 'fzf-ueberzogen.sh'
# bind -M insert alt-h 'fzf-ueberzogen.sh'

bind ctrl-o 'cd $NOTES_DIR; $EDITOR $(fzf)'
bind -M insert ctrl-o 'cd $NOTES_DIR; $EDITOR $(fzf)'

# alt-k: Prepends command with pkill
bind alt-k 'commandline -r "pkill "(commandline) ; and commandline -C 6'
bind -M insert alt-k 'commandline -r "pkill "(commandline) ; and commandline -C 6'

# System Monitors
bind ctrl-y 'htop'
bind -M insert ctrl-y 'htop'

bind ctrl-p 'btop'
bind -M insert ctrl-p 'btop'

# F9: s-tui cpu monitor
bind \e\[20~ 's-tui'
bind -M insert \e\[20~ 's-tui'

## Git
# TODO bind to 'git status'  and git status; git diff --shortstat master  AND git pull
bind ctrl-g 'git status -sb' execute
bind -M insert ctrl-g 'git status -sb' execute
bind alt-t 'git status; git diff --shortstat master' execute
bind -M insert alt-t 'git status; git diff --shortstat master' execute
# bind alt-p ''

## IDE
# F5: tig
bind \e\[15~ 'tig'
bind -M insert \e\[15~ 'tig'

bind ctrl-b fish-config-reload
bind --mode insert ctrl-b fish-config-reload

# Navigation
bind \e\[1\;5A 'cd ..' execute # ctrl-up
bind -M insert \e\[1\;5A 'cd ..' execute # ctrl-up

bind \e\[1\;5D 'cd -' execute # ctrl-left
bind -M insert \e\[1\;5D 'cd -' execute # ctrl-left

# ctrl-j accept autosuggestion
bind --preset -M insert -e ctrl-j
bind --preset -e ctrl-j
bind -M insert ctrl-j accept-autosuggestion
bind ctrl-j accept-autosuggestion

bind alt-o _fco_preview
bind -M insert alt-o _fco_preview
