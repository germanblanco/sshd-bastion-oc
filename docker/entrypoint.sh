#!/bin/bash
set -e

if [[ "$SSH_KEY" ]]; then
    mkdir -p /home/tunneluser/.ssh
    echo "$SSH_KEY" > /home/tunneluser/.ssh/authorized_keys
    chown tunneluser:tunneluser /home/tunneluser/.ssh
    chown tunneluser:tunneluser /home/tunneluser/.ssh/authorized_keys
else
    echo "Error: set SSH_KEY"
    exit 1
fi

exec /usr/sbin/sshd -D -p 2222
