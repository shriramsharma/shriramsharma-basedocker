FROM ubuntu
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends openjdk-7-jdk
RUN apt-get install -q -y vim
RUN apt-get install -q -y openssh-server
RUN apt-get install -q -y git
RUN mkdir /var/run/sshd
RUN echo 'root:docker' | chpasswd
RUN apt-get install -q -y wget

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
