![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

# Code::Blocks IDE

A Docker container for Code::Blocks

## Getting Started

These instructions will cover usage information and for the Docker container.

### Prerequisites

In order to run this container you'll need [Docker](https://docs.docker.com/get-started/) installed.

### Installing

Pull the image from the Docker repository:

```sh
docker pull dobolinux/codeblocks
docker tag dobolinux/codeblocks codeblocks
docker rmi dobolinux/codeblocks
```

Or build image from source:

```sh
git clone https://github.com/dobolinux/codeblocks.git
cd codeblocks
docker build -t codeblocks .
```

### Usage

#### Run

Start Code::Blocks:

```sh
docker container run -d --rm --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v codeblocks:/home/dev \
  --network host \
  codeblocks
```

#### Environment Variables

* `DISPLAY` - the X display server that the GUI applications will connect to

#### Volumes

* `/home/dev/` - workspace for all files saved

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details