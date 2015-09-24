# Red5 Media Server

Docker + Red5 items

What is [Docker](https://www.docker.com/)?

### Docker Base Images

* [ubuntu](https://registry.hub.docker.com/_/ubuntu/)
* [java](https://registry.hub.docker.com/_/java/)

### Docker Tags

We provides multiple tagged images:

* `latest` (default): Red5 1.0.6 Release + OpenJDK Java 7 JDK (alias to `red5-106`)
* `base`: Red5 1.0.6 Release extendable base image
* `base-jdk8`: Same version as above with OpenJDK 8
* `red5-106-jdk8`: Red5 1.0.6 Release + OpenJDK 8
* `red5-107-jdk8`: Red5 1.0.7 Snapshot + OpenJDK 8

Older

* `openjdk7-red5-104R`: Red5 1.0.4 Release + OpenJDK Java 7 JDK
* `openjdk7-red5-105S`: Red5 1.0.5 Snapshot + OpenJDK Java 7 JDK
* `oraclejdk7-red5-104R`: Red5 1.0.4 Release + Oracle Java 7 JDK
* `oraclejdk7-red5-105S`: Red5 1.0.5 Snapshot + Oracle Java 7 JDK


For example, you can run a `Red5` container with the following command:

    docker run -it --rm mondain/red5


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/mondain/red5/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull mondain/red5`

   (alternatively, you can build an image from Dockerfile: `docker build -t="mondain/red5" github.com/Red5/docker`)


### Usage

 1. Starts red5 and exposes default ports for http and rtmp/e
```sh
    docker run -it -p 5080:5080 -p 1935:1935 --rm mondain/red5
```

 1. Starts red5 and exposes default ports for http, rtmp/e, and websocket
```sh
    docker run -it -p 5080:5080 -p 1935:1935 -p 8081:8081 --rm mondain/red5
```
    
### Additional Information

 * [Container linking](https://docs.docker.com/userguide/dockerlinks/)
 * [Managing data](https://docs.docker.com/userguide/dockervolumes/)
 

