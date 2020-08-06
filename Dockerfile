# Adapted from https://hub.docker.com/r/haron/vim/dockerfile

FROM ubuntu:latest

MAINTAINER Jeremy Kahn <jeremyckahn@gmail.com>

# environment variables
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y vim git wget tzdata

RUN useradd vimuser && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/vimuser
ENV HOME /home/vimuser

RUN chown -R vimuser:vimuser $HOME
USER vimuser

# setup pathogen vim plugin manager
RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
    wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim && \
    echo "execute pathogen#infect()" >> $HOME/.vimrc && \
    echo "syntax on"                 >> $HOME/.vimrc && \
    echo "filetype plugin indent on" >> $HOME/.vimrc
