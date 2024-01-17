autocmd BufNewFile,BufRead *.gotmpl,*.tpl,*.tmpl,*.yaml if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
