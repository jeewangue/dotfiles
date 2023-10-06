-- Define local variables
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight text on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = '500' }
  end,
})

-- Close man and help with just <q>
autocmd('FileType', {
  pattern = { 'help', 'man', 'lspinfo', 'checkhealth' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Check for spelling in text filetypes
autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Use bash treesitter parser for zsh
augroup('ZshAsBash', {})
autocmd('FileType', {
  group = 'ZshAsBash',
  pattern = { 'sh', 'zsh' },
  command = 'silent! set filetype=sh',
})
