#!/bin/bash

#http://linuxmafia.com/faq/Admin/release-files.html
DIST_COLOR=$W
DIST_SHORT=-
DIST_SYM=-
get_distro_name () {
    if [ -f /etc/arch-release ]; then 
        DISTRO="ARCH"
        DIST_SYM='A'
        DISTRO=$(cat /etc/arch-release)
        DIST_COLOR=$BG
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        if [ $DISTRO = "Arch" ]; then
            DISTRO="ARCH"
            DIST_SYM='A'
            DISTRO=$(cat /etc/arch-release)
            DIST_COLOR=$BG
        else
            DIST_SYM='U'
            DIST_COLOR=$BC
        fi
    elif [ -f /etc/debian_version ]; then
        DISTRO=debian
        DIST_SYM='D'
        DIST_COLOR=$BM
    elif [ -f /etc/redhat-release ]; then
        DISTRO="Red Hat"
        DISTRO=$(cat /etc/redhat-release | cut -d" " -f 1)
        DIST_SYM='C'
        DIST_COLOR=$BR
    # for arch
    fi
}
get_distro_name
DIST_SHORT=[${DIST_COLOR}$DIST_SYM$W]
