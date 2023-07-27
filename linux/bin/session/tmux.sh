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
            # tmux new-window -c $DOTFILES_LINUX
            # tmux new-window vim $NOTES_DIR
            tmux rename-window "dot"
            tmux new-window -c $WORK_DIR_CURRENT2 -n ndw2
            tmux split-window -c $WORK_DIR_CURRENT2
            tmux new-window -c $WORK_DIR_CURRENT -n ndw4
            tmux split-window -c $WORK_DIR_CURRENT
            #tmux new-window -c $WORK_DIR_CURRENT_TRY -n ndw3_try
            tmux select-window -t 1
            tmux attach -t $TMUX_SESSION_NAME -c $DOTFILES_LINUX
        fi
    #else
        #tmux a
    fi
}
