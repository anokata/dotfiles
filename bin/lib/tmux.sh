#!/bin/bash
# vim: filetype=sh

TMUX_SESSION_NAME=basea
function _tmux_run () {
    if [ -z $TMUX ]; then
        echo 'not in tmux'
        if tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null; then
            echo 'attach'
            tmux attach -t $TMUX_SESSION_NAME
        else
            echo 'create'
            tmux new -s $TMUX_SESSION_NAME -d

            if [ -e ~/.home.sig ]; then
                tmux new-window -c ~/doc/stat
            fi
            if [ -e ~/.work.sig ]; then
                tmux split-window -h -c ~/dotfiles/
                tmux select-pane -L
                tmux new-window -c $WORK_DIR
                tmux split-window -hp 30 -c $WORK_DIR
                tmux new-window -c $WORK_DIR
                tmux split-window -h
                #tmux split-window -hp 50 -c ~/cprojects
                tmux select-window -t 1
                tmux select-pane -L
                tmux split-window -vp25 portal_mon
            fi

            tmux attach -t $TMUX_SESSION_NAME
        fi
    fi
}

_try_tmux_run () {
    if which tmux 1>/dev/null 2>/dev/null; then
        _tmux_run
    fi
}

