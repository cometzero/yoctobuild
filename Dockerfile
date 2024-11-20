FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -yq gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm \
     libncurses5-dev zstd lz4 tmux telnet bc wget cpio bash vim locales file net-tools iputils-ping unzip sudo iproute2 curl \
     python3 python3-newt python3-pip && \
     pip3 install --upgrade kas==4.3.2 && \
     rm -rf /var/lib/apt-lists/* && \
        echo "dash dash/sh boolean false" | debconf-set-selections && \
        dpkg-reconfigure dash

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LANG en_US.utf8
