#
# Red5 + JDK 21 Dockerfile
#
# https://github.com/Red5/docker
# https://hub.docker.com/_/eclipse-temurin
#
FROM eclipse-temurin:21-jdk
LABEL org.opencontainers.image.authors="Paul Gregoire <mondain@gmail.com>"

# Define as an ARG with a default value
ARG RED5_VERSION=2.0.34

ENV DEBIAN_FRONTEND=noninteractive
# Assign ARG value to ENV
ENV RED5_VERSION=${RED5_VERSION}

# Define RED5_HOME variable
ENV RED5_HOME=/opt/red5

RUN mkdir -p $RED5_HOME && \
    apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget -q https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}/red5-server-${RED5_VERSION}.tar.gz -O red5.tar.gz && \
    tar -xzf red5.tar.gz -C ${RED5_HOME} --strip-components=1 && \
    rm -rf red5.tar.gz

# https://docs.docker.com/userguide/dockervolumes/
VOLUME [ $RED5_HOME ]

WORKDIR /opt/red5

EXPOSE 843 1935 5080 5443 8081 8443

ENTRYPOINT ["./red5.sh"]

