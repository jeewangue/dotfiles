local function pp(...)
  print(vim.inspect(...))
end

pp(vim.lsp.buf)

-- pp(vim.treesitter)

-- pp(vim.diagnostic.get(vim.api.nvim_get_current_buf()))
-- print(vim.inspect(vim.diagnostic.get_namespaces()))

-- pp(vim.api.nvim_get_runtime_file('', true))
-- pp(vim.env.VIMRUNTIME)
