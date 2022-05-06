#!/bin/bash
source $DOTFILES_LINUX/.env
mkdir $WORK_DIR
cd $WORK_DIR
NDM_URL=git@github.com:ndmsystems/ndw3-without-isw.git
git clone git@github.com:ndmsystems/ndw2.git
git clone git@github.com:ndmsystems/ndw3-without-isw.git
# git clone $NDM_URL
# cd
# npm install
