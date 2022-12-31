FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Berlin

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ansible \
    curl \
    golang \
    git \
    lsb-release \
    openssh-client \
    make \
    software-properties-common \
    sudo \
    vim \
    wget \
    zsh \
    && \
    rm -r /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

RUN add-apt-repository ppa:neovim-ppa/stable && \ 
    apt-get update && \ 
    apt-get install -y  neovim && \
    rm -r /var/lib/apt/lists/*
