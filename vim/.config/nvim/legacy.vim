""" PLUG START
call plug#begin('~/.vim/plugged')

"--- langs ---
Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'puremourning/vimspector'
"

"--- syntax ---
Plug 'towolf/vim-helm'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jeewangue/vim-protobuf'
Plug 'google/vim-jsonnet'

"--- utils ---
Plug 'tpope/vim-haml'
Plug 'chrisbra/csv.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
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
Plug 'kshenoy/vim-signature'

call plug#end()
""" PLUG END

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

nmap <leader>op <Plug>(coc-openlink)

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


""" Plugin Configuration END

" nnoremap qq :<C-u>q<CR>
" nnoremap qa :<C-u>qa<CR>
"
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
  let markdown_content = system('xclip -o -selection clipboard -t text/html | pandoc --from=html --to=gfm --wrap=none')

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
