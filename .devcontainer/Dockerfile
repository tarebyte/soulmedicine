# Defaults to username created by the VSCode devcontainer Ubuntu base image
ARG USERNAME="vscode"

# Ubuntu variant used. Tied to the base image.
ARG VARIANT="jammy"

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/devcontainers/base:${VARIANT}

ARG USERNAME
ARG VARIANT
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# disable installing recommended packages to save space
RUN echo "APT::Install-Recommends \"false\";" > /etc/apt/apt.conf

RUN apt-get update && \
  apt-get upgrade -y

# Install build-essential before installing Homebrew as a dependency
RUN apt-get install -y build-essential

RUN apt-get install -y \
  build-essential \
  libffi-dev \
  libjemalloc-dev \
  libpq-dev \
  libreadline-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  shared-mime-info \
  tmux \
  zlib1g-dev && \
  apt-get autoremove -y

# Run as the target user
USER ${USERNAME}
ENV USER=${USERNAME}

COPY ../.ruby-version /tmp/.ruby-version

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  ~/.rbenv/bin/rbenv install $(cat /tmp/.ruby-version)

COPY ../.node-version /tmp/.node-version

RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv && \
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build && \
  ~/.nodenv/bin/nodenv install $(cat /tmp/.node-version)

COPY ../.python-version /tmp/.python-version

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
  ~/.pyenv/bin/pyenv install $(cat /tmp/.python-version)
