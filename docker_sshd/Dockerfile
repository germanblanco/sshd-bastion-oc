FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf upgrade -y && \
    microdnf install -y openssh-server passwd && \
    microdnf clean all
RUN useradd -m -s /bin/false --uid 1001 tunneluser && \
    passwd -d tunneluser && \
    mkdir -p /keys && \
    chmod 777 /keys && \
    ssh-keygen -A && \
    chmod 666 /etc/ssh/* && \
    sed -i 's/HostKey \/etc/HostKey \/keys\/etc/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo 'GatewayPorts yes' >> /etc/ssh/sshd_config && \
    echo 'AuthenticationMethods publickey' >> /etc/ssh/sshd_config && \
    echo 'AllowUsers tunneluser' >> /etc/ssh/sshd_config && \
    mkdir -p /home/tunneluser/.ssh && \
    chown tunneluser:tunneluser /home/tunneluser/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/tcp

CMD ["/entrypoint.sh"]
