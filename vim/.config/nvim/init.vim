set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:ruby_host_prog = '~/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host'
