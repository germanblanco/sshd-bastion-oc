#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:alpine8 .
podman push quay.io/abranzyck/sshd-bastion:alpine8
