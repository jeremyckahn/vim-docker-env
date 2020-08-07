# Adapted from https://hub.docker.com/r/haron/vim/dockerfile

FROM ubuntu:latest

MAINTAINER Jeremy Kahn <jeremyckahn@gmail.com>

# environment variables
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
      vim \
      git \
      wget \
      curl \
      nodejs \
      build-essential \
      cmake \
      clang \
      python-dev \
      python3-dev \
      ripgrep

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

RUN useradd vimuser && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/vimuser
ENV HOME /home/vimuser

RUN chown -R vimuser:vimuser $HOME
USER vimuser
