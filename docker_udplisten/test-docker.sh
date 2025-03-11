#!/bin/bash
podman run --rm -it --name sshd-udplisten \
  -p 6343:6343/udp \
  quay.io/german_blanco_ibm/sshd-udplisten:arm_rhel_ubi2
