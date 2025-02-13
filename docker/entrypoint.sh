#!/bin/bash
set -e

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -A
fi

if [[ "$SSH_PASS" ]]; then
    echo "tunneluser:$SSH_PASS" | chpasswd
else
    echo "Error: set SSH_PASS"
    exit 1
fi

exec /usr/sbin/sshd -D -p 2222
