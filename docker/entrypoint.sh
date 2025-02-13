#!/bin/bash
set -e

if [[ "$SSH_PASS" ]]; then
    echo "tunneluser:$SSH_PASS" | chpasswd
else
    echo "Error: set SSH_PASS"
    exit 1
fi

# Start SSH Server
exec /usr/sbin/sshd -D
