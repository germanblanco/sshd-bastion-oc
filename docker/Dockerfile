FROM quay.io/openshifttest/alpine:1.2.0

RUN apk add openssh-server && \
    addgroup -S tunneluser && \
    adduser -S tunneluser -G tunneluser --shell /bin/sh && \
    passwd -u tunneluser && \
    mkdir -p /keys/etc/ssh && \
    chmod a+r /keys && chmod a+x /keys && \
    chmod a+r /keys/etc && chmod a+x /keys/etc && \
    chmod a+r /keys/etc/ssh && chmod a+x /keys/etc/ssh && \
    chmod a+w /keys/etc/ssh && \
    mkdir -p /home/tunneluser/.ssh && \
    chmod a+r /home/tunneluser && \
    chmod a+x /home/tunneluser && \
    touch /home/tunneluser/.ssh/authorized_keys && \
    chmod a+w /home/tunneluser/.ssh/authorized_keys && \
    chmod a+r /home/tunneluser/.ssh/authorized_keys && \
    echo 'StrictModes no' >> /etc/ssh/sshd_config && \
    echo 'HostKey /keys/etc/ssh/ssh_host_rsa_key' >> /etc/ssh/sshd_config && \
    echo 'HostKey /keys/etc/ssh/ssh_host_ecdsa_key' >> /etc/ssh/sshd_config && \
    echo 'HostKey /keys/etc/ssh/ssh_host_ed25519_key' >> /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/udp

CMD ["/entrypoint.sh"]
