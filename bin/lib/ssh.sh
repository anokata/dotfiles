#!/bin/bash

if which ssh-agent > /dev/null; then 
    if ! pidof ssh-agent > /dev/null; then 
        #eval "$(ssh-agent -s)"
        ssh-agent > "/run/user/$(id -u)/.ssh-agent-thing"
    fi 
    
    if [[ "$SSH_AGENT_PID" == "" ]]; then
        eval "$(</run/user/$(id -u)/.ssh-agent-thing)" > /dev/null
    fi

    ssh-add ~/.ssh/work_rsa > /dev/null 2>/dev/null
fi 



