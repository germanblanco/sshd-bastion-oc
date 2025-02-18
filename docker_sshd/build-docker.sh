#!/bin/bash
export TAG=rhel_ubi3
podman build -t quay.io/abranzyck/sshd-bastion:$TAG .
podman push quay.io/abranzyck/sshd-bastion:$TAG
