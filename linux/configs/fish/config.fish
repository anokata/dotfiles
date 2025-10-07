if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dotfiles/linux/.env.fish
source ~/dotfiles/linux/bin/session/alias.sh
source ~/dotfiles/linux/bin/session/tmux.fish
source ~/dotfiles/linux/bin/session/bind.fish


_tmux_run
