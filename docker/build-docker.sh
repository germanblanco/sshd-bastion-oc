#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:ubuntu5 .
podman push quay.io/abranzyck/sshd-bastion:ubuntu5
