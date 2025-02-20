#!/bin/bash

kubectl get pod --namespace=test-gw

kubectl get deployment --namespace=test-gw

export POD_NAME=$(kubectl get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')

kubectl scale deployment sshd-bastion --namespace test-gw --replicas=0

kubectl delete pod $POD_NAME --namespace test-gw
