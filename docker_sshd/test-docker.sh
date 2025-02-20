#!/bin/bash
podman run --rm -it --name sshd-bastion \
  --user tunneluser \
  -e SSH_KEY="${SSH_KEY}" \
  -p 2222:2222 -p 6343:6343 \
  quay.io/abranzyck/sshd-bastion:arm_rhel_ubi3
