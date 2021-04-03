# syntax = docker/dockerfile:1.0-experimental
FROM nvidia/cuda:11.2.1-base-ubuntu20.04

ENV PYTHON_VERSION 3.8.8


# install pyenv and more...
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME /root
ENV PYTHON_ROOT $HOME/local/python-$PYTHON_VERSION
ENV PATH $PYTHON_ROOT/bin:$PATH
ENV PYENV_ROOT $HOME/.pyenv
RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y \
  git \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libffi-dev \
  liblzma-dev \
  && git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT \
  && $PYENV_ROOT/plugins/python-build/install.sh \
  && /usr/local/bin/python-build -v $PYTHON_VERSION $PYTHON_ROOT \
  && rm -rf $PYENV_ROOT

# update pip and install pipenv
RUN pip --version \
  && python -m pip install --upgrade pip \
  && pip install pipenv \
  && pipenv --version

# intall pipfile lock
COPY core/Pipfile /core/Pipfile
COPY core/Pipfile.lock /core/Pipfile.lock
RUN cd core \
  && pipenv install --system --deploy
