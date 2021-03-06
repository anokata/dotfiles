#!/bin/bash
# vim: filetype=sh

if [ -e /run/user/$(id -u) ]; then
    FIRST_LOCK=/run/user/$(id -u)/first
    FIRST_CON_LOCK=/run/user/$(id -u)/first_tty
else
    FIRST_LOCK=/tmp/$(id -u)first
    FIRST_CON_LOCK=/tmp/$(id -u)first_tty
fi

function _first_lock() {
    if [ ! -e $FIRST_LOCK ]; then
        echo first
        touch $FIRST_LOCK
        #echo $(date +%d) > $FIRST_LOCK
    fi
}

function _first_con_lock() {
    if [ ! -e $FIRST_CON_LOCK ]; then
        touch $FIRST_CON_LOCK
    fi
}

function _is_first_tty_run() {
    if [ ! -e $FIRST_CON_LOCK ]; then
        return 0;
    else
        return 1;
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
