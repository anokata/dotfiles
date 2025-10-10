if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dotfiles/linux/.env.fish
source ~/dotfiles/linux/bin/session/alias.sh
source ~/dotfiles/linux/bin/session/tmux.fish
source ~/dotfiles/linux/bin/session/bind.fish
source ~/dotfiles/linux/bin/session/ndm.sh

source ~/dotfiles/linux/configs/fish/functions/detect-monitors.fish && detect_monitors
# source ~/dotfiles/linux/configs/fish/functions/detect-monitors.fish# && detect_monitors
source ~/dotfiles/linux/bin/fzf-git-checkout.fish

# Avoid running tmux session in vscode and webstorm
if test "$TERM_PROGRAM" = "vscode"
    echo "vscode"
    # nvm use system
else if test "$TERMINAL_EMULATOR" = "JetBrains-JediTerm"
    echo "webstorm"
    # nvm use system
else
    _tmux_run
end

caps-escape # make caps = escape
