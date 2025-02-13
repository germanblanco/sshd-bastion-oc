#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:alpine20 .
podman push quay.io/abranzyck/sshd-bastion:alpine20
