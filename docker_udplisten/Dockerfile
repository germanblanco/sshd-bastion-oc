FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf upgrade -y && \
    microdnf install -y socat net-tools procps vim nmap && \
    microdnf clean all

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6343/udp

CMD ["/entrypoint.sh"]
