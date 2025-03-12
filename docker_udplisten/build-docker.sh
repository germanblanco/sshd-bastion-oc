#!/bin/bash
export TAG=test_rhel_ubi2
podman build -t quay.io/german_blanco_ibm/sshd-udplisten:$TAG .
podman push quay.io/german_blanco_ibm/sshd-udplisten:$TAG
