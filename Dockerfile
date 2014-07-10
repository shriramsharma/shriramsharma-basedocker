FROM ubuntu
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

ENV LAST_UPDATED 07082014

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y vim-tiny
RUN apt-get install -q -y openssh-server
RUN apt-get install -q -y git
RUN mkdir /var/run/sshd
RUN echo 'root:docker' | chpasswd
RUN apt-get install -q -y wget
ADD run.sh /

EXPOSE 22
CMD ["sh", "/run.sh"]
