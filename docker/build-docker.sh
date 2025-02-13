#!/bin/bash
podman build -t default-route-openshift-image-registry.apps-crc.testing/test-gw/sshd-bastion:test4 .
podman push default-route-openshift-image-registry.apps-crc.testing/test-gw/sshd-bastion:test4
