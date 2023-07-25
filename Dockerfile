FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG USERNAME=m42nk
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# RUN sed -i 's/htt[p|ps]:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

RUN apt-get update -y

# software-properties-common \
RUN apt-get install -y \
  curl \
  git \
  build-essential \
  sudo

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -m -u $USER_UID -g $USERNAME $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install -y neovim

RUN apt-get install -y \
  python3 \
  python3-pip

USER $USERNAME

RUN mkdir -p /home/$USERNAME/.local/share/nvim
WORKDIR /home/$USERNAME

# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

CMD [ "bash" ]
