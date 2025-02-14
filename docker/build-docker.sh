#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:ubuntu4 .
podman push quay.io/abranzyck/sshd-bastion:ubuntu4
