#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:test8 .
podman push quay.io/abranzyck/sshd-bastion:test8
