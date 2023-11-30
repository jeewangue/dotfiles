local opt = vim.opt

---------------- options ----------------
opt.laststatus = 2
opt.showmode = false

-- shortmess options
opt.shortmess:append { W = true, I = true, c = true, C = true }

-- Clipboard
-- opt.clipboard = "unnamedplus"

-- Cursor highlighting
opt.cursorline = true
opt.cursorcolumn = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.cindent = true
opt.shiftround = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- Mouse
opt.mouse = 'a'

-- Encoding
opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'
opt.fileencodings:append 'utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le'

-- Display
opt.termguicolors = true
opt.background = 'dark'
opt.guifont = 'Hack Nerd Font:h12'
opt.visualbell = true
opt.showcmd = true
opt.number = true
opt.relativenumber = true
opt.wildmenu = true
opt.cmdheight = 2
opt.colorcolumn = '+1,+2,+3' -- highlight according to textwidth

-- Columns
opt.fillchars:append [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.signcolumn = 'auto:3'

-- status column is set in statuscol.nvim plugin
-- opt.statuscolumn = '%=%l%s%C'

-- Formatting
opt.formatoptions = 'jcroqlnt'

-- Folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = '1'

-- Session
opt.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'tabpages', 'winsize', 'winpos' }

-- Misc
opt.swapfile = false
opt.hidden = true
opt.backspace = 'indent,eol,start'
opt.updatetime = 300
opt.maxmempattern = 50000 -- 50MB for pattern matching
opt.timeoutlen = 300
opt.undofile = true

-- Set diagnostic config for lsp_lines.nvim
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = true,
}

-- Set log level for LSP
-- vim.lsp.set_log_level("debug")
