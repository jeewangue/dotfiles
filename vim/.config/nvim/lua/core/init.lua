---------------- options ----------------
vim.opt.laststatus   = 2
vim.opt.showmode     = false
-- vim.opt.clipboard    = 'unnamedplus'
vim.opt.cursorline   = true

-- Indentation
vim.opt.expandtab    = true
vim.opt.shiftwidth   = 2
vim.opt.tabstop      = 2
vim.opt.softtabstop  = 2
vim.opt.autoindent   = true
vim.opt.smartindent  = true
vim.opt.cindent      = true

-- Search
vim.opt.hlsearch     = true
vim.opt.incsearch    = true
vim.opt.ignorecase   = true
vim.opt.smartcase    = true
vim.opt.mouse        = 'a'

-- Encoding
vim.opt.encoding     = 'UTF-8'
vim.opt.fileencoding = 'UTF-8'
vim.opt.fileencodings:append('utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le')

-- Display
vim.opt.termguicolors  = true
vim.opt.background     = 'dark'
vim.opt.guifont        = "Hack Nerd Font:h12"
vim.opt.visualbell     = true
vim.opt.showcmd        = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wildmenu       = true
vim.opt.cmdheight      = 2
vim.opt.colorcolumn    = '+1,+2,+3' -- highlight according to textwidth
vim.opt.signcolumn     = 'auto:6'

-- Misc
vim.opt.swapfile       = true
vim.opt.hidden         = true
vim.opt.backspace      = 'indent,eol,start'
vim.opt.updatetime     = 300
vim.opt.maxmempattern  = 50000 -- 50MB for pattern matching
vim.opt.timeoutlen     = 300
vim.opt.undofile       = true

-- Leader
vim.g.mapleader        = ','
vim.g.maplocalleader   = ','


