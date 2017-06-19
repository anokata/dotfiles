#!/bin/bash
TMUX_SESSION_NAME=base
function _tmux_run () {
    if [ -z $TMUX ]; then
        echo 'not in tmux'
        if tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null; then
            echo 'attach'
            tmux attach -t $TMUX_SESSION_NAME
        else
            echo 'create'
            tmux new -s $TMUX_SESSION_NAME
        fi
    fi
}

_try_tmux_run () {
    if which tmux 1>/dev/null 2>/dev/null; then
        _tmux_run
    fi
}

