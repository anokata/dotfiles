#!/bin/bash
function say() {
    echo "$(tput setaf 0; tput setab 7;)$1$(tput sgr 0;)"
}

