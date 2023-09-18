""" PLUG START
call plug#begin('~/.vim/plugged')

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
Plug 'mzlogin/vim-markdown-toc'
Plug 'puremourning/vimspector'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'jupyter-vim/jupyter-vim'
Plug 'cdelledonne/vim-cmake'
" Plug 'rust-lang/rust.vim'
"

"--- syntax ---
Plug 'towolf/vim-helm'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jeewangue/vim-protobuf'
Plug 'google/vim-jsonnet'

"--- theme ---
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'rebelot/kanagawa.nvim'
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-web-devicons'

"--- syntax / autocomplete ---
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'tjdevries/coc-zsh'
Plug 'sheerun/vim-polyglot'
" Plug 'jeewangue/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}
" Plug 'jeewangue/coc-clangd', {'do': 'yarn install --frozen-lockfile'}

"--- utils ---
Plug 'tpope/vim-haml'
Plug 'chrisbra/csv.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'luochen1990/rainbow'
Plug 'skanehira/docker-compose.vim'
Plug 'greyblake/vim-preview'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
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
Plug 'jbyuki/instant.nvim'
Plug 'kassio/neoterm'


"--- kubernetes ---
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'
Plug 'andrewstuart/vim-kubernetes'

"--- my plugins ---
" Plug 'jeewangue/coc-dictd', {'branch': 'master'}
Plug 'jeewangue/coc-translate', {'branch': 'master'}

call plug#end()
""" PLUG END

""" Coc Extensions
let g:coc_global_extensions=[
      \ 'coc-highlight', 'coc-prettier', 'coc-html', 'coc-css', 'coc-xml',
      \ 'coc-tsserver', 'coc-eslint', 'coc-solargraph', 'coc-diagnostic',
      \ 'coc-vimlsp', 'coc-json', 'coc-git', 'coc-omnisharp', 'coc-yank',
      \ 'coc-snippets', 'coc-lists', 'coc-deno', 'coc-pyright', 'coc-toml',
      \ 'coc-markdownlint', 'coc-explorer', 'coc-docker', 'coc-yaml',
      \ 'coc-actions', 'coc-cmake', 'coc-powershell', 'coc-clangd',
      \ 'coc-lua', 'coc-sh', 'coc-phpls', 'coc-texlab', 'coc-react-refactor',
      \ 'coc-styled-components', 'coc-swagger', 'coc-emoji', 'coc-rust-analyzer', 'coc-lightbulb', 'coc-sql', 'coc-java'
      \ ]

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
  nmap <silent> ge :<c-u>CocCommand workspace.inspectEdit<CR>

  nmap <silent> gp :call CocActionAsync('showSignatureHelp')<CR>
  imap <silent> <C-p> <ESC>:call CocActionAsync('showSignatureHelp')<CR>a

  let g:go_doc_keywordprg_enabled = 0

  augroup coc_config
    autocmd!
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END

  command! -nargs=0 Prettier :CocCommand prettier.formatFile

  " nmap <leader>rn <Plug>(coc-rename)
  " xmap <leader>f <Plug>(coc-format-selected)
  " vmap <leader>f <Plug>(coc-format-selected)
  " nmap <leader>f <Plug>(coc-format-selected)
endif

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

xmap <leader>fa <Plug>(coc-format)
nmap <leader>fa <Plug>(coc-format)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>al <Plug>(coc-codeaction-line)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

nmap <leader>op <Plug>(coc-openlink)

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""" coc-explorer
nnoremap <silent> <leader>n :CocCommand explorer --preset panel<CR>
nnoremap <silent> <leader>ee :CocCommand explorer --preset floating<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['errcheck','gosimple','govet','ineffassign','staticcheck','typecheck','unused', 'revive']

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

" show outline (ex. Vista)
function! ToggleOutline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call CocActionAsync('hideOutline')
  endif
endfunction
nnoremap <leader>vv :call ToggleOutline()<CR>


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

""" jupyter-vim
let g:jupyter_mapkeys = 0
nnoremap <silent> <leader>jc :JupyterConnect<CR>
nnoremap <silent> <leader>jrf :JupyterRunFile<CR>
nnoremap <silent> <leader>ji :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <silent> <leader>jcd :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <silent> <leader>jrc :JupyterSendCell<CR>
nnoremap <silent> <leader>jrr :JupyterSendRange<CR>
nmap     <silent> <leader>jr <Plug>JupyterRunTextObj
vmap     <silent> <leader>jr <Plug>JupyterRunVisual

" " Debugging maps
nnoremap <buffer> <silent> <leader>jb :PythonSetBreak<CR>


""" neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1

" Use <leader>tx{text-object} in normal mode
nnoremap <leader>tx <Plug>(neoterm-repl-send)

" Send selected contents in visual mode
xnoremap <leader>tx <Plug>(neoterm-repl-send)

" Send current line in normal mode
nnoremap <leader>txx <Plug>(neoterm-repl-send-line)

" 3<leader>to will open neoterm-3
nnoremap <leader>to :<c-u>exec v:count.'Topen'<cr>

" 3<leader>tq will close neoterm-3
nnoremap <leader>tq :<c-u>exec v:count.'Tclose'<cr>

" 3<leader>tc will clear neoterm-3
nnoremap <leader>tc :<c-u>exec v:count.'Tclear'<cr>


""" Plugin Configuration END

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

""" Simple Shortcuts
" nnoremap <C-l> :tabnext<CR>
" nnoremap <C-h> :tabprevious<CR>
" nnoremap <C-n> :tabnew<CR>

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
let g:python3_host_prog = expand('~/.cache/pypoetry/virtualenvs/nvim-python3-host-prog-D0jsQcE7-py3.11/bin/python')
let g:node_host_prog = expand('~/.yarn/bin/neovim-node-host')

nnoremap <silent> <leader>ds <Plug>(coc-dictd-search)
nnoremap <silent> <leader>dt <Plug>(coc-translate-word)
vnoremap <silent> <leader>dt <Plug>(coc-translate-selected)
nnoremap <silent> <leader>dl <Plug>(coc-translate-line)

" For Types hint
highlight default CocInlayHint ctermfg=7 ctermbg=18 guifg=Khaki1 guibg=Grey19


function! PandocPasteMarkdown()
  " Get the content of the clipboard with xclip
  let markdown_content = system('xclip -o -selection clipboard -t text/html | pandoc --from=html --to=gfm-raw_html --wrap=none')

  " Split the converted Markdown content into lines
  let lines = split(markdown_content, '\n')

  " Insert the lines into the buffer after the current line
  let line_number = line('.')
  call append(line_number, lines)

  " Move the cursor to the last line of the inserted text
  let last_line_number = line_number + len(lines) - 1
  call cursor(last_line_number + 1, 0)
endfunction

" Map PandocPaste function
nnoremap <silent> <leader>pm :<C-u>call PandocPasteMarkdown()<CR>

""" delete all buffers except current one
nnoremap <silent> <leader>bd :<C-u>%bd\|e#<cr>

augroup custom_colors
  autocmd!

  " Add a highlight group for the FROM line in Dockerfiles
  autocmd FileType dockerfile call matchadd('DockerfileFromLine', '^FROM.*$', 0)
  hi DockerfileFromLine guibg=NavyBlue

  " Add a highlight group for the important comments in Dockerfiles
  autocmd FileType dockerfile call matchadd('DockerfileImportantComment', '^###.*$', 0)
  hi DockerfileImportantComment guibg=Gray24

  hi CocHighlightText guibg=firebrick4
augroup END

nm <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>