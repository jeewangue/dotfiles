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

-- Conceal level
map('n', '<leader>cl', function()
  if vim.wo.conceallevel == 0 then
    vim.wo.conceallevel = 2
    vim.notify 'Conceal level set to 2'
  else
    vim.wo.conceallevel = 0
    vim.notify 'Conceal level set to 0'
  end
end, { desc = 'Toggle conceal level' })

------------ LSP ------------
-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
map('n', '<leader>ldt', function()
  if vim.diagnostic.is_disabled(0) then
    vim.diagnostic.enable(0)
    vim.notify 'Diagnostics enabled'
  else
    vim.diagnostic.disable(0)
    vim.notify 'Diagnostics disabled'
  end
end, { desc = 'LSP toggle diagnostics' })

map('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP code action' })
map('v', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP code action' })

------------ Custom (PasteAsMarkdown) ------------
local function split_string(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

-- Paste from clipboard as Markdown
function PasteAsMarkdown()
  -- Check if the window is writable
  if vim.bo.readonly then
    vim.notify 'Cannot paste in a readonly window'
    return
  end

  -- Get the content of the clipboard with xclip
  local handle = io.popen(
  'xclip -o -selection clipboard -t text/html | pandoc --from=html --to=gfm-raw_html --wrap=none', 'r')
  if handle == nil then
    vim.notify 'Failed to get clipboard content'
    return
  end
  local markdown_content = handle:read '*a'
  handle:close()

  local lines = split_string(markdown_content, '\n')

  local line_num = vim.fn.line '.' or 0
  if line_num == 0 then
    vim.notify 'Failed to get current line'
    return
  end

  -- Append each line individually
  for _, line in ipairs(lines) do
    vim.fn.append(line_num, line)
    line_num = line_num + 1
  end

  -- Move the cursor to the last line of the inserted text
  vim.fn.cursor { line_num + 1, 0 }
end

map('n', '<leader>pm', function()
  PasteAsMarkdown()
end, { desc = 'Paste from clipboard as Markdown' })
