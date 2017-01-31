set nocompatible
filetype on
filetype off

set cm=blowfish2

" EnCoding
set enc=UTF-8
set fileencodings=UTF-8
set fencs=utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le
set visualbell
set backspace=indent,eol,start
set statusline=%h%F%m%r%=[%l:%c(%p%%)]
set tabstop=2
set shiftwidth=2
set cindent
set autoindent
set smartindent
"filetype indent on
set history=15
set ruler
set showcmd
set nobackup
set foldmethod=marker
set hlsearch
set background=dark
set number
set visualbell
set noswapfile

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

syntax on

map <F1> <ESC>:help<CR>
map <F2> <ESC>:NERDTree<CR>
map <F3> <ESC>:w<CR>
map <F4> <ESC>:wq<CR>

map <F6> <ESC>:vs<CR>
map <F7> <ESC>:sp<CR>
map <F8> <ESC>:new<CR>
map <F9> <ESC>:close<CR>
map <C-TAB> <C-p>
let mapleader=","

" Vundle
set nocompatible              " be iMproved
filetype on
filetype off                  " required!

" For Ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
" End Ocaml

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non-GitHub repos
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-ruby/vim-ruby'
" Git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://Users/usrname/path/to/plugin'



" goznauk installed
Plugin 'The-NERD-tree'

Plugin 'Source-Explorer-srcexpl.vim'
Plugin 'pyflakes'
Plugin 'Python-Syntax'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'AutoComplPop'

call vundle#end()							" required
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

