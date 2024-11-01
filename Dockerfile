FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    apt-get clean && \ 
    mkdir /var/run/sshd && sed -i 's/#Port 22/Port 23/' \
    /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' \
    /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh/

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 23/tcp

ENTRYPOINT ["/entrypoint.sh"]
