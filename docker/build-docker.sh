#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:test6 .
podman push quay.io/abranzyck/sshd-bastion:test6
