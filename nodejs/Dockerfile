# this image augments Ubuntu 16.04 with the minimum necessary to run Yocto with support for QEMU and devtool
FROM ubuntu:16.04
MAINTAINER ganesh <ganesh.rvec@gmail.com>

# Upgrade system
RUN apt-get update && apt-get -y upgrade 

# Set up locales
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

# Install nodejs basic packages and extras
# https://github.com/nodesource/distributions/blob/master/README.md
RUN apt-get -y install git-core diffstat unzip curl
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

