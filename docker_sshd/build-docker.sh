#!/bin/bash
export TAG=arm_rhel_ubi3
podman build -t quay.io/abranzyck/sshd-bastion:$TAG .
podman push quay.io/abranzyck/sshd-bastion:$TAG
