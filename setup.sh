#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential git zsh tmux openssl nginx autojump vim tree htop imagemagick libmysqlclient-dev sqlite3 graphviz 

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

# rails
rvm install 2.3.3 
gem install pry
gem install rails
gem install passenger
