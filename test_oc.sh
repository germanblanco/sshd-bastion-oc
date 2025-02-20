#!/bin/bash

# oc create namespace test-gw

# oc create secret generic sshd-bastion-secret --from-literal=SSH_KEY="ssh-rsa XXXXXXXXXXXXXXX --namespace test-gw

oc adm policy add-scc-to-user anyuid -z default -n test-gw

oc apply -f charts/sshd-bastion/templates/deployment.yaml

oc get pod --namespace=test-gw

export POD_NAME=$(oc get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')

oc port-forward ${POD_NAME} 2222:2222 --namespace=test-gw
