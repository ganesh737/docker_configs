# this image augments Ubuntu 20.04 with the minimum necessary to run Yocto with support for QEMU and devtool
FROM ubuntu:20.04
MAINTAINER ganesh <ganesh.rvec@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Upgrade system
RUN apt-get update

RUN apt-get -y install locales apt-utils sudo
RUN dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get -y dist-upgrade

# Install nodejs basic packages and extras
# https://github.com/nodesource/distributions/blob/master/README.md
RUN apt-get -y install git-core diffstat unzip curl gcc g++ cmake build-essential
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g npm

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

