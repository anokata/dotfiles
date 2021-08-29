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

            # if [ -e ~/.home.sig ]; then
                #tmux split-window -v
                tmux new-window -c $DOCDIR
                tmux split-window -v -c $DOCDIR
                tmux new-window -c $BASEDIR
                tmux split-window -v "vifm"
                tmux select-window -t 2

            tmux attach -t $TMUX_SESSION_NAME
        fi
    fi
}

_try_tmux_run () {
    if which tmux 1>/dev/null 2>/dev/null; then
        _tmux_run
    fi
}

