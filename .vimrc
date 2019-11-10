set nocompatible

" crypto method
set cm=blowfish2

set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le
set visualbell
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set cindent
set autoindent
set smartindent
set ruler
set showcmd
set hlsearch
set background=dark
set number
set swapfile
set wildmenu

let mapleader=","

""" VUNDLE START
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" sessions
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'gikmx/ctrlp-obsession'
Plugin 'mbbill/undotree'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'chrisbra/csv.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" langs
Plugin 'udalov/kotlin-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'plytophogy/vim-virtualenv'

" theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" syntax / autocomplete
Plugin 'w0rp/ale'

Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'deoplete-plugins/deoplete-jedi'

" utils
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" kubernetes
Plugin 'c9s/helper.vim'
Plugin 'c9s/treemenu.vim'
Plugin 'c9s/vikube.vim'

call vundle#end()
filetype plugin indent on
syntax on
""" VUNDLE END

""" Plugin Configuration START

" NerdTree
map <C-n> <ESC>:NERDTree<CR>

" vim-fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

" ctrlp-obsession
nnoremap <leader>ss :CtrlPObsession<CR>

" undotree
if !isdirectory($HOME."/.vim/.undodir")
	call mkdir($HOME."/.vim/.undodir", "", 0700)
endif
set undodir=~/.vim/.undodir
set undofile
nnoremap <leader>ut :UndotreeToggle<CR>:UndotreeFocus<CR>

" tagbar
nnoremap <F8> :TagbarToggle<CR>

" vim-airline
set laststatus=2
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ale
let g:ale_linters = {
			\  'python': ['pylint']
			\}
let g:ale_fixers = {
			\  'python': ['yapf']
			\}

" deoplete
set pyxversion=3
let g:deoplete#enable_at_startup = 1

" goyo / limelight
map <C-f> <ESC>:Goyo<CR>

""" Plugin Configuration END

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab

map <F1> <ESC>:help<CR>

nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
nnoremap QQ :qall<CR>

" python
autocmd Filetype python setlocal foldmethod=indent foldlevel=99
nnoremap <space> za

