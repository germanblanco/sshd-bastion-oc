#!/bin/bash

ssh -vvv tunneluser@localhost -p 2222 -N -R 0.0.0.0:6343:127.0.0.1:7878 &
nc -u -l 127.0.0.1 6343 &
socat TCP4-LISTEN:7878,fork UDP4:127.0.0.1:6343 &
export POD_NAME=$(oc get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')
oc port-forward ${POD_NAME} 6343:6343 --namespace=test-gw
echo -n 'Hello World!' | nc -p 17777 -u 127.0.0.1 6343
