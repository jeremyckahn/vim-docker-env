# Adapted from https://hub.docker.com/r/haron/vim/dockerfile

FROM ubuntu:latest

MAINTAINER Jeremy Kahn <jeremyckahn@gmail.com>

# environment variables
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
      vim \
      git \
      ripgrep \
      software-properties-common

RUN add-apt-repository ppa:lazygit-team/release && \
    apt-get update && \
    apt-get install -y lazygit

RUN useradd vimuser && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/vimuser
ENV HOME /home/vimuser

RUN chown -R vimuser:vimuser $HOME
USER vimuser
