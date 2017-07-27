#!/bin/bash
# vim: filetype=sh

FIRST_LOCK=/run/user/$(id -u)/first
function _first_lock() {
    if [ ! -e $FIRST_LOCK ]; then
        echo first
        touch $FIRST_LOCK
        #echo $(date +%d) > $FIRST_LOCK
    fi
}

function _is_first_run() {
    if [ ! -e $FIRST_LOCK ]; then
        return 0;
    else
        #day=$(stat -c % x$FIRST_LOCK | cut -d- -f3 | head -c 2 )
        #fday=$(cat $FIRST_LOCK)
        return 1;
    fi
}
