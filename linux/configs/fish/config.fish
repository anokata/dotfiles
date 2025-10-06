if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dotfiles/linux/.env.fish
source ~/dotfiles/linux/bin/session/alias.sh
# alt-h (or f1) shows the manual page for the current command, if one exists.
# alt-l lists the contents of the current directory,
# alt-w prints a short description of the command under the cursor
# alt-s Prepends sudo to the current commandline
# ctrl-n accepts the autosuggestion.
