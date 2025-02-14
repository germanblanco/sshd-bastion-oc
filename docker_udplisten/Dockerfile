FROM quay.io/bedrock/ubuntu:xenial-20210804

RUN apt update && apt upgrade -y &&\
    apt install -y socat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6343/udp

CMD ["/entrypoint.sh"]
