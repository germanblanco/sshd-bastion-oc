#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:ubuntu1 .
podman push quay.io/abranzyck/sshd-bastion:ubuntu1
