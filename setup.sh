#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BASEDIR=$(dirname $0)

# updated at 2019/07/13
# general server packages
echo -e "Installing ${RED}Prerequisite${NC}"
echo -e "${BLUE}build-essential, git, git-flow, vim, zsh, tmux, xclip, curl, openssl, autojump, tree, htop, glances, imagemagick, graphicsmagick, nginx, sqlite3, postgresql, redis-server fonts-powerline${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  sudo apt update
  sudo apt upgrade
  sudo apt install -y build-essential git git-flow zsh vim tmux xclip curl openssl autojump tree htop glances imagemagick graphicsmagick
  sudo apt install -y nginx sqlite3 postgresql redis-server 
fi

# updated at 2019/07/13
# general X packages
echo -e "Installing ${RED}X packages${NC}"
echo -e "${BLUE}fonts-powerline${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  sudo apt update
  sudo apt upgrade
  sudo apt install -y fonts-powerline
fi

# updated at 2019/07/13
# nodejs (v12)
echo -e "Installing ${RED}NodeJS (v12)${NC}"
echo -e "${BLUE}node, npm, yarn, diff-so-fancy${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm -g install yarn
  sudo yarn global add diff-so-fancy
fi

# updated at 2019/05/13
# Java10
echo -e "Installing ${RED}Oracle Java10${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  sudo add-apt-repository ppa:linuxuprising/java
  sudo apt update
  sudo apt install oracle-java10-installer
fi

# updated at 2019/07/13
# oh my zsh
echo -e "Installing ${RED}Zsh Configuration${NC}"
echo -e "${BLUE}ohmyzsh, spaceship-prompt, zsh-syntax-highlighting, zsh-autosuggestions${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
  ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

  cp -v "$BASEDIR/.zshrc"     "$HOME/.zshrc"
fi

# updated at 2019/07/13
# git
echo -e "Installing ${RED}Git Configuration${NC}"
echo -e "${BLUE}.gitconfig .gitignore${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  cp -v "$BASEDIR/.gitconfig" "$HOME/.gitconfig"
  cp -v "$BASEDIR/.gitignore" "$HOME/.gitignore"
  read -r -p "[git] enter your name: " response_name
  read -r -p "[git] enter your email: " response_email
  git config --global user.name "$response_name"
  git config --global user.email "$response_email"
fi

# updated at 2019/07/13
# vim
echo -e "Installing ${RED}Vim Configuration${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  cp -v "$BASEDIR/.vimrc"     "$HOME/.vimrc"
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

# updated at 2019/07/13
# tmux plugin manager
echo -e "Installing ${RED}Tmux Configuration${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  cp -v "$BASEDIR/.tmux.conf" "$HOME/.tmux.conf"
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh
fi
