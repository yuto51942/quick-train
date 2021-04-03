FROM nvidia/cuda:11.2.0-runtime-ubuntu20.04

ENV PYTHON_VERSION 3.8.8


# install pyenv and more...
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN sudo apt update && sudo apt upgrade && \
  sudo apt install -y \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  git

RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
  eval "$(pyenv init -)"

RUN CFLAGS=-I/usr/include \
  LDFLAGS=-L/usr/lib \
  pyenv install -v $PYTHON_VERSION && \
  pyenv global $PYTHON_VERSION

RUN python -m pip install --upgrade pip && \
  pip install pipenv && \
  pipenv --verison

