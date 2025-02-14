#!/bin/bash
podman run --rm -it --name sshd-udplisten \
  -p 6343:6343/udp \
  quay.io/abranzyck/sshd-udplisten:arm_ubuntu7 /bin/bash
