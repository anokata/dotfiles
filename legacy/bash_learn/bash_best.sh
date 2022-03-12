#!/bin/bash
set -o nounset # unset var is error
set -o errexit # error exit code is error

log() {  # classic logger 
   local prefix="[$(date +%Y/%m/%d\ %H:%M:%S)]: "
   echo "${prefix} $@" >&2
} 
log "INFO" "a message"
