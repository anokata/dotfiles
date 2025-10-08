if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dotfiles/linux/.env.fish
source ~/dotfiles/linux/bin/session/alias.sh
source ~/dotfiles/linux/bin/session/tmux.fish
source ~/dotfiles/linux/bin/session/bind.fish
source ~/dotfiles/linux/bin/session/ndm.sh

source ~/dotfiles/linux/configs/fish/functions/detect-monitors.fish && detect_monitors

# TODO: condition run tmux: not in ide terms
_tmux_run
