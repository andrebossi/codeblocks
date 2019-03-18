FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qy && \
    apt-get install -qqy --no-install-recommends sudo ca-certificates procps curl tar xz-utils gdb build-essential gawk libboost-system-dev xterm libgamin0 libhunspell-dev && \
    apt-get install -qqy --no-install-recommends `apt-cache depends codeblocks | awk '/Depends:/{print$2}'` && \
    echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    addgroup dev && \
    useradd -d /home/dev -m -g dev dev && \
    curl -fSL -o /tmp/codeblocks.tar.xz https://ufpr.dl.sourceforge.net/project/codeblocks/Binaries/17.12/Linux/Debian%20stable/codeblocks_17.12-1_amd64_stable.tar.xz && \
    tar -xf /tmp/codeblocks.tar.xz -C /tmp && \
    dpkg -i /tmp/*.deb && \
    apt-get install -f -qy

VOLUME ["/home/dev"]

CMD codeblocks