podman run -d --name sshd-bastion \
  -e SSH_PASS=${SSHPASS} \
  -p 2222:2222 -p 6343:6343/udp \
  sshd-bastion:latest

