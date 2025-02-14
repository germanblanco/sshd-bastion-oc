FROM quay.io/bedrock/ubuntu:xenial-20210804

RUN apt update && apt upgrade -y &&\
    apt install -y openssh-server && \
    useradd -m -s /bin/bash tunneluser && \
    passwd -d tunneluser && \
    mkdir -p /keys/etc/ssh && \
    mkdir -p /var/run/sshd && \
    chmod 755 /var/run/sshd && \
    ssh-keygen -A && \
    chmod 666 /etc/ssh/* && \
    mkdir -p /home/tunneluser/.ssh && \
    chmod a+r /home/tunneluser && \
    chmod a+x /home/tunneluser && \
    touch /home/tunneluser/.ssh/authorized_keys && \
    chmod a+w /home/tunneluser/.ssh/authorized_keys && \
    chmod a+r /home/tunneluser/.ssh/authorized_keys && \
    sed -i 's/StrictModes yes/StrictModes no/' /etc/ssh/sshd_config && \
    sed -i 's/UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /etc/ssh/sshd_config && \
    sed -i 's/HostKey \/etc/HostKey \/keys\/etc/' /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 2222/tcp 6343/udp

CMD ["/entrypoint.sh"]
