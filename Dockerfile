FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=m42nk
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Base packages
RUN apt-get update -y && \
  apt-get install -y \
  sudo \
  curl \
  git \
  build-essential \
  software-properties-common \
  locales \
  python3 \
  python3-pip

# Utility packages
RUN sudo apt-get update -y && \
  sudo apt-get install -y \
  ripgrep \
  fd-find \
  bat

# Set system locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
  locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Add user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -m -u $USER_UID -g $USERNAME $USERNAME \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && chown -R $USER_UID:$USER_GID /home/$USERNAME

# Install neovim
RUN apt-add-repository -y ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install -y neovim

USER $USERNAME
RUN mkdir -p /home/$USERNAME/.local/share/nvim
RUN mkdir -p /home/$USERNAME/.config/
WORKDIR /home/$USERNAME

# NOTE:
# Since we need to `source` asdf.sh script, we need to use bash/zsh instead of sh. 
# But, in common ubuntu .bashrc, the source won't be executed
# if the shell is not interactive. To fix it, we can:
# 1. source the asdf script in every RUN directive inside this dockerfile
# 2. run the asdf source command from .profile instead of .{bash,zsh}rc
# 3. use `bash -lic` as dockerfile SHELL (to toggle interactive mode)

# Install asdf version manager 
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1 && \
  echo "source $HOME/.asdf/asdf.sh" >> $HOME/.bashrc && \
  echo "source $HOME/.asdf/asdf.sh" >> $HOME/.zshrc

# Install node with asdf
SHELL ["/bin/bash", "-lic"] 
RUN asdf plugin add nodejs && \
  asdf install nodejs 18.18.1 && \
  asdf global nodejs 18.18.1

# Install neovim providers
RUN pip3 install --user pynvim && \
  npm install -g neovim

# Install python with asdf
# Uncomment following block if you different python version than ubuntu's default
# RUN asdf plugin add python && \
#   asdf install python 3.10.12 && \
#   asdf global python 3.10.12

CMD [ "bash" ]
