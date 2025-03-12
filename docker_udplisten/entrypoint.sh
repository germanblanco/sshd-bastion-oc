#!/bin/bash

set -e

mkfifo /sflow_fifo

while true
do
    ( set +e ; nc 127.0.0.1 6343 < /sflow_fifo ; pkill sflowtool ; echo "Exiting netcat" ) &
    set +e
    sflowtool -4 -l > /sflow_fifo
    set -e
    echo "Pipeline interrupted. Retrying ..."
    sleep 5
done
