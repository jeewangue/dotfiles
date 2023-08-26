set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set guifont="Hack Nerd Font:h12"


" Add a highlight group for the FROM line in Dockerfiles
autocmd FileType dockerfile call matchadd('DockerfileFromLine', '^FROM.*$', 0)
hi DockerfileFromLine guibg=NavyBlue

