FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

COPY ./of/scripts/linux/debian/install_dependencies.sh /tmp/install_dependencies.sh

RUN /tmp/install_dependencies.sh -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /of/apps
