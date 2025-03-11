#!/bin/bash
export TAG=rhel_ubi9
podman build -t quay.io/german_blanco_ibm/sshd-bastion:$TAG .
podman push quay.io/german_blanco_ibm/sshd-bastion:$TAG
