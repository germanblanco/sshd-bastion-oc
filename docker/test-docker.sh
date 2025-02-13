#!/bin/bash
podman run --rm -d --name sshd-bastion \
  -e SSH_KEY="${SSH_KEY}" \
  -p 2222:2222 -p 6343:6343/udp \
  quay.io/abranzyck/sshd-bastion:test6
