#!/bin/bash
podman run --rm -it --name sshd-bastion \
  -e SSH_KEY="${SSH_KEY}" \
  -p 2222:2222 -p 6343:6343/tcp \
  --user octest \
  quay.io/abranzyck/sshd-bastion:arm_ubuntu5 /bin/bash
