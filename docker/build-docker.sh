#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:ubuntu3 .
podman push quay.io/abranzyck/sshd-bastion:ubuntu3
