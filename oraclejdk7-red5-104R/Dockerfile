#
# Red5 + Oracle Java 7 Dockerfile
#
# https://github.com/Red5/docker
#

FROM dockerfile/java:oracle-java7
MAINTAINER Paul Gregoire <mondain@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RED5_VERSION 1.0.4-RELEASE

# Define RED5_HOME variable
ENV RED5_HOME /opt/red5

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \ 
    wget -q https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}/red5-server-${RED5_VERSION}-server.tar.gz && \
    tar -xzf red5-server-${RED5_VERSION}-server.tar.gz && \
    mv red5-server-${RED5_VERSION} /opt/red5 && \
    rm red5-server-${RED5_VERSION}-server.tar.gz

VOLUME ["/opt/red5"]

EXPOSE 843 1935 5080 5443 8081 8443

WORKDIR /opt/red5

ENTRYPOINT ["./red5.sh"]
