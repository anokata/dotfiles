#!/bin/bash
### TMUX
TMUX_SESSION_NAME=base
function _tmux_run () {
    if [ -z $TMUX ]; then
        # tmux not runned
        if tmux has-session -t $TMUX_SESSION_NAME 3>/dev/null; then
            # attach to exist session
            tmux attach -t $TMUX_SESSION_NAME
        else
            # create new session
            tmux new -s $TMUX_SESSION_NAME -d
            tmux new-window -c ~/dotfiles/
            tmux new-window -c ~/ndw/
            tmux split-window -c ~/sdata/
            tmux new-window vifm
            tmux new-window ranger
            tmux select-window -t 1
            tmux attach -t $TMUX_SESSION_NAME
        fi
    else
        tmux a
    fi
}
