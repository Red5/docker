# Red5 Media Server

Docker image for the [Red5 server](https://github.com/Red5/red5-server), built from the official release tarball on top of [Eclipse Temurin](https://hub.docker.com/_/eclipse-temurin) JDK 25.

Images are published to Docker Hub as [`mondain/red5`](https://hub.docker.com/r/mondain/red5) for `linux/amd64` and `linux/arm64`.

### Tags

Each Red5 release is published with these tags (shown for 2.2.0):

* `2.2.0` - exact release
* `2.2` - latest patch of the minor series
* `2` - latest release of the major version
* `latest` - most recent release, currently Red5 2.2.0 + JDK 25

Pin an exact version for reproducible deployments.

### Installation

1. Install [Docker](https://www.docker.com/).
2. Pull the image: `docker pull mondain/red5`

To build the image yourself instead, see [Building](#building).

### Usage

Start Red5 with the HTTP and RTMP ports published:

```sh
docker run -it --rm -p 5080:5080 -p 1935:1935 mondain/red5
```

Also publish the secure ports (HTTPS and RTMPS):

```sh
docker run -it --rm -p 5080:5080 -p 1935:1935 -p 5443:5443 -p 8443:8443 mondain/red5
```

Run detached with a name, then follow the log:

```sh
docker run -d --name red5 -p 5080:5080 -p 1935:1935 mondain/red5
docker logs -f red5
```

Ports exposed by the image:

| Port | Default use |
|------|-------------|
| 1935 | RTMP |
| 5080 | HTTP |
| 5443 | HTTPS |
| 8443 | RTMPS |
| 843 | Flash socket policy |
| 8081 | Additional services configured in your Red5 install |

Red5 is installed in `/opt/red5` (`RED5_HOME`), which is declared as a volume. A named volume is populated from the image on first use. A bind-mounted host directory is not, and an empty one hides the installed files, so copy `/opt/red5` out of the image into it first.

The JVM options can be overridden with the `JVM_OPTS` environment variable, which replaces the defaults chosen by `red5.sh`:

```sh
docker run -it --rm -e JVM_OPTS="-XX:+UseG1GC -Xms512m -Xmx2g" -p 5080:5080 -p 1935:1935 mondain/red5
```

### Building

Build from this repository; `RED5_VERSION` selects which [red5-server release](https://github.com/Red5/red5-server/releases) tarball is downloaded (the Dockerfile has a default, currently 2.2.0):

```sh
docker build -t mondain/red5 .
docker build --build-arg RED5_VERSION=2.2.0 -t mondain/red5:2.2.0 .
```

The release must exist and have `red5-server-<version>.tar.gz` attached, since the image is built from that file.

### Publishing

Images are pushed to Docker Hub automatically by the workflow in this repository when a release is published in [Red5/red5-server](https://github.com/Red5/red5-server) (its `push-docker-image.yml` calls the reusable workflow here, pinned to a commit of this repository). The release tag must be of the form `v<major>.<minor>.<patch>` and the tarball must be attached to the release before it is published.

To push manually:

```sh
# sign in to Docker Hub
docker login

# tag for your Docker Hub namespace
docker tag mondain/red5:2.2.0 <youruser>/red5:2.2.0
docker tag mondain/red5:2.2.0 <youruser>/red5:latest

# push
docker push <youruser>/red5:2.2.0
docker push <youruser>/red5:latest
```

### Additional Information

* [Docker volumes](https://docs.docker.com/engine/storage/volumes/)
* [Container networking](https://docs.docker.com/engine/network/)
