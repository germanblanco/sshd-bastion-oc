#!/bin/bash

set -e

if [[ "$SSH_KEY" ]]; then
    echo "$SSH_KEY" > /home/tunneluser/.ssh/authorized_keys
    chmod 600 /home/tunneluser/.ssh/authorized_keys
    mkdir -p /keys/etc/ssh
    cp /etc/ssh/* /keys/etc/ssh
    chmod 600 /keys/etc/ssh/*
    exec /usr/sbin/sshd -D -p 2222
else
    echo "Error: set SSH_KEY"
    exit 1
fi
