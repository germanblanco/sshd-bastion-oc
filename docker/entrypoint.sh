#!/bin/bash
set -e

if [[ "$SSH_KEY" ]]; then
    echo "$SSH_KEY" > /home/tunneluser/.ssh/authorized_keys
    chmod a+r /home/tunneluser/.ssh/authorized_keys
    chmod 600 /keys/etc/ssh/*
else
    echo "Error: set SSH_KEY"
    exit 1
fi

exec /usr/sbin/sshd -D -p 2222
