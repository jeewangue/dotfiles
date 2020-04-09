#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BASEDIR=$(dirname $0)

# updated at 2020/04/09
# general server packages
echo -e "Installing ${RED}Prerequisite${NC}"
echo -e "${BLUE}build-essential, git, git-flow, vim, neovim, zsh, tmux, xclip, curl, openssl, autojump, tree, htop, glances, imagemagick, graphicsmagick, sqlite3, docker, docker-compose${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  apt update
  apt upgrade
  apt install -y build-essential git git-flow zsh vim neovim tmux xclip curl openssl autojump tree htop glances imagemagick graphicsmagick sqlite3
	apt install -y docker docker-compose
fi

# updated at 2019/07/13
# general X packages
echo -e "Installing ${RED}X packages${NC}"
echo -e "${BLUE}fonts-powerline${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  apt update
  apt upgrade
  apt install -y fonts-powerline
fi

# updated at 2020/04/09
# Java11
echo -e "Installing ${RED}Oracle Java11${NC}"
echo -n "continue? [y/N] "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  add-apt-repository ppa:linuxuprising/java
  apt update
  apt install oracle-java11-installer-local
fi

