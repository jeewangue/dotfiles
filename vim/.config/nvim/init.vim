set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
