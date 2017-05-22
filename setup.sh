#!/bin/bash

BASEDIR=$(dirname $0)
cp -v "$BASEDIR/.gitconfig" "$HOME/.gitconfig"
cp -v "$BASEDIR/.gitignore" "$HOME/.gitignore"
cp -v "$BASEDIR/.zshrc"     "$HOME/.zshrc"
cp -v "$BASEDIR/.vimrc"     "$HOME/.vimrc"
cp -v "$BASEDIR/.tmux.conf" "$HOME/.tmux.conf"

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential git zsh tmux openssl autojump vim tree htop imagemagick sqlite3 graphviz nodejs ruby
sudo apt-get install -y nginx postgresql postgresql-server-dev-all redis-server libmysqlclient-dev 
sudo apt-get install -y diff-so-fancy

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -o - "https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh" | zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-better-npm-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-better-npm-completion

# git
read -r -p "[git] What's your name? " response_name
read -r -p "[git] What's your email? " response_email
git config --global user.name "$response_name"
git config --global user.email "$response_email"

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

# rails
rvm install ruby 
gem install bundler
gem install pry
gem install rails
gem install passenger

# java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

# elastic
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get update
sudo apt-get install elasticsearch
sudo apt-get install logstash
sudo apt-get install kibana
sudo apt-get install filebeat
sudo apt-get install metricbeat
sudo apt-get install packetbeat

