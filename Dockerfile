FROM debian:10-slim

ARG VERSION_CODEBLOCKS \
    BUILD_DATE

LABEL org.label.build-date=$BUILD_DATE \
    org.label.version_codeblocks=$VERSION_CODEBLOCKS

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends sudo \
    ca-certificates \
    procps \
    curl \
    xz-utils \
    gdb \
    build-essential \
    gawk \
    libboost-system-dev \
    xterm \
    libgamin0 \
    libhunspell-dev && \
    apt-get install -qqy --no-install-recommends `apt-cache depends codeblocks | awk '/Depends:/{print$2}'` && \
    echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    addgroup dev && \
    useradd -d /home/dev -m -g dev dev && \
    curl -fSL -o /tmp/codeblocks.tar.xz "https://ufpr.dl.sourceforge.net/project/codeblocks/Binaries/$VERSION_CODEBLOCKS/Linux/Debian%2010/codeblocks_${VERSION_CODEBLOCKS}_amd64_stable.tar.xz" && \
    mkdir /tmp/codeblocks  && \
    tar -xf /tmp/codeblocks.tar.xz -C /tmp/codeblocks && \
    dpkg --force-all -i /tmp/codeblocks/*.deb && \
    apt-get install -f -qy && \
    apt-get clean && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/home/dev"]

CMD codeblocks
