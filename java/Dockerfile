FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y openjdk-17-jdk
RUN apt-get install -y ssh
RUN apt-get install -y git
RUN mkdir -p /run/sshd # ssh 사용을 위해서 만들어주어야함
RUN apt-get clean
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
