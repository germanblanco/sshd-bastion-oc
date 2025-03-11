#!/bin/bash
export TAG=rhel_ubi10
podman run --rm -it --name sshd-bastion \
  --user tunneluser \
  -e SSH_KEY="${SSH_KEY}" \
  -p 2222:2222 -p 6343:6343 \
  quay.io/abranzyck/sshd-bastion:$TAG
