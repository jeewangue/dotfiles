" Add a highlight group for the FROM line in Dockerfiles
autocmd FileType dockerfile call matchadd('DockerfileFromLine', '^FROM.*$', 0)
hi DockerfileFromLine guibg=NavyBlue

autocmd FileType dockerfile call matchadd('DockerfileImportantComment', '^###.*$', 0)
hi DockerfileImportantComment guibg=Gray24

hi CocHighlightText ctermbg=DarkBlue guibg=SlateBlue3 
