set nocompatible

set laststatus=2
set cursorline
set cursorcolumn

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set smarttab
set cindent
set shiftround

set hlsearch
set incsearch
set smartcase
set ignorecase

set mouse=a

set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le

set termguicolors
set background=dark
set guifont=Hack\ Nerd\ Font:h12
set visualbell
set showcmd
set number
set relativenumber
set wildmenu
set cmdheight=2
set colorcolumn=+1,+2,+3

set signcolumn=auto

set formatoptions=jcroqlnt

set foldenable
set foldlevel=99
set foldlevelstart=99

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,winpos

set swapfile
set hidden
set backspace=indent,eol,start
set updatetime=300
set maxmempattern=50000
set timeoutlen=300
set undofile

let mapleader=","
let maplocalleader=","
syntax on

augroup filetype_visual_config
  autocmd!
  autocmd Filetype cpp            setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99 commentstring=//\ %s
  autocmd Filetype sql            setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99 commentstring=--\ %s
  autocmd Filetype vim            setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype markdown       setlocal ts=2 sw=2 sts=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype html           setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype ruby           setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype python         setlocal ts=4 sw=4 expandtab foldmethod=indent foldlevel=99
  autocmd Filetype haskell        setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype go             setlocal ts=2 sw=2 foldmethod=syntax foldlevel=99
  autocmd Filetype javascript     setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype typescript     setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype json           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=marker foldlevel=99 foldmarker={,}
  autocmd Filetype yaml           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=indent foldlevel=99
  autocmd Filetype helm           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=indent foldlevel=99
  autocmd Filetype proto          setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
augroup END

" fold text
function! MyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction

set foldtext=MyFoldText()

" fold shortcut
nnoremap <space> za
vnoremap <space> za

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap qq :<C-u>q<CR>
nnoremap qa :<C-u>qa<CR>

