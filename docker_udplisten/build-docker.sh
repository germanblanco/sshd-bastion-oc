#!/bin/bash
podman build -t quay.io/abranzyck/sshd-udplisten:arm_ubuntu5 .
podman push quay.io/abranzyck/sshd-udplisten:arm_ubuntu5
