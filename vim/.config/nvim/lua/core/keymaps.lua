local map = vim.keymap.set

-- Set ',' as my leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Better split navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Resize splits with arrow keys
map('n', '<A-h>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<A-j>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<A-k>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<A-l>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Navigate tabs
map('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'New tab' })
map('n', '<leader>th', '<cmd>tabprevious<CR>', { desc = 'Tab left' })
map('n', '<leader>tl', '<cmd>tabnext<CR>', { desc = 'Tab right' })

-- Quit current buffer
map('n', '<leader>qq', '<cmd>q<CR>', { desc = 'Quit the current file' })

-- Quit all buffers
map('n', '<leader>qa', '<cmd>qa<CR>', { desc = 'Quit all files' })

-- Quick save
map('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Save the current file' })

-- Lazy keymap
map('n', '<leader>l', function()
  return require 'lazy'.home()
end, { desc = 'Open lazy.nvim' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Escape terminal mode
map('t', '<C-x>', vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), { desc = 'Escape terminal mode' })

