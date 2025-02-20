#!/bin/zsh

kubectl create namespace test-gw

kubectl create secret generic sshd-bastion-secret --from-literal=SSH_KEY="ssh-rsa XXXXXXXXXXXX --namespace test-gw

kubectl apply -f charts/sshd-bastion/templates/service.yaml

kubectl get pod --namespace=test-gw

export POD_NAME=$(kubectl get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')

kubectl port-forward ${POD_NAME} 2222:2222 --namespace=test-gw
