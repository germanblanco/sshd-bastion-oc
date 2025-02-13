#!/bin/bash
set -e

# Set SSH user and password from environment variables
if [[ -n "$SSH_USER" && -n "$SSH_PASS" ]]; then
    echo "$SSH_USER:$SSH_PASS" | chpasswd
    usermod -l "$SSH_USER" tunneluser  # Rename user
else
    echo "Error: SSH_USER and SSH_PASS must be set!"
    exit 1
fi

# Start SSH Server
exec /usr/sbin/sshd -D

