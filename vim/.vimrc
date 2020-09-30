" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let s:darwin = has('mac')

set nocompatible

" crypto method
silent! set cryptmethod=blowfish2

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
set ignorecase
set cursorline
set relativenumber

let mapleader=","
syntax on

""" PLUG START
call plug#begin('~/.vim/plugged')

"--- sessions ---
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'
Plug 'mbbill/undotree'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/csv.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

"--- langs ---
Plug 'udalov/kotlin-vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Neovim / Vim integration for Delve (Go debugger)
Plug 'sebdah/vim-delve'
Plug 'neovimhaskell/haskell-vim'
Plug 'jparise/vim-graphql'

"--- syntax ---
Plug 'towolf/vim-helm'
Plug 'mustache/vim-mustache-handlebars'

"--- theme ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

"--- syntax / autocomplete ---
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'master' }
Plug 'antoinemadec/coc-fzf'
Plug 'tjdevries/coc-zsh'
Plug 'sheerun/vim-polyglot'

"--- tags explorer ---
Plug 'liuchengxu/vista.vim'

"--- utils ---
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'skanehira/docker-compose.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'lambdalisue/suda.vim' " write suda://PATH
Plug 'diepm/vim-rest-console' " api console
Plug 'neomutt/neomutt.vim' " email
Plug 'felipec/notmuch-vim' " email
Plug 'TheZoq2/neovim-auto-autoread' " Autoread
Plug 'voldikss/vim-floaterm'
Plug 'kkoomen/vim-doge' " documentation generator
Plug 'ryanoasis/vim-devicons'

"--- finder ---
Plug 'liuchengxu/vim-clap'

"--- kubernetes ---
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'

call plug#end()
""" PLUG END

""" Plugin Configuration START

" python_host_prog
let g:python_host_prog = '~/.local/share/virtualenvs/python2-RgfmKSho/bin/python'
let g:python3_host_prog = '~/.local/share/virtualenvs/python3-DPjnFJNF/bin/python'
let g:node_host_prog = '~/.yarn/bin/neovim-node-host'

" Coc Extensions
let g:coc_global_extensions=[
      \ 'coc-highlight', 'coc-prettier', 'coc-html', 'coc-css', 'coc-xml',
      \ 'coc-tsserver', 'coc-eslint', 'coc-python', 'coc-solargraph',
      \ 'coc-vimlsp', 'coc-json', 'coc-yaml', 'coc-git', 'coc-yank',
      \ 'coc-snippets', 'coc-lists', 'coc-omnisharp', 'coc-pyright',
      \ 'coc-markdownlint', 'coc-explorer', 'coc-go', 'coc-docker',
      \ 'coc-actions', 'coc-cmake', 'coc-powershell', 'coc-clangd',
      \ 'coc-lua', 'coc-sh', 'coc-phpls', 'coc-texlab', 'coc-react-refactor',
      \ 'coc-styled-components'
      \ ]

" vim-fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gvdiffsplit!<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" ctrlp-obsession
nnoremap <leader>ss :CtrlPObsession<CR>

" undotree
if !isdirectory($HOME."/.vim/.undodir")
  call mkdir($HOME."/.vim/.undodir", "", 0700)
endif
set undodir=~/.vim/.undodir
set undofile
nnoremap <leader>ut :UndotreeToggle<CR>:UndotreeFocus<CR>


" vim-airline
set laststatus=2
let g:airline_theme = 'simple'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

command! AirlineThemes call fzf#run({
  \ 'source':  map(split(globpath(&rtp, 'autoload/airline/themes/*.vim'), "\n"),
  \               "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \ 'sink':    'AirlineTheme',
  \ 'options': '+m --prompt="Airline Themes> "',
  \ 'down':    '~40%'
  \ })

" ale
" let g:ale_set_highlights = 0
" let g:ale_linters = {
"       \  'javascript': ['eslint'],
"       \  'typescript': ['eslint'],
" 			\  'python': ['pylint'],
"       \  'ruby': ['solargraph'],
"       \  'zsh': ['shell'],
" 			\}
" let g:ale_fixers = {
"       \  'javascript': ['eslint'],
"       \  'typescript': ['eslint'],
"       \  'python': ['black'],
"       \  'ruby': ['rubocop']
"       \}

" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

""" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" goyo / limelight
map <C-g> <ESC>:Goyo<CR>

" fzf
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" fzf: All files
command! -nargs=? -complete=dir AFI
      \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
      \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
      \ })))

" fzf: All files & ignore
command! -nargs=? -complete=dir AF
      \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
      \   'source': 'fd --type f --hidden --follow --exclude .git '.expand(<q-args>)
      \ })))

nnoremap <leader>, :AF<CR>
nnoremap <leader>. :AFI<CR>
nnoremap <leader>/ :Buffers<CR>
" ripgrep
nnoremap <leader>rg :Rg<CR>

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

" coc
if has_key(g:plugs, 'coc.nvim')
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  inoremap <silent><expr> <C-space>
        \ pumvisible() ? "\<C-n>" :
        \ coc#refresh()

  inoremap <silent><expr> <C-S-space>
        \ pumvisible() ? "\<C-p>" :
        \ "\<ESC>:call CocAction('showSignatureHelp')\<CR>a"

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h' expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nnoremap <silent> gh :call <SID>show_documentation()<CR>

  let g:go_doc_keywordprg_enabled = 0

  augroup coc_config
    autocmd!
    autocmd VimEnter * nmap <silent> g? <Plug>(coc-diagnostic-info)
    autocmd VimEnter * nmap <silent> [g <Plug>(coc-diagnostic-prev)
    autocmd VimEnter * nmap <silent> ]g <Plug>(coc-diagnostic-next)

    autocmd VimEnter * nmap <silent> gd <Plug>(coc-definition)
    autocmd VimEnter * nmap <silent> gy <Plug>(coc-type-definition)
    autocmd VimEnter * nmap <silent> gi <Plug>(coc-implementation)
    autocmd VimEnter * nmap <silent> gr <Plug>(coc-references)
    autocmd VimEnter * nmap <silent> gp :call CocAction('showSignatureHelp')<CR>
    autocmd VimEnter * imap <silent> <C-p> <ESC>:call CocAction('showSignatureHelp')<CR>a
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup END


endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <silent> <leader>f <Plug>(coc-format-selected)
vmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

xmap <leader>fa <Plug>(coc-format)
nmap <leader>fa <Plug>(coc-format)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
nmap <silent> <leader>ac :<C-u>execute 'CocCommand actions.open ' . 'line'<CR>

" replaced by coc-actions
" xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
" nmap <silent> <leader>a <Plug>(coc-codeaction-selected)
" nmap <silent> <leader>ac <Plug>(coc-codeaction)
"
nmap <silent> <leader>qf <Plug>(coc-fix-current)
nmap <silent> <leader>ci :<C-u>CocInfo<CR>
nmap <silent> <leader>cc :<C-u>vs<CR>:<C-u>CocConfig<CR>
nmap <silent> <leader>cd :<C-u>CocDiagnostics<CR>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nmap <silent> <C-S-s> <Plug>(coc-range-select-backward)
xmap <silent> <C-S-s> <Plug>(coc-range-select-backward)

""" coc-fzf
nnoremap <silent> <leader><space>a  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader><space>b  :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader><space>c  :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader><space>e  :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <leader><space>l  :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader><space>o  :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader><space>s  :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader><space>S  :<C-u>CocFzfList services<CR>
nnoremap <silent> <leader><space>y  :<C-u>CocFzfList yank<CR>
nnoremap <silent> <leader><space>p  :<C-u>CocFzfListResume<CR>
nnoremap <silent> <leader><space><space>  :<C-u>CocFzfList<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

""" coc-explorer
nnoremap <silent> <leader>n :CocCommand explorer --preset panel<CR>
nnoremap <silent> <leader>ee :CocCommand explorer --preset floating<CR>

" augroup openCocExplorer
"   autocmd!
"   autocmd SessionLoadPost * CocCommand explorer --preset panel
" augroup END

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-go
let g:go_def_mapping_enabled = 0

" rainbow
let g:rainbow_active = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'automatic_nested_syntaxes': 1,
      \ 'auto_toc': 1,
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'syntax': 'markdown',
      \ 'ext': '.md'}]
let g:vimwiki_global_ext = 0
" let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
autocmd Filetype vimwiki set syntax=markdown.pandoc
let g:tagbar_type_vimwiki = {
      \ 'ctagstype': 'vimwiki'
      \ , 'kinds': ['h:header']
      \ , 'sro':'&&&'
      \ , 'kind2scope':{'h':'header'}
      \ , 'sort':0
      \ , 'ctagsbin':'~/vimwiki/vwtags.py'
      \ , 'ctagsargs': 'markdown'
      \ }


" pandoc
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#folding#mode = ["syntax"]
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ["c", "cpp", "cmake", "css", "dockerfile", "go", "html", 
      \ "haskell", "json", "java", "javascript", "javascriptreact", "markdown", "ocaml", "perl",
      \ "python", "ruby", "rust", "sql", "scala", "texinfo", "typescript", "xml", "yaml", "zsh",
      \ "bash=sh", "literatehaskell=lhaskell"]
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1

" markdown-preview.nvim
let g:mkdp_auto_start   = 0
let g:mkdp_auto_close   = 0
let g:mkdp_refresh_slow = 0
nmap <leader>mp <Plug>MarkdownPreviewToggle

" vim-haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" vista
nnoremap <leader>vv :Vista!!<CR>
nnoremap <leader>vc :Clap<CR>
nnoremap <leader>vf :Vista finder<CR>

let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'pandoc': 'markdown',
      \ 'markdown': 'toc',
      \ 'html': 'coc',
      \ 'ruby': 'coc',
      \ 'python': 'coc',
      \ 'go': 'ctags',
      \ 'javascript': 'coc',
      \ 'typescript': 'coc',
      \ 'typescript.tsx': 'coc',
      \ 'json': 'coc',
      \ 'yaml': 'coc',
      \ }
let g:vista_ctags_cmd = {
      \ 'go': 'gotags',
      \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista_update_on_text_changed = 1
let g:vista_update_on_text_changed_delay = 1000


""" coc-list
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>



""" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


""" indent-line
" let g:indentLine_char = '|'

""" vim syntax
let g:vimsyn_folding = 'af'

""" vim-rest-console
let g:vrc_show_command = 1
let g:vrc_curl_opts = {
      \ '--connect-timeout' : 10,
      \ '--max-time': 120,
      \ '--cookie': '~/.vim/cookie.txt',
      \ '--cookie-jar': '~/.vim/cookie.txt',
      \ '--location': '',
      \ '--include': '',
      \ '--ipv4': '',
      \ '--insecure': '',
      \}

""" vim-floaterm
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_autoclose     = '2'

let g:floaterm_width         = 0.8
let g:floaterm_height        = 0.8
let g:floaterm_winblend      = 0


""" Plugin Configuration END

augroup filetype_visual_config
  autocmd!
  autocmd Filetype vim            setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype markdown       setlocal ts=4 sw=4 sts=4 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype html           setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype ruby           setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype python         setlocal ts=4 sw=4 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype haskell        setlocal ts=2 sw=2 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype go             setlocal ts=2 sw=2 foldmethod=syntax foldlevel=99
  autocmd Filetype javascript     setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype typescript     setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype json           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
  autocmd Filetype yaml           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=indent foldlevel=99
  autocmd Filetype helm           setlocal ts=2 sw=2 sts=0 expandtab foldmethod=indent foldlevel=99
augroup END

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx



map <F1> <ESC>:help<CR>

nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
nnoremap QQ :qall<CR>

""" Fold
" fold shortcut
nnoremap <space> za
vnoremap <space> za

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

let base16colorspace=256
if has('nvim')
  source ~/.config/nvim/colorscheme.vim
else
  source ~/.vim/colorscheme.vim
endif


" Mail
command Mail e term://neomutt
augroup mailfiletype
  " Mail
  autocmd BufRead,BufNewFile *mutt-*      setfiletype mail
augroup END



" Simple Shortcut
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprevious<CR>
nmap <C-n> :tabnew<CR>

nmap <leader>qq :q<CR>
nmap <leader>qa :qa<CR>

autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
