#!/bin/bash

oc get pod --namespace=test-gw

oc get deployment --namespace=test-gw

export POD_NAME=$(oc get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')

oc scale deployment sshd-bastion --namespace test-gw --replicas=0

oc delete pod $POD_NAME --namespace test-gw
