#!/bin/bash
### TMUX
TMUX_SESSION_NAME=base
function _tmux_run () {
    if [ -z $TMUX ]; then
        # tmux not runned
        [ $NO_TMUX ] && return
        if tmux has-session -t $TMUX_SESSION_NAME 3>/dev/null; then
            # attach to exist session
            tmux attach -t $TMUX_SESSION_NAME
        else
            # create new session
            tmux new -s $TMUX_SESSION_NAME -d
            tmux new-window -c $DOTFILES_LINUX
            tmux new-window -c $WORK_DIR
            tmux split-window
            # tmux split-window -c ~/sdata/
            # tmux new-window vifm
            # tmux new-window cmus
            # fff
            # tmux new-window ranger
            # tmux new-window vim $NOTES_DIR
            # tmux select-window -t 1
            tmux attach -t $TMUX_SESSION_NAME
        fi
    #else
        #tmux a
    fi
}
