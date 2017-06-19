#!/bin/bash

#http://linuxmafia.com/faq/Admin/release-files.html
DIST_COLOR=$W
DIST_SHORT=-
get_distro_name () {
    if [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        DIST_SHORT='U'
        DIST_COLOR=$BC
    elif [ -f /etc/debian_version ]; then
        DISTRO=debian
        DIST_SHORT='D'
        DIST_COLOR=$BM
    elif [ -f /etc/redhat-release ]; then
        DISTRO="Red Hat"
        DISTRO=$(cat /etc/redhat-release | cut -d" " -f 1)
        DIST_SHORT='C'
        DIST_COLOR=$BR
    # for arch
    elif [ -f /etc/arch-release ]; then 
        DISTRO="ARCH"
        DIST_SHORT='A'
        DISTRO=$(cat /etc/arch-release)
        DIST_COLOR=$BG
    fi
}
get_distro_name
DIST_SHORT=[${DIST_COLOR}$DIST_SHORT$W]
