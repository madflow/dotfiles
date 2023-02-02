FROM --platform=linux/amd64 archlinux:latest

ARG UID=501
ARG USER="guest"

RUN pacman -Syu --noconfirm && \
  pacman --noconfirm -S \
  cmake \
  curl \
  fzf \
  git \
  go \
  lsd \
  make \
  neovim \
  nodejs \
  openssh \
  php \
  python \
  sudo \
  tmux \
  vim \
  wget \
  yarn \
  zsh

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -l -u ${UID} ${USER}
USER ${USER}
WORKDIR /home/${USER}

RUN mkdir -p /home/${USER}/.config && \
  mkdir -p /home/${USER}/.ssh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY --chown=guest:guest . /home/${USER}/.dotfiles
RUN  /home/${USER}/.dotfiles/install.sh


CMD ["zsh"]
