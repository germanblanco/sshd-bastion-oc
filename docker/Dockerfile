FROM quay.io/openshifttest/alpine:1.2.0

RUN apk add openssh-server && \
    addgroup -S tunneluser && \
    adduser -S tunneluser -G tunneluser --shell /bin/sh && \
    passwd -u tunneluser && \
    ssh-keygen -A && \
    mkdir -p /home/tunneluser/.ssh && \
    chmod a+r /home/tunneluser && \
    chmod a+x /home/tunneluser && \
    touch /home/tunneluser/.ssh/authorized_keys && \
    chmod a-w /home/tunneluser/.ssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/udp

CMD ["/entrypoint.sh"]
