#!/bin/bash
podman build -t quay.io/abranzyck/sshd-udplisten:ubuntu7 .
podman push quay.io/abranzyck/sshd-udplisten:ubuntu7
