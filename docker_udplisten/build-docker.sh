#!/bin/bash
export TAG=test_rhel_ubi1
podman build -t quay.io/abranzyck/sshd-udplisten:$TAG .
podman push quay.io/abranzyck/sshd-udplisten:$TAG
