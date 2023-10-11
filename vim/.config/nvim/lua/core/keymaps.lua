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
map('n', 'qq', '<cmd>q<CR>', { desc = 'Quit the current file' })

-- Quit all buffers
map('n', 'qa', '<cmd>qa<CR>', { desc = 'Quit all files' })

-- Quick save
map('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Save the current file' })

-- Lazy keymap
map('n', '<leader>l', function()
  return require 'lazy'.home()
end, { desc = 'Open lazy.nvim' })

-- Fold
map('n', '<space>', 'za', { desc = 'Toggle fold' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Yank to clipboard
map('n', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' })

-- Escape terminal mode
map('t', '<C-x>', vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), { desc = 'Escape terminal mode' })

------------ LSP ------------
-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
map('n', '<leader>ldt', function()
  if vim.diagnostic.is_disabled(0) then
    vim.diagnostic.enable(0)
    vim.notify('Diagnostics enabled')
  else
    vim.diagnostic.disable(0)
    vim.notify('Diagnostics disabled')
  end
end, { desc = 'LSP toggle diagnostics' })

map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<CR>', { desc = 'LSP formatting' })

map('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP code action' })
map('v', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP code action' })

-- n = {
--   ['gD'] = {
--     function()
--       vim.lsp.buf.declaration()
--     end,
--     'LSP declaration',
--   },
--
--   ['gd'] = {
--     function()
--       vim.lsp.buf.definition()
--     end,
--     'LSP definition',
--   },
--
--   ['K'] = {
--     function()
--       vim.lsp.buf.hover()
--     end,
--     'LSP hover',
--   },
--
--   ['gi'] = {
--     function()
--       vim.lsp.buf.implementation()
--     end,
--     'LSP implementation',
--   },
--
--   ['<leader>ls'] = {
--     function()
--       vim.lsp.buf.signature_help()
--     end,
--     'LSP signature help',
--   },
--
--   ['<leader>D'] = {
--     function()
--       vim.lsp.buf.type_definition()
--     end,
--     'LSP definition type',
--   },
--
--   ['<leader>ra'] = {
--     function()
--       require 'nvchad.renamer'.open()
--     end,
--     'LSP rename',
--   },
--
--   ['<leader>ca'] = {
--     function()
--       vim.lsp.buf.code_action()
--     end,
--     'LSP code action',
--   },
--
--   ['gr'] = {
--     function()
--       vim.lsp.buf.references()
--     end,
--     'LSP references',
--   },
--
--   ['<leader>f'] = {
--     function()
--       vim.diagnostic.open_float { border = 'rounded' }
--     end,
--     'Floating diagnostic',
--   },
--
--   ['[d'] = {
--     function()
--       vim.diagnostic.goto_prev { float = { border = 'rounded' } }
--     end,
--     'Goto prev',
--   },
--
--   [']d'] = {
--     function()
--       vim.diagnostic.goto_next { float = { border = 'rounded' } }
--     end,
--     'Goto next',
--   },
--
--   ['<leader>q'] = {
--     function()
--       vim.diagnostic.setloclist()
--     end,
--     'Diagnostic setloclist',
--   },
--
--   ['<leader>wa'] = {
--     function()
--       vim.lsp.buf.add_workspace_folder()
--     end,
--     'Add workspace folder',
--   },
--
--   ['<leader>wr'] = {
--     function()
--       vim.lsp.buf.remove_workspace_folder()
--     end,
--     'Remove workspace folder',
--   },
--
--   ['<leader>wl'] = {
--     function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end,
--     'List workspace folders',
--   },
-- },
--
-- v = {
--   ['<leader>ca'] = {
--     function()
--       vim.lsp.buf.code_action()
--     end,
--     'LSP code action',
--   },
-- },
