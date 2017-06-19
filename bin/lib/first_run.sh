#!/bin/bash

FIRST_LOCK=/run/user/$(id -u)/first
function _first_lock() {
    if [ ! -e $FIRST_LOCK ]; then
        echo first
        touch $FIRST_LOCK
    fi
}

function _is_first_run() {
    if [ ! -e $FIRST_LOCK ]; then
        return 0;
    else
        return 1;
    fi
}
