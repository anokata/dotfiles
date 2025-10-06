# fish_key_reader
# to get key code(in bash): press ctrl-v and key; replace ^[ to \e

bind ctrl-n lf
bind --mode insert ctrl-n lf

# F1 - open session: dotfiles
bind -k f1 'cd $DOTFILES; $EDITOR'
bind --mode insert -k f1 'cd $DOTFILES; $EDITOR'

bind \eOQ 'cd $NOTES_DIR; $EDITOR'
bind --mode insert \eOQ 'cd $NOTES_DIR; $EDITOR' # F2 - open notes


