FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=m42nk
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update -y && \
  apt-get install -y \
  sudo \
  curl \
  git \
  build-essential \
  software-properties-common \
  python3 \
  python3-pip

RUN apt-add-repository -y ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install -y neovim

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -m -u $USER_UID -g $USERNAME $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN mkdir -p /home/$USERNAME/.local/share/nvim
WORKDIR /home/$USERNAME

CMD [ "bash" ]
