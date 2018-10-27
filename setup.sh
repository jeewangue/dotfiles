#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BASEDIR=$(dirname $0)

# general
echo -e "Installing ${RED}Prerequisite${NC}"
echo -e "${BLUE}build-essential, git, git-flow, vim, zsh, tmux, openssl, autojump, tree, htop, imagemagick, nginx, sqlite3, redis-server${NC}"
read -r -p "continue?"
sudo apt update
sudo apt upgrade
sudo apt install -y build-essential git git-flow zsh vim tmux curl openssl autojump tree htop imagemagick
sudo apt install -y nginx sqlite3 redis-server 

# nodejs
echo -e "Installing ${RED}NodeJS (v8)${NC}"
echo -e "${BLUE}node, npm, yarn, diff-so-fancy${NC}"
read -r -p "continue?"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm -g install yarn
sudo yarn global add diff-so-fancy

# java
echo -e "Installing ${RED}Oracle Java8${NC}"
read -r -p "continue?"
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer

# oh my zsh
echo -e "Installing ${RED}Zsh Configuration${NC}"
echo -e "${BLUE}ohmyzsh, spaceship-prompt, zsh-syntax-highlighting${NC}"
read -r -p "continue?"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp -v "$BASEDIR/.zshrc"     "$HOME/.zshrc"

# git
echo -e "Installing ${RED}Git Configuration${NC}"
echo -e "${BLUE}.gitconfig .gitignore${NC}"
read -r -p "continue?"
cp -v "$BASEDIR/.gitconfig" "$HOME/.gitconfig"
cp -v "$BASEDIR/.gitignore" "$HOME/.gitignore"
read -r -p "[git] enter your name: " response_name
read -r -p "[git] enter your email: " response_email
git config --global user.name "$response_name"
git config --global user.email "$response_email"

# vim
echo -e "Installing ${RED}Vim Configuration${NC}"
read -r -p "continue?"
cp -v "$BASEDIR/.vimrc"     "$HOME/.vimrc"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux plugin manager
echo -e "Installing ${RED}Tmux Configuration${NC}"
read -r -p "continue?"
cp -v "$BASEDIR/.tmux.conf" "$HOME/.tmux.conf"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

