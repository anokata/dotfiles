#!/bin/bash
# TODO how use socket
# read config
source conf.sh
# make fifo
rm -f $FIFO
mkfifo $FIFO

# make server that listen and send to fifo
echo "runnig@$SERVER:$PORT"
nc -lk $SERVER $PORT 1> $FIFO
