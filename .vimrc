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
Plugin 'udalov/kotlin-vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on
syntax on
""" VUNDLE END

""" VUNDLE SETUP START

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
if has("persistent_undo")
	set undodir=~/.vim/.undodir/
	set undofile
endif
nnoremap <leader>ut :UndotreeToggle<CR>:UndotreeFocus<CR>

" vim-airline
set laststatus=2
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" VUNDLE SETUP END

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

map <F1> <ESC>:help<CR>
map <C-n> <ESC>:NERDTree<CR>

nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
nnoremap QQ :qall<CR>
