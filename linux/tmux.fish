set -gx TMUX_SESSION_NAME base

function _tmux_run
    # echo "tmux run $TMUX __ $NO_TMUX __ session: $TMUX_SESSION_NAME"

    # If the variable $TMUX not empty -> already in tmux session
    # If NO_TMUX is set -> no need to create
    if set -q NO_TMUX || set -q TMUX
        return
    end

    if tmux has-session -t "$TMUX_SESSION_NAME" 2>/dev/null
        # attach to exist session
        tmux attach -t "$TMUX_SESSION_NAME"
    else
        # create new session
        tmux new-session -s "$TMUX_SESSION_NAME" -d
        tmux rename-window -t "$TMUX_SESSION_NAME:1" "dot" # 1

        tmux new-window -c "$WORK_DIR_CURRENT4" -n ndw4
        tmux new-window -c "$HOME/gits" -n gits # 6-7
        
        # Select first window (index 1)
        tmux select-window -t 1

        # Attach and set the initial directory for the attached client
        tmux attach -t "$TMUX_SESSION_NAME" -c "$DOTFILES_LINUX"
    end
end
