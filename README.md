# docker
Docker + Red5 items

What is [Docker](https://www.docker.com/)?

### Docker Base Images

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)
* [dockerfile/java](http://dockerfile.github.io/#/java)


### Docker Tags

We provides multiple tagged images:

* `latest` (default): Red5 1.0.5 Snapshot + OpenJDK Java 7 JDK (alias to `openjdk7-red5-105S`)
* `openjdk7-red5-105S`: Red5 1.0.5 Snapshot + OpenJDK Java 7 JDK
* `oraclejdk7-red5-105S`: Red5 1.0.5 Snapshot + Oracle Java 7 JDK

# EVERYTHING BELOW THIS LINE IS NOT READY YET!!


For example, you can run a `Oracle Java 8` container with the following command:

    docker run -it --rm dockerfile/java:oracle-java8 java -version


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/java/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerfile/java`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/java" github.com/dockerfile/java`)


### Usage

    docker run -it --rm dockerfile/java

#### Run `java`

    docker run -it --rm dockerfile/java java

#### Run `javac`

    docker run -it --rm dockerfile/java javac