#!/bin/bash
podman build -t quay.io/abranzyck/sshd-bastion:arm_ubuntu5 .
podman push quay.io/abranzyck/sshd-bastion:arm_ubuntu5
