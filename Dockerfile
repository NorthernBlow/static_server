FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    apt-get clean

RUN mkdir /var/run/sshd && sed -i 's/#Port 22/Port 23/' \
    /etc/ssh/sshd_config

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' \
    /etc/ssh/sshd_config


RUN mkdir -p /root/.ssh/authorized_keys

RUN if [ -f /run/.secrets/authorized_keys ]; then \
    cp /run/.secrets/authorized_keys /root/.ssh/authorized_keys; \
    fi


EXPOSE 23/tcp

CMD ["/usr/sbin/sshd", "-D"]
