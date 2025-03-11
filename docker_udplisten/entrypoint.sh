#!/bin/bash

# Based on https://superuser.com/questions/1234316/group-a-set-of-processes-such-that-when-one-dies-so-do-every-other-processes-in

set -e

mkfifo /sflow_fifo

while true
do
    { nc 127.0.0.1 6343 < /sflow_fifo ; killall -q sflowtool ; } &
    sflowtool -4 -d 6343 -l > /sflow_fifo
    killall -q nc
    echo "Pipeline interrupted. Retrying ..."
    sleep 5
done
