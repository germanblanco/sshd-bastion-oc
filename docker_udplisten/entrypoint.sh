#!/bin/bash

set -e

mkfifo /sflow_fifo

while true
do
    ( set +e ; nc 127.0.0.1 6343 < /sflow_fifo ; pkill sflowtool ; echo "Exiting netcat" ) &
    sflowtool -4 -d 6343 -l > /sflow_fifo
    ( set +e ; pkill sflowtool; echo "Exiting sflowtool" )
    echo "Pipeline interrupted. Retrying ..."
    sleep 5
done
