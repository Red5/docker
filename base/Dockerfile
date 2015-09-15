#
# Red5 + Java 7 Dockerfile
# 
# This is meant to be used as a point for extension.
#
# https://github.com/Red5/docker
# https://hub.docker.com/_/java/
#
FROM java:7
MAINTAINER Paul Gregoire <mondain@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RED5_VERSION 1.0.6-RELEASE

# Define RED5_HOME variable
ENV RED5_HOME /opt/red5

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \ 
    wget -q https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}/red5-server-${RED5_VERSION}-server.tar.gz && \
    tar -xzf red5-server-${RED5_VERSION}-server.tar.gz && \
    mv red5-server-${RED5_VERSION} ${RED5_HOME} && \
    rm red5-server-${RED5_VERSION}-server.tar.gz
