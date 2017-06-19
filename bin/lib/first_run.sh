#!/bin/bash

FIRST_LOCK=/run/user/$(id -u)/first
if [ ! -e $FIRST_LOCK ]; then
    echo first
    touch $FIRST_LOCK
fi

function _is_first_run() {
    if [ ! -e $FIRST_LOCK ]; then
        return 0;
    else
        return 1;
    fi
}
