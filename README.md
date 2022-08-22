- [1. Code::Blocks IDE](#1-codeblocks-ide)
  - [1.1. Getting Started](#11-getting-started)
    - [1.1.1. Prerequisites](#111-prerequisites)
    - [1.1.2. Installing](#112-installing)
    - [1.1.3. Usage](#113-usage)
      - [1.1.3.1. Run](#1131-run)
      - [1.1.3.2. Environment Variables](#1132-environment-variables)
      - [1.1.3.3. Volumes](#1133-volumes)
- [2. License](#2-license)

# 1. Code::Blocks IDE

[![GitHub](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub Workflow Status](https://github.com/andrebossi/codeblocks/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/andrebossi/codeblocks/actions/workflows/docker-publish.yml)

A Docker container for Code::Blocks

## 1.1. Getting Started

These instructions will cover usage information and for the Docker container.

### 1.1.1. Prerequisites

In order to run this container you'll need [Docker](https://docs.docker.com/get-started/) installed.

### 1.1.2. Installing

Pull the image from the Docker repository:

```sh
VERSION=$(curl --silent http://www.codeblocks.org/downloads/binaries/ | egrep -i -o "codeblocks_(2[0-9]\.[0-9]+)_amd64_stable.tar.xz" -o | head -n1 | egrep -o "(2[0-9]\.[0-9]+)")

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

### 1.1.3. Usage

#### 1.1.3.1. Run

Start Code::Blocks:

```sh
docker container run -d --rm --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v codeblocks:/home/dev \
  --network host \
  codeblocks
```

#### 1.1.3.2. Environment Variables

* `DISPLAY` - the X display server that the GUI applications will connect to

#### 1.1.3.3. Volumes

* `/home/dev/` - workspace for all files saved

# 2. License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
