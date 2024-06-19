FROM debian:latest

WORKDIR /root

# Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git cmake gettext -y

# Set up NVIM 0.10.0
RUN cd ~ && \
  git clone https://github.com/neovim/neovim.git && \
  cd neovim && \
  git checkout v0.10.0 && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install

# Set up dotfiles
RUN mkdir ~/.config && \ 
  cd ~ && \
  git clone https://github.com/NicerNewerCar/dotfiles.git && \
  cd dotfiles && \
  apt install zsh tmux python3 python3-venv -y && \
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  ln -s $(pwd)/zshrc ~/.zshrc && \
  ln -s $(pwd)/tmux.conf ~/.tmux.conf && \
  ln -s $(pwd)/nvim/ ~/.config/nvim && \
  cd ~ && \
  ln -s root/dotfiles/p10.zsh .p10k.zsh && \
  git config --global core.editor "nvim"

# Run zsh to get omz/p10k setup out of the way
RUN zsh
