#!/bin/bash

mkfifo /tmp/fifo

while true
do
  netcat -l -u -s 0.0.0.0 -p 6343 < /tmp/fifo | while ! netcat 127.0.0.1 6343 -k -q 5 -w 5 > /tmp/fifo ; do sleep 1 ; done
  sleep 1
done
