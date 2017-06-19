#!/bin/bash

if which ssh-agent > /dev/null; then 
    if ! pidof ssh-agent > /dev/null; then 
        eval "$(ssh-agent -s)"
    fi 
fi 
ssh-add ~/.ssh/work_rsa > /dev/null 2>/dev/null

#B070L<Mf4j9O15G

