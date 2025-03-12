FROM registry.access.redhat.com/ubi9/ubi-minimal

RUN microdnf upgrade -y && \
    microdnf install -y gcc git automake nmap procps && \
    microdnf clean all
RUN mkdir /src && \
    cd /src && \
    git clone https://github.com/sflow/sflowtool.git && \
    cd sflowtool && \
    git checkout v6.02 && \
    ./boot.sh && \
    ./configure && \
    make && \
    make install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6343/udp

CMD ["/entrypoint.sh"]
