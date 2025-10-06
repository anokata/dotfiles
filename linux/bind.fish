# fish_key_reader

bind ctrl-n lf
bind --mode insert ctrl-n lf

# F1 - open session: dotfiles
bind -k f1 'cd $DOTFILES; $EDITOR'
bind --mode insert -k f1 'cd $DOTFILES; $EDITOR'
bind -k f2 'cd $NOTES_DIR; $EDITOR'

echo binded f1 to $DOTFILES $EDITOR
