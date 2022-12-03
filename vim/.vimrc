" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" set runtimepath^=/home/jeewangue/workspace/personal/repos/coc-dictd
" set runtimepath^=/home/jeewangue/workspace/personal/repos/coc-translate

set nocompatible
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le
set visualbell
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cindent
set autoindent
set smartindent
set ruler
set showcmd
set hlsearch
set incsearch
set number
set relativenumber
set background=dark
set swapfile
set wildmenu
set cursorline
set ignorecase
set smartcase
set mouse=a
set hidden
set cmdheight=2
set updatetime=300
set termguicolors
set maxmempattern=50000
" vim true-color problem
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if has('nvim')
  set signcolumn=auto:4
else
  set signcolumn=auto
endif

let mapleader=","
syntax on

" disable pandoc's filetype overwrite
let g:pandoc#filetypes#pandoc_markdown = 0

""" PLUG START
call plug#begin('~/.vim/plugged')

"--- sessions ---
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'mbbill/undotree'

"--- langs ---
Plug 'udalov/kotlin-vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Neovim / Vim integration for Delve (Go debugger)
Plug 'sebdah/vim-delve'
Plug 'neovimhaskell/haskell-vim'
Plug 'jparise/vim-graphql'
Plug 'preservim/vim-markdown'
Plug 'puremourning/vimspector'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
" Plug 'tpope/vim-rvm'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

"--- syntax ---
Plug 'towolf/vim-helm'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jeewangue/vim-protobuf'
Plug 'google/vim-jsonnet'

"--- theme ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

"--- syntax / autocomplete ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'tjdevries/coc-zsh'
Plug 'sheerun/vim-polyglot'
" Plug 'jeewangue/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"--- tags explorer ---
Plug 'liuchengxu/vista.vim'

"--- utils ---
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/csv.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'luochen1990/rainbow'
Plug 'skanehira/docker-compose.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'greyblake/vim-preview'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'Yggdroot/indentLine'
Plug 'lambdalisue/suda.vim' " write suda://PATH
Plug 'jeewangue/vim-rest-console' " api console
Plug 'neomutt/neomutt.vim' " email
Plug 'felipec/notmuch-vim' " email
Plug 'TheZoq2/neovim-auto-autoread' " Autoread
Plug 'voldikss/vim-floaterm'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " documentation generator
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'jkramer/vim-checkbox'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'


"--- kubernetes ---
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'
Plug 'andrewstuart/vim-kubernetes'

"--- plugins using deno ---
" Plug 'vim-denops/denops.vim'
" Plug 'skanehira/denops-docker.vim'

"--- my plugins ---
Plug 'jeewangue/coc-dictd', {'branch': 'master'}
Plug 'jeewangue/coc-translate', {'branch': 'master'}

call plug#end()
""" PLUG END

""" Coc Extensions
let g:coc_global_extensions=[
      \ 'coc-highlight', 'coc-prettier', 'coc-html', 'coc-css', 'coc-xml',
      \ 'coc-tsserver', 'coc-eslint', 'coc-solargraph', 'coc-diagnostic',
      \ 'coc-vimlsp', 'coc-json', 'coc-git', 'coc-omnisharp', 'coc-yank',
      \ 'coc-snippets', 'coc-lists', 'coc-pyright', 'coc-deno',
      \ 'coc-markdownlint', 'coc-explorer', 'coc-docker', 'coc-yaml',
      \ 'coc-actions', 'coc-cmake', 'coc-powershell', 'coc-clangd',
      \ 'coc-lua', 'coc-sh', 'coc-phpls', 'coc-texlab', 'coc-react-refactor',
      \ 'coc-styled-components', 'coc-swagger', 'coc-emoji', 'coc-rust-analyzer', 'coc-lightbulb'
      \ ]

" vim-fugitive
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gf :Gvdiffsplit!<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gl :Commits<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" undotree
if !isdirectory($HOME."/.vim/.undodir")
  call mkdir($HOME."/.vim/.undodir", "", 0700)
endif
set undodir=~/.vim/.undodir
set undofile
nnoremap <leader>ut :UndotreeToggle<CR>:UndotreeFocus<CR>


" vim-airline
set laststatus=2
let g:airline_theme = 'base16_tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1


" vim-airline-themes
command! AirlineThemes call fzf#run({
  \ 'source':  map(split(globpath(&rtp, 'autoload/airline/themes/*.vim'), "\n"),
  \               "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \ 'sink':    'AirlineTheme',
  \ 'options': '+m --prompt="Airline Themes> "',
  \ 'down':    '~40%'
  \ })


" goyo / limelight
" map <C-g> <ESC>:Goyo<CR>

" fzf
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= " --inline-info
        \ --bind ctrl-b:preview-page-up,ctrl-f:preview-page-down,
        \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
        \shift-up:preview-half-page-up,shift-down:preview-half-page-down"
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

" fzf: All text search & unrestricted
command! -nargs=? -complete=dir AGU
      \ call fzf#vim#ag(<q-args>, '-u', fzf#vim#with_preview(), <bang>0)


" SessionsList: list sessions from obsession & procession
function! SessionsList()
    let flist = glob(fnamemodify(g:prosession_dir, ':p').'*.vim', 0, 1)
    let flist = map(flist, "fnamemodify(v:val, ':t:r')")
    let flist = map(flist, "substitute(v:val, '%', '/', 'g')")
    return flist
endfunction

" SessionsSelect: replace session
function! SessionsSelect(str)
  execute 'Prosession' a:str
endfunction

" fzf: All Sessions
command! -nargs=? -complete=dir FZFSESS
      \ call fzf#run(fzf#wrap({
      \   'source': SessionsList(),
      \   'sink': function('SessionsSelect'),
      \ }))

nnoremap <leader>, :AF<CR>
nnoremap <leader>. :AFI<CR>
nnoremap <leader>/ :Buffers<CR>
nnoremap <leader>ss :FZFSESS<CR>
" ripgrep
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>Ag :AGU<CR>

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
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <C-space>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ coc#refresh()

  inoremap <silent><expr> <C-S-space>
        \ coc#pum#visible() ? coc#pum#prev(1) :
        \ "\<ESC>:call CocAction('showSignatureHelp')\<CR>a"

  " Use <CR> to confirm completion.
  inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h ' expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  nnoremap <silent> gh :call <SID>show_documentation()<CR>
  nmap <silent> gp :call CocActionAsync('showSignatureHelp')<CR>
  imap <silent> <C-p> <ESC>:call CocActionAsync('showSignatureHelp')<CR>a

  let g:go_doc_keywordprg_enabled = 0

  augroup coc_config
    autocmd!
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END

  command! -nargs=0 Prettier :CocCommand prettier.formatFile

  nmap <leader>rn <Plug>(coc-rename)
  xmap <leader>f <Plug>(coc-format-selected)
  vmap <leader>f <Plug>(coc-format-selected)
  nmap <leader>f <Plug>(coc-format-selected)
endif

xmap <leader>fa <Plug>(coc-format)
nmap <leader>fa <Plug>(coc-format)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> <leader>ci :<C-u>CocInfo<CR>
nmap <silent> <leader>cr :<C-u>CocRestart<CR>
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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nmap <silent> <C-S-s> <Plug>(coc-range-select-backward)
xmap <silent> <C-S-s> <Plug>(coc-range-select-backward)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

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
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['deadcode','errcheck','gosimple','govet','ineffassign','staticcheck','typecheck','unused','varcheck', 'revive']

let g:go_list_height = 6
let g:go_list_autoclose = 1

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_jump_to_error = 0
let g:go_imports_autosave = 1
let g:go_term_enabled = 1
let g:go_term_mode = "vsplit"
let g:go_term_reuse = 1
let g:go_term_close_on_exit = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

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
autocmd Filetype vimwiki syntax on
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
" let g:pandoc#formatting#mode = "a"
let g:pandoc#formatting#textwidth = 120
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

" vim-doge
let g:doge_mapping = '<Leader>d'
let g:doge_doc_standard_python = 'google'

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

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

""" indent-line
" let g:indentLine_char = '|'
" let g:indentLine_conceallevel = 0
let g:indentLine_concealcursor = "n"

""" vim syntax
let g:vimsyn_folding = 'af'

""" vim-rest-console
let g:vrc_response_default_content_type = 'application/json'
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
      \ '--silent': '',
      \}
" for form data
" let g:vrc_split_request_body = 1

""" vim-floaterm
"let g:floaterm_keymap_new    = '<Leader>fc'
"let g:floaterm_keymap_prev   = '<Leader>fp'
"let g:floaterm_keymap_next   = '<Leader>fn'
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_autoclose     = '2' "always close

let g:floaterm_width         = 0.8
let g:floaterm_height        = 0.8
let g:floaterm_winblend      = 0


""" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

nmap <F2>             <Plug>VimspectorStepInto
nmap <leader><F3>      :<C-u>VimspectorReset<CR>
nmap <leader><S-F10>   <Plug>VimspectorUpFrame
nmap <leader><S-F12>   <Plug>VimspectorDownFrame

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]

""" tabular
nmap <leader>tf :<C-u>TableFormat<CR>

" Mail
command Mail e term://neomutt
augroup mailfiletype
  " Mail
  autocmd BufRead,BufNewFile *mutt-*      setfiletype mail
augroup END

" vim-shfmt
let g:shfmt_extra_args = '-i 2'
let g:shfmt_fmt_on_save = 0


""" Plugin Configuration END

augroup filetype_visual_config
  autocmd!
  autocmd Filetype cpp            setlocal ts=2 sw=2 sts=0 expandtab foldmethod=syntax foldlevel=99
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

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

augroup filetype_go_config
  autocmd FileType go nmap gota :CocCommand go.tags.add.prompt<cr>
  autocmd FileType go nmap gotj :CocCommand go.tags.add json<cr>
  autocmd FileType go nmap goty :CocCommand go.tags.add yaml<cr>
  autocmd FileType go nmap gotx :CocCommand go.tags.clear<cr>
  autocmd FileType go nmap goim :CocCommand go.impl.cursor<cr>
  autocmd FileType go nmap gorun :GoRun<cr>
augroup END

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

""" Color Scheme
let base16colorspace=256
colorscheme base16-tomorrow-night

""" Simple Shortcuts
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-n> :tabnew<CR>

nnoremap qq :<C-u>q<CR>
nnoremap qa :<C-u>qa<CR>

nnoremap ,cl0 :<C-u>set cole=0<CR>
nnoremap ,cl2 :<C-u>set cole=2<CR>

" copy the content in a visual block to clipboard
vnoremap <silent><Leader>y "cy <Bar> :call system('xclip -selection clipboard', @c)<CR>
xnoremap <silent><Leader>y "cy <Bar> :call system('xclip -selection clipboard', @c)<CR>

" disable syntax if the file size is too big.
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" scroll to bottom
autocmd TextChanged output:///* normal G

" lang host prog
let g:python_host_prog = '~/.local/share/virtualenvs/python2-RgfmKSho/bin/python'
let g:python3_host_prog = '~/.local/share/virtualenvs/python3-DPjnFJNF/bin/python'
" let g:ruby_host_prog = '~/.rvm/gems/default/bin/neovim-ruby-host'
" let g:ruby_host_prog = 'neovim-ruby-host'
let g:node_host_prog = '~/.yarn/bin/neovim-node-host'


nnoremap <silent> <leader>ds <Plug>(coc-dictd-search)
nnoremap <silent> <leader>dt <Plug>(coc-translate-word)
vnoremap <silent> <leader>dt <Plug>(coc-translate-selected)
nnoremap <silent> <leader>dl <Plug>(coc-translate-line)
