#!/bin/bash
### TMUX
TMUX_SESSION_NAME=base
function _tmux_run () {
    # echo "tmux run $TMUX __ $NO_TMUX __ session: $TMUX_SESSION_NAME"
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
            tmux rename-window "dot" # 1
            # tmux split-window
            tmux new-window -c $WORK_DIR_CURRENT5 -n ndw5 # 2-3
            # tmux split-window -c $WORK_DIR_CURRENT5
            # tmux new-window -c $WORK_DIR_CURRENT -n ndw4 # 4-5
            # tmux split-window -c $WORK_DIR_CURRENT
            tmux new-window -c ~/gits -n gits # 6-7
            # tmux new-window -c ~/pwn -n pwn
            # tmux split-window -c ~/pwn
            # tmux new-window -c ~/Downloads -n dwl
            tmux select-window -t 1
            tmux attach -t $TMUX_SESSION_NAME -c $DOTFILES_LINUX
        fi
    #else
        #tmux a
    fi
}
