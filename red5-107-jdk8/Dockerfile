#
# Red5 + Java 8 Dockerfile
#
# https://github.com/Red5/docker
# https://hub.docker.com/_/java/
#
FROM java:8
MAINTAINER Paul Gregoire <mondain@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RED5_VERSION 1.0.7-SNAPSHOT

# Define RED5_HOME variable
ENV RED5_HOME /opt/red5

RUN mkdir -p $RED5_HOME

RUN apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \ 
    wget -q https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}/red5-server-${RED5_VERSION}-server.tar.gz -O red5.tar.gz && \
    tar -xzf red5.tar.gz && \
    mv red5-server-${RED5_VERSION}/* ${RED5_HOME} && \
    rm -rf red5*

# https://docs.docker.com/userguide/dockervolumes/
VOLUME [ $RED5_HOME ]

WORKDIR /opt/red5

EXPOSE 843 1935 5080 5443 8081 8443

ENTRYPOINT ["./red5.sh"]
