#!/bin/bash
export TAG=rhel_ubi4
podman build -t quay.io/german_blanco_ibm/sshd-udplisten:$TAG .
podman push quay.io/german_blanco_ibm/sshd-udplisten:$TAG
