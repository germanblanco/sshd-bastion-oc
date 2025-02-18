#!/bin/bash

# oc create namespace test-gw

# oc create secret generic sshd-bastion-secret --from-literal=SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDToeYSw3Nrw5DSdSaBzisAW3tfZmhQcAoyKvnq0ammPKHJ5d/r2/+YUMsXD25eP6fuoSzuB3jhVZxhoUzWqXe43NneTzWYdcbEPIvQPqFylZoz9brZDk5mdDAMBpCo9K8X5S3GQboxmlHNuVsRk07XDchI9tJyXboU5+miJmcEcChWnx94Zm4N841pA2EBJpY9BTS+K9NU85nBL3Mg58+yO3ngj8ErCemvmrSBwE36Shnkqk+HZ5KVspXqrGfFirWRZYYFRfJiWj3u2I6HvOlAC7Yt5SnYnepc0itGkIlQFBN7dx6O1ZCkfmr/nL9KLZYgJ504HM2wXzhXonNjv8RkpsBRE3dHhAQBvrKLq+PKOTZJx3JHlhZuax9s/xMcedbt7oUfIvkyRCB75BQgvQNZOU04a9zsYewY+KzLtpHn6fNolNMP60DDvnrdPkE8iK1pZAxJ1eHC1q8U8oZMM00xVUsS1nU0GqJSUXNUf/Z21widlyQEGvmHziWQrISR3ec=" --namespace test-gw

oc adm policy add-scc-to-user anyuid -z default -n test-gw

oc apply -f charts/sshd-bastion/templates/service.yaml
oc apply -f charts/sshd-bastion/templates/deployment.yaml

oc get pod --namespace=test-gw

export POD_NAME=$(oc get pod --namespace=test-gw | tail -n1 | awk '{ print $1 }')

oc port-forward ${POD_NAME} 2222:2222 --namespace=test-gw
