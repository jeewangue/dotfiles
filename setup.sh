#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential git zsh tmux openssl nginx autojump vim tree htop imagemagick libmysqlclient-dev sqlite3 graphviz nodejs
sudo apt-get install postgresql postgresql-server-dev-all redis-server

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

