FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf install -y openssh-server passwd && \
    microdnf clean all
RUN useradd -m -s /bin/bash --uid 1001 tunneluser && \
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
    echo 'AllowUsers tunneluser' >> /etc/ssh/sshd_config

RUN chmod a+x /etc && chmod a+x /etc/ssh
RUN chmod a+r /etc && chmod a+r /etc/ssh && chmod a+r /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir -p /home/tunneluser/.ssh
RUN chown tunneluser:tunneluser /home/tunneluser/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/udp

CMD ["/entrypoint.sh"]
