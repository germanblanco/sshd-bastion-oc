FROM quay.io/fedora/fedora:latest

RUN dnf install -y openssh-server iproute iputils && \
    dnf clean all
RUN useradd -m -s /bin/bash tunneluser && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo 'AllowUsers tunneluser' >> /etc/ssh/sshd_config

RUN ssh-keygen -A
RUN mkdir -p /home/tunneluser/.ssh
RUN chown tunneluser:tunneluser /home/tunneluser/.ssh
RUN chmod 700 /home/tunneluser/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/udp

CMD ["/entrypoint.sh"]
